COMBATENGINE_VERSION = 55
--CombatEngine by Neoraxer
COMBATENGINE_CASTING = false;
COMBATENGINE_LOADED = false;
CE_FIRST_LOAD = false;
--Tabla global
if(_G and not _G.C_Engine) then
	_G.C_Engine = {
		name = "C_Engine",
		Frames = {"CE_Frame",},
	};
end
C_EngineSettings = {}
C_EngineSettings_newVars = {}
--Define una tabla para la posición del botón
local CE_DEFAULT_POS_BUTTON = {
	["point"] = "CENTER",
	["relativePoint"] = "CENTER",
	["relativeTo"] = "MinimapViewFrame",
	["offsetX"] = -80,
	["offsetY"] = 90,
}
-- Curated healing thresholds (avoid magic numbers in health checks)
local CE_HEALING_THRESHOLDS = {
	UNIVERSAL = 0.40,
	PHIRIUS_B = 0.60,
	HERB_HIGH_LVL = 0.80,
}

-- Common helpers
local function CE_safeLoadFile(path, errorPrefix)
	local prefix = errorPrefix or "Error al cargar el archivo: "
	local success, err = pcall(function()
		local loadedFile, loadError = loadfile(path)
		if not loadedFile then
			DEFAULT_CHAT_FRAME:AddMessage(prefix .. loadError)
			return
		end
		setfenv(loadedFile, _G)
		loadedFile()
	end)
	if not success then
		DEFAULT_CHAT_FRAME:AddMessage(prefix .. err)
	end
	return success
end

local function CE_PlayerHealthRatio()
	local hp = UnitHealth("player")
	local maxHp = UnitMaxHealth("player")
	if not hp or not maxHp or maxHp == 0 then
		return nil
	end
	return hp / maxHp
end

local function CE_targetIsAttackable()
	if not UnitExists("target") then return false end
	if UnitIsDeadOrGhost("target") then return false end
	if UnitLevel("target") < 2 then return false end
	return UnitCanAttack("player", "target")
end

local function CE_toggleButtonPair(offButton, onButton, isOn)
	if not offButton or not onButton then return end
	if isOn then
		offButton:Hide()
		onButton:Show()
	else
		offButton:Show()
		onButton:Hide()
	end
end

local function CE_setLockable(button, lock)
	if not button then return end
	if lock and button.LockPushed then
		button:LockPushed()
	elseif button.UnlockPushed then
		button:UnlockPushed()
	end
end

local CE_TOGGLE_CONFIG = {
	AOE = { setting="AOE", global="CE_AOE_ON", lock="CE_ART_QUICK_AOE", button="CE_BUTTON_AOE", kind="check" },
	Consumables = { setting="Consumables", global="CE_CONSUMABLES_ON", lock="CE_ART_QUICK_CONSUMABLES", button="CE_BUTTON_CONSUMABLES", kind="check" },
	FastBuffs = { setting="FastBuffs", global="CE_FASTBUFFS_ON", lock="CE_ART_QUICK_BUFFS", button="CE_BUTTON_FAST_BUFFS", kind="check" },
}

local function CE_setToggle(name, enabled)
	local cfg = CE_TOGGLE_CONFIG[name]
	if not cfg then return end
	local state = enabled == true
	if C_EngineSettings then
		C_EngineSettings[cfg.setting] = state
	end
	_G[cfg.global] = state
	CE_setLockable(_G[cfg.lock], state)
	if cfg.kind == "check" then
		local btn = _G[cfg.button]
		if btn then
			btn:SetChecked(state)
			btn:Show()
		end
	else
		CE_toggleButtonPair(_G[cfg.off], _G[cfg.on], state)
	end
end

function CE_SetAoEState(enabled)
	CE_setToggle("AOE", enabled)
end

function CE_SetConsumablesState(enabled)
	CE_setToggle("Consumables", enabled)
end

function CE_SetFastBuffsState(enabled)
	CE_setToggle("FastBuffs", enabled)
end

function CE_UpdateToggleButtons()
	CE_setToggle("AOE", _G.CE_AOE_ON)
	CE_setToggle("Consumables", _G.CE_CONSUMABLES_ON)
	CE_setToggle("FastBuffs", _G.CE_FASTBUFFS_ON)
end

local function CE_FastBuffsTooltipHeader(isEnabled)
	if GetLanguage() == "ES" then
		return (isEnabled and "|cffffd700" or "|cff808080") .. "Buffs:"
	else
		return (isEnabled and "|cffffd700" or "|cff808080") .. "Buffs:"
	end
end

local function CE_FastBuffsNoData()
	if GetLanguage() == "ES" then
		return "|cff808080No hay buffos rápidos disponibles"
	end
	return "|cff808080No fast buffs available"
end

local CE_FASTBUFFS = {
	BARD = {
		DRUID   = {1491345},
		THIEF   = {1491345,1491135,1491103},
		RANGER  = {1491345,1491103},
		WARDEN  = {1491345,493406,1491175,1491103},
		WARRIOR = {1491345,490095,490492,1491103,1491117},
		MAGE    = {1491345,1491103},
		PSYRON  = {1491103},
		HARPSYN = {1491103,1491190},
	},
	DRUID = {
		HARPSYN = {493548,1490765},
		WARRIOR = {493548,490095,490492,494930},
	},
	KNIGHT = {
		HARPSYN = {490192,1490508},
		WARDEN  = {493406},
	},
	MAGE = {
		AUGUR   = {493265,499609,492633},
		WARRIOR = {492942,490492,491565,491156},
		WARDEN  = {491156,1490308,494926,491171},
		DRUID   = {490251},
		RANGER  = {491156,492926},
		HARPSYN = {490251,491156,1491841},
		PSYRON  = {498869,491156,498825,498873},
	},
	WARDEN = {
		MAGE   = {493406,499892},
		RANGER = {493406},
	},
	AUGUR = {
		WARRIOR = {1490348,490492},
	},
	WARRIOR = {
		BARD    = {1490348,490492},
		MAGE    = {1490350,490492},
		RANGER  = {1490350,490492},
		WARDEN  = {1490350,490492,493406},
		HARPSYN = {490095,490492},
		AUGUR   = {492999,499992,490492},
		THIEF   = {490492},
	},
	HARPSYN = {
		PSYRON  = {498673,498677,1492465},
		MAGE    = {498711,1492465},
		WARRIOR = {1490348,490492,1492465},
		THIEF   = {1492465},
	},
	RANGER = {
		BARD    = {1491220},
		MAGE    = {491510},
		AUGUR   = {491335},
		WARDEN  = {493406},
		WARRIOR = {1490348,490492},
		KNIGHT  = {493016},
		HARPSYN = {1490456},
	},
	THIEF = {
		PSYRON  = {498828},
		BARD    = {1491237},
		DRUID   = {494548,499567},
		AUGUR   = {492921,491536},
		WARRIOR = {490095,490492},
		RANGER  = {499482,491528},
		KNIGHT  = {1492417,492924,491552,492629},
	},
}

function CE_FASTBUFFS_OnEnter(button, isEnabled)
	if not button then return end
	local lineColor = isEnabled and "|cff80ff00" or "|cff808080"
	GameTooltip:SetOwner(button, "ANCHOR_TOP", 0, 0)
	GameTooltip:ClearAllAnchors()
	GameTooltip:SetAnchor("BOTTOMLEFT", "TOPLEFT", button, 0, 0)
	GameTooltip:SetText(CE_FastBuffsTooltipHeader(isEnabled))

	local function addLine(id, color)
		GameTooltip:AddLine((color or lineColor) .. CE_toName(id))
	end

	local main = _G.CE_MAIN_FOR_UI or ""
	local sec = _G.CE_SEC_FOR_UI or ""

	local entry = CE_FASTBUFFS[main] and CE_FASTBUFFS[main][sec]
	if entry and #entry > 0 then
		for _, id in ipairs(entry) do
			if type(id) == "table" then
				addLine(id.id, id.color)
			else
				addLine(id)
			end
		end
	else
		GameTooltip:AddLine(CE_FastBuffsNoData())
	end
	GameTooltip:Show()
end

local CE_AOE_SKILLS = {
	KNIGHT = {
		HARPSYN = {1490843,1490842,490359,1490838,490241},
		WARDEN = {493642,490241},
	},
	THIEF = {
		HARPSYN = {490345},
		AUGUR = {490345,493260},
		WARRIOR = {490345,499477,492625,499481},
		RANGER = {490345,491532},
		PSYRON = {490345,498833,498834},
		BARD = {490345,1491231},
		DRUID = {490345,499569,1490287},
		KNIGHT = {490345,490185,491553,493025},
		MAGE = {497205,491183,490345,491180},
		WARDEN = {490345,494571},
	},
	RANGER = {
		MAGE = {491509,1491045,1491042,1491046},
		DRUID = {499585,490457,499583},
		BARD = {490400,1491472},
		AUGUR = {490400,490457},
		WARDEN = {490400,490457,499751,494629},
		WARRIOR = {490400,490457},
		THIEF = {493008,499535},
		KNIGHT = {490431,493016,491516},
		PSYRON = {1490445,1490772,490400},
		HARPSYN = {1490799,1490797,1490794,1490791},
	},
	HARPSYN = {
		THIEF = {498547,497959,497966,490444},
		WARRIOR = {498547,497959,497966,490444},
		PSYRON = {498547,497959,497966,490444},
		MAGE = {498547,497959,497966},
		RANGER = {"UNITARGET"},
		BARD = {490444,498547,497959,497966},
		WARDEN = {490444,498547,497959,497966},
	},
	MAGE = {
		THIEF = {491172},
		AUGUR = {490244,490243,491172,491589,492928},
		WARRIOR = {1490679,1491031,490242},
		KNIGHT = {490244,493036,499613,490242,490243},
		WARDEN = {490244,494330,491172},
		DRUID = {499623,490243,1491830,491172},
		RANGER = {490243,490244,491172,491171},
		HARPSYN = {1491817,490244},
		PSYRON = {498868,498864,490244,490252},
	},
	BARD = {
		WARDEN = {1491173,1491170,1491100,1491384},
		RANGER = {1491121},
		WARRIOR = {1491111},
		THIEF = {1491135,1491134,1491338,1491133},
		DRUID = {1491186,1491388,493540,1491183,1491184},
		MAGE = {1491144,1491141,1491340},
		PSYRON = {1491204,1491203,1491100,498534},
		HARPSYN = {497966,497959,1491100},
	},
	DRUID = {
		WARRIOR = {494016,490133},
		HARPSYN = {1490764,1490761,497966,1490763},
	},
	WARDEN = {
		PSYRON = {1490526,493394,850154,498534,1490847,1490855,493392,503958},
		RANGER = {493394},
		MAGE = {493394,1490847},
	},
	AUGUR = {
		WARRIOR = {1490366},
	},
	WARRIOR = {
		MAGE = {1490322,1490346},
		HARPSYN = {498707,498742,498741,497959,498739},
		WARDEN = {490133,490121,490147,494625,493392},
		RANGER = {490133,491453,490147},
		BARD = {1491541,1491211,1491539},
		THIEF = {493282,1490425,490147},
		AUGUR = {1491760,490133,490121,490147},
	},
}

local function CE_AoeTooltipHeader(isEnabled)
	local color = isEnabled and "|cffffd700" or "|cff808080"
	return color .. _G.CE_LANG.Tooltip.AoeSkills .. "|r"
end

local function CE_AoeTooltipNoData()
	if GetLanguage() == "ES" then
		return "|cff808080No hay habilidades disponibles"
	end
	return "|cff808080No skills available"
end

function CE_AOE_OnEnter(button, isEnabled)
	if not button then return end
	local color = isEnabled and "|cff80ff00" or "|cff808080"
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0)
	GameTooltip:ClearAllAnchors()
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0)
	GameTooltip:SetText(CE_AoeTooltipHeader(isEnabled))

	local function add(entry)
		if entry == "UNITARGET" then
			GameTooltip:AddLine(color .. "Unitarget")
		else
			GameTooltip:AddLine(color .. CE_toName(entry))
		end
	end

	local main = _G.CE_MAIN_FOR_UI
	local sec = _G.CE_SEC_FOR_UI
	local mainData = CE_AOE_SKILLS[main or ""]
	local list = mainData and mainData[sec or ""]
	if list and #list > 0 then
		for _, entry in ipairs(list) do add(entry) end
	else
		GameTooltip:AddLine(CE_AoeTooltipNoData())
	 end
	GameTooltip:Show()
end

-- Button: Custom preset (moved from XML)
function CE_ButtonCustom_OnLoad(button)
	if not button then return end
	local localeIsPL = GetLanguage() == "PL"
	local tex = localeIsPL and "Custom_PL" or "Custom_EN"
	button:GetNormalTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
	button:GetPushedTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
	button:GetHighlightTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
end

function CE_ButtonCustom_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0)
	GameTooltip:SetText("|cffFF5733" .. _G.CE_LANG.Tooltip.Custom .. ":|r", 1, 0.34, 0.2)
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.ButtonCustom)
	GameTooltip:AddSeparator()
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.ButtonEdit)
	GameTooltip:Show()
end

function CE_ButtonCustom_OnClick(button)
	CE_CustomEngine_OnClicButton(button)
end

function CE_ButtonCustom_OnDoubleClick()
	if not COMBATENGINE_EDIT_LUA:IsVisible() then
		PlaySoundByPath("interface\\addons\\CombatEngine\\sfx\\01.mp3")
	end
	COMBATENGINE_EDIT_LUA:Show()
end

function CE_ButtonCustom_OnLeave()
	GameTooltip:Hide()
end

-- Button: Default preset
function CE_ButtonDefault_OnLoad(button)
	if not button then return end
	local localeIsPL = GetLanguage() == "PL"
	local tex = localeIsPL and "Default_PL" or "Default_EN"
	button:GetNormalTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
	button:GetPushedTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
	button:GetHighlightTexture():SetTexture("Interface\\addons\\CombatEngine\\texture\\Custom\\" .. tex .. ".tga")
end

function CE_ButtonDefault_OnShow()
	if CE_CustomEngine_SetButtons then
		CE_CustomEngine_SetButtons();
	end
end

function CE_ButtonDefault_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0)
	GameTooltip:SetText("|cffB9F63C" .. _G.CE_LANG.Tooltip.Default .. ":|r", 0.72, 0.96, 0.23)
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.DefaultInfo)
	GameTooltip:Show()
end

function CE_ButtonDefault_OnClick(button)
	CE_CustomEngine_OnClicButton(button)
end

function CE_ButtonDefault_OnLeave()
	GameTooltip:Hide()
end

-- Button: Info
function CE_ButtonInfo_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0)
	GameTooltip:ClearAllAnchors()
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0)
	GameTooltip:SetText("|cff00FFFF" .. _G.CE_LANG.Tooltip.Info .. "|r")
	GameTooltip:Show()
end

function CE_ButtonInfo_OnClick()
	if CE_INFO_CLASS == false then
		CE_SET_TEXT_JUST_CLASS(LINE_CE_INFO_TITTLE)
		CE_INFO_TEXT(LINE_CE_INFO_BODY)
		CE_FRAME_INFO_CLASS:Show()
		_G.CE_INFO_CLASS = true
	else
		CE_FRAME_INFO_CLASS:Hide()
		_G.CE_INFO_CLASS = false
	end
end

function CE_ButtonInfo_OnLoad()
	_G.CE_INFO_CLASS = false
end

function CE_ButtonInfo_OnLeave()
	GameTooltip:Hide()
end

-- Button: Tools
function CE_ButtonTools_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0);
	GameTooltip:SetText("|cff00FFFF" .. TEXT("SYS_ITEMTYPE_13") .. "|r" );
	GameTooltip:Show();
end

function CE_ButtonTools_OnClick()
	if CE_FRAME_UTILITIES then
		CE_FRAME_UTILITIES:Show();
	end
end

function CE_ButtonTools_OnLeave()
	GameTooltip:Hide();
end

-- AutoTarget checkbox
function CE_AutoTarget_OnLoad(button)
	if not button or not button.Text then return end
	button.Text:SetText(_G.CE_LANG.Main.AutoTarget)
end

function CE_AutoTarget_OnShow(button)
	if not button then return end
	button:SetChecked(C_EngineSettings_newVars.AutoTarget)
end

function CE_AutoTarget_OnClick(button)
	if not button then return end
	C_EngineSettings_newVars.AutoTarget = not C_EngineSettings_newVars.AutoTarget
	button:SetChecked(C_EngineSettings_newVars.AutoTarget)
end

-- Consumables tooltip
local CE_CONSUMABLES_ITEMS = {
	{ id = 1244064, on="|cff80ff00", off="|cff808080" }, -- Poción del enano
	{ id = 1244060, on="|cff80ff00", off="|cff808080" }, -- Costilla de primera
	{ id = 200173,  on="|cff80ff00", off="|cff808080" }, -- Estimulante fuerte
	{ id = 1244062, on="|cff80ff00", off="|cff808080" }, -- Poción de velocidad élfica
	{ id = 200192,  on="|cffff66cc", off="|cff808080" }, -- Agua de los espiritus
	{ id = 1244059, on="|cffff66cc", off="|cff808080" }, -- Papas de col rizadas
	{ id = 1244063, on="|cffff66cc", off="|cff808080" }, -- Frasco de espíritu élfico
	{ id = 202153,  on="|cff0000ff", off="|cff808080" }, -- Universal
	{ id = 203495,  on="|cff0000ff", off="|cff808080" }, -- Phirius tipo B
	{ id = 203503,  on="|cff00FFFF", off="|cff808080" }, -- Poción de mana tipo E
}

function CE_Consumables_OnEnter(button, isEnabled)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0);
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0);
	local headerColor = isEnabled and "|cffffd700" or "|cff808080"
	GameTooltip:SetText(headerColor .. _G.CE_LANG.Tooltip.Consumables .. "|r");
	for _, entry in ipairs(CE_CONSUMABLES_ITEMS) do
		local color = isEnabled and entry.on or entry.off
		GameTooltip:AddLine(color .. CE_toName(entry.id));
	end
	GameTooltip:Show();
end

-- Macro copy button
local function CE_Macro_SetHighlightAlpha(mode)
	if FIL_3_COL_1_H and FIL_3_COL_2_H then
		FIL_3_COL_1_H:SetAlphaMode(mode)
		FIL_3_COL_2_H:SetAlphaMode(mode)
	end
end

function CE_ButtonMacro_OnEnter()
	CE_Macro_SetHighlightAlpha("ADD")
end

function CE_ButtonMacro_OnClick()
	CE_COPY_MACRO()
end

function CE_ButtonMacro_OnMouseDown()
	CE_Macro_SetHighlightAlpha("BLEND")
end

function CE_ButtonMacro_OnMouseUp()
	CE_Macro_SetHighlightAlpha("ADD")
end

function CE_ButtonMacro_OnLeave()
	CE_Macro_SetHighlightAlpha("BLEND")
end

-- Tools button
function CE_ButtonTools_OnEnter_LUA(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0);
	GameTooltip:SetText("|cff00FFFF" .. TEXT("SYS_ITEMTYPE_13") .. "|r" );
	GameTooltip:Show();
end

function CE_ButtonTools_OnClick_LUA()
	if CE_FRAME_UTILITIES then
		CE_FRAME_UTILITIES:Show();
	end
end

function CE_ButtonTools_OnLeave_LUA()
	GameTooltip:Hide();
end

-- Macro copy button
function CE_ButtonMacro_OnEnter_LUA()
	CE_Macro_SetHighlightAlpha("ADD")
end

function CE_ButtonMacro_OnClick_LUA()
	CE_COPY_MACRO()
end

function CE_ButtonMacro_OnMouseDown_LUA()
	CE_Macro_SetHighlightAlpha("BLEND")
end

function CE_ButtonMacro_OnMouseUp_LUA()
	CE_Macro_SetHighlightAlpha("ADD")
end

function CE_ButtonMacro_OnLeave_LUA()
	CE_Macro_SetHighlightAlpha("BLEND")
end

-- Art button (class support tooltip)
function CE_Art_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_CENTER",0,0);
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("CENTER","CENTER",button,0,0);
	GameTooltip:SetText(_G.CE_LANG.Tooltip.ClassSupport);
	GameTooltip:Show();
end

-- Main button (minimap toggle)
function CE_MainButton_OnEnter(button)
	if not button then return end
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0);
	local txt="|cff00ff00Combat Engine"
	GameTooltip:SetText(txt)
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.ButtonShow);
	GameTooltip:AddSeparator();
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.ButtonToggle);
	GameTooltip:Show();
end

function CE_MainButton_OnLoad(button)
	if not button then return end
	button:RegisterForClicks("LeftButton", "RightButton");
end

function CE_MainButton_OnClick(button)
	if not button then return end
	if button:IsButtonPushed("LeftButton") then
		CE_SET_TEXT_CLASS(CE_STRING_PLAYIN_CLASS)
		if SHOW_OPTIONS_CE == false then
			CE_SET_TEXT_JUST_CLASS(LINE_CE_INFO_TITTLE)
			CE_INFO_TEXT(LINE_CE_INFO_BODY)
			CE_Frame2:Show()
			SHOW_OPTIONS_CE = true
		else
			CE_Frame2:Hide()
			SHOW_OPTIONS_CE = false
		end
		CE_UpdateToggleButtons();
	elseif button:IsButtonPushed("RightButton") then
		if CE_STATE_QUICKBAR_B and CE_STATE_QUICKBAR_B.active then
			CE_FRAME_FAST_ROGUE_BACKGROUND:Hide()
			CE_STATE_QUICKBAR_B.active = false
		elseif CE_STATE_QUICKBAR_B then
			CE_FRAME_FAST_ROGUE_BACKGROUND:Show()
			CE_STATE_QUICKBAR_B.active = true
		end
	end
end

function CE_MainButton_OnMouseDown(button)
	if not button then return end
	if IsShiftKeyDown() then
		button:StartMoving("TOPLEFT");
	end
end

function CE_MainButton_OnMouseUp(button)
	if not button then return end
	button:StopMovingOrSizing();
	CE_SAVE_BUTTON_POS();
end

function CE_MainButton_OnLeave()
	GameTooltip:Hide();
end

-- Utilities: cleaner buttons and toggles
local function CE_ShowTooltip(button, title, lines)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0)
	GameTooltip:ClearAllAnchors()
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0)
	if title then GameTooltip:SetText(title) end
	if lines then
		for _, line in ipairs(lines) do
			GameTooltip:AddLine(line)
		end
	end
	GameTooltip:Show()
end

local function CE_ColorItems(list, enabledColor, disabledColor, enabled)
	local out = {}
	for _, id in ipairs(list) do
		local color = enabled and enabledColor or disabledColor
		table.insert(out, color .. CE_toName(id))
	end
	return out
end

function CE_ButtonCleanRunes_OnLoad(button)
	if not button then return end
	CombatEngine_Cleaner_OnLoad(button)
	CE_BUTTON_CLEAN_RUNES_TEXT:SetText(_G.CE_LANG.DeleteTrash.Runes)
	button:SetChecked(COMBATENGINE_DELETE.runes)
end

function CE_ButtonCleanRunes_OnShow(button)
	if not button then return end
	button:SetChecked(COMBATENGINE_DELETE.runes)
end

function CE_ButtonCleanRunes_OnEvent(button, event)
	CombatEngine_Cleaner_OnEvent(button, event)
end

function CE_ButtonCleanRunes_OnClick(button)
	COMBATENGINE_DELETE.runes = not COMBATENGINE_DELETE.runes
	local title = _G.CE_LANG.DeleteTrash.RunesInfo
	local color = COMBATENGINE_DELETE.runes and "|cff00ff00" or "|cff808080"
	CE_ShowTooltip(button, title, { color .. _G.CE_LANG.DeleteTrash.Runes })
end

function CE_ButtonCleanRunes_OnEnter(button)
	local title = _G.CE_LANG.DeleteTrash.RunesInfo
	local color = COMBATENGINE_DELETE.runes and "|cff00ff00" or "|cff808080"
	CE_ShowTooltip(button, title, { color .. _G.CE_LANG.DeleteTrash.Runes })
end

function CE_ButtonCleanRunes_OnLeave()
	GameTooltip:Hide()
end

local CE_PROD_ITEMS = {200853,200851,200850,200852,200855,200854}

function CE_ButtonCleanProd_OnLoad(button)
	if not button then return end
	CE_BUTTON_CLEAN_PROD_TEXT:SetText(_G.CE_LANG.DeleteTrash.Production)
	button:SetChecked(COMBATENGINE_DELETE.production)
end

function CE_ButtonCleanProd_OnShow(button)
	if not button then return end
	button:SetChecked(COMBATENGINE_DELETE.production)
end

local function CE_ButtonCleanProd_ShowTooltip(button)
	local lines = CE_ColorItems(CE_PROD_ITEMS, "|cff80ff00", "|cffCDCDCD", COMBATENGINE_DELETE.production)
	CE_ShowTooltip(button, "Item:", lines)
end

function CE_ButtonCleanProd_OnClick(button)
	COMBATENGINE_DELETE.production = not COMBATENGINE_DELETE.production
	CE_ButtonCleanProd_ShowTooltip(button)
end

function CE_ButtonCleanProd_OnEnter(button)
	CE_ButtonCleanProd_ShowTooltip(button)
end

function CE_ButtonCleanProd_OnLeave()
	GameTooltip:Hide()
end

local CE_GUILD_ITEMS = {202916,202917}

function CE_ButtonCleanGuild_OnLoad(button)
	if not button then return end
	CE_BUTTON_CLEAN_GUILD_TEXT:SetText(_G.CE_LANG.DeleteTrash.Guild)
	button:SetChecked(COMBATENGINE_DELETE.guild)
end

function CE_ButtonCleanGuild_OnShow(button)
	if not button then return end
	button:SetChecked(COMBATENGINE_DELETE.guild)
end

local function CE_ButtonCleanGuild_ShowTooltip(button)
	local lines = CE_ColorItems(CE_GUILD_ITEMS, "|cff80ff00", "|cffCDCDCD", COMBATENGINE_DELETE.guild)
	CE_ShowTooltip(button, "Item:", lines)
end

function CE_ButtonCleanGuild_OnClick(button)
	COMBATENGINE_DELETE.guild = not COMBATENGINE_DELETE.guild
	CE_ButtonCleanGuild_ShowTooltip(button)
end

function CE_ButtonCleanGuild_OnEnter(button)
	CE_ButtonCleanGuild_ShowTooltip(button)
end

function CE_ButtonCleanGuild_OnLeave()
	GameTooltip:Hide()
end

function CE_ButtonCleanLow_OnLoad(button)
	if not button then return end
	CE_BUTTON_CLEAN_LOW_TEXT:SetText(_G.CE_LANG.DeleteTrash.Low)
	button:SetChecked(COMBATENGINE_DELETE.low)
end

function CE_ButtonCleanLow_OnShow(button)
	if not button then return end
	button:SetChecked(COMBATENGINE_DELETE.low)
end

function CE_ButtonCleanLow_OnClick(button)
	COMBATENGINE_DELETE.low = not COMBATENGINE_DELETE.low
end

function CE_ButtonCleanLow_OnEnter() end
function CE_ButtonCleanLow_OnLeave() end

function CE_ButtonShowDura_OnLoad(button)
	if not button then return end
	CE_BUTTON_SHOW_DURA_TEXT:SetText(_G.CE_LANG.Main.ShowDurability)
	button:SetChecked(CE_SHOW_DURA)
end

function CE_ButtonShowDura_OnShow(button)
	if not button then return end
	button:SetChecked(CE_SHOW_DURA)
end

function CE_ButtonShowDura_OnClick(button)
	CE_SHOW_DURA = not CE_SHOW_DURA
	CE_durability_UpdateValues()
end

function CE_ButtonShowStats_OnLoad(button)
	if not button then return end
	CE_CustomPreset_OnLoad(button)
end

function CE_ButtonShowStats_OnEvent(button, event)
	CE_CustomPreset_OnEvent(button, event)
end

function CE_ButtonShowStats_OnShow(button)
	if not button then return end
	button:SetChecked(CE_SHOW_TARGET_STATS)
end

function CE_ButtonShowStats_OnClick(button)
	CE_SHOW_TARGET_STATS = not CE_SHOW_TARGET_STATS
	CE_CustomPreset_CheckSystem();
end

-- Utilities frame
function CE_FrameUtilities_OnLoad(frame)
	if CE_FRAME_UTILITIES_Title then
		CE_FRAME_UTILITIES_Title:SetText("|cff00FFFF" .. TEXT("SYS_ITEMTYPE_13") .. "|r")
	end
end

-- Close buttons common
function CE_GenericClose_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button,"ANCHOR_CENTER",0,0);
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("CENTER","CENTER",button,0,0);
	GameTooltip:SetText(TEXT("C_CLOSE"));
	GameTooltip:Show();
end

function CE_GenericClose_OnClick(button)
	if not button or not button:GetParent() then return end
	button:GetParent():Hide();
end

function CE_GenericClose_OnLeave()
	GameTooltip:Hide();
end

-- Main frame (XML root) handlers
function CE_MainFrame_OnHide()
	COMBATENGINE_EDIT_LUA_CONDITIONS:Hide()
	COMBATENGINE_EDIT_LUA:Hide()
end

function CE_MainFrame_OnLoad(frame)
	CE_OnLoad(frame)
end

function CE_MainFrame_OnEvent(event, arg1)
	CE_OnLoad_Event(event, arg1)
	if event == "VARIABLES_LOADED" then
		_G.SHOW_OPTIONS_CE = false;
		if not _G.CE_AOE_ON or _G.CE_AOE_ON == nil then _G.CE_AOE_ON = false end
		if not _G.CE_CONSUMABLES_ON or _G.CE_CONSUMABLES_ON == nil then _G.CE_CONSUMABLES_ON = false end
		if not _G.CE_FASTBUFFS_ON or _G.CE_FASTBUFFS_ON == nil then _G.CE_FASTBUFFS_ON = false end
		CE_UpdateToggleButtons();
	end
end

-- Title drag handlers
function CE_FrameTitle_OnMouseDown()
	CE_Frame2:StartMoving("TOPLEFT");
end

function CE_FrameTitle_OnMouseUp()
	CE_Frame2:StopMovingOrSizing();
end

-- Close button toggle for the main window
function CE_ButtonClose_OnClick()
	if SHOW_OPTIONS_CE == false then
		CE_Frame2:Show()
		SHOW_OPTIONS_CE = true
	else
		CE_Frame2:Hide()
		SHOW_OPTIONS_CE = false
	end
end

-- Close-info button handlers (moved from XML)
function CE_ButtonCloseInfo_OnEnter(button)
	if not button then return end
	GameTooltip:SetOwner(button, "ANCHOR_CENTER", 0, 0)
	GameTooltip:ClearAllAnchors()
	GameTooltip:SetAnchor("CENTER", "CENTER", button, 0, 0)
	GameTooltip:SetText(TEXT("C_CLOSE"))
	GameTooltip:Show()
end

function CE_ButtonCloseInfo_OnClick()
	if _G.CE_INFO_CLASS == false then
		CE_FRAME_INFO_CLASS:Show()
		_G.CE_INFO_CLASS = true
	else
		CE_FRAME_INFO_CLASS:Hide()
		_G.CE_INFO_CLASS = false
	end
end

function CE_ButtonCloseInfo_OnLeave()
	GameTooltip:Hide()
end

-- Elemental tooltips (shared)
local CE_ELEMENT_LABELS = {
	Oscuridad = { es="|cff7777ecDaño oscuro", en="|cff7777ecDark damage", color="|cff7777ec" },
	Veneno    = { es="|cff66cc1aDaño veneno", en="|cff66cc1aPoison damage", color="|cff66cc1a" },
	Fuego     = { es="|cffFF7F00Daño fuego",  en="|cffFF7F00Fire damage",  color="|cffFF7F00" },
	Viento    = { es="|cff87CEEBDaño viento", en="|cff87CEEBWind damage", color="|cff87CEEB" },
	Tierra    = { es="|cff977254Daño tierra", en="|cff977254Earth damage", color="|cff977254" },
	Agua      = { es="|cff009fdfDaño agua",   en="|cff009fdfWater damage", color="|cff009fdf" },
	Luz       = { es="|cfffaf3d4Daño luz",    en="|cfffaf3d4Light damage", color="|cfffaf3d4" },
}

function CE_Elemental_OnEnter(button, key)
	if not button or not key then return end
	CE_UPDATE_ELEMENTAL_DAMAGE()
	GameTooltip:SetOwner(button,"ANCHOR_TOP",0,0);
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",button,0,0);
	local label = CE_ELEMENT_LABELS[key]
	local txt = nil
	if label then
		txt = (GetLanguage() == "ES") and label.es or label.en
	end
	if txt then GameTooltip:SetText(txt) end
	local val = (_G.CE_ELEMENT and _G.CE_ELEMENT[key]) or 0
	local lineColor = (label and label.color) or "|cffffffff"
	GameTooltip:AddLine(string.format("%s%s%%", lineColor, tostring((val or 0) - 200)));
	GameTooltip:Show();
end

function CE_Elemental_OnLeave()
	GameTooltip:Hide();
end

function CE_Art_OnLeave()
	GameTooltip:Hide();
end

local function GetClassIdByToken(token)
	local id = {
		WARRIOR = 1,
		RANGER = 2,
		THIEF = 3,
		MAGE = 4,
		AUGUR = 5,
		KNIGHT = 6,
		DRUID = 8,
		HARPSYN = 9,
		PSYRON = 10,
		BARD = 12,
		WARDEN = 7,
	}
	return id[token]
end

local function CE_Art_FormatClass(token)
	local id = GetClassIdByToken(token)
	local name, token, color = GetClassInfoByID(id)
	return "|c" .. color .. name .. "|r"
end

-- Build Supported Classes tooltip (port from XML)
function CE_Art_OnClick()
	local tokens = {
		WARRIOR="WARRIOR", RANGER="RANGER", THIEF="THIEF", MAGE="MAGE", AUGUR="AUGUR",
		KNIGHT="KNIGHT", DRUID="DRUID", HARPSYN="HARPSYN", PSYRON="PSYRON", BARD="BARD", WARDEN="WARDEN",
	}
	local fmt = CE_Art_FormatClass
	local explo = fmt("RANGER")
	local pica = fmt("THIEF")
	local mago = fmt("MAGE")
	local brujo = fmt("HARPSYN")
	local guerrero = fmt("WARRIOR")
	local druida = fmt("DRUID")
	local alca = fmt("WARDEN")
	local camper = fmt("PSYRON")
	local bardo = fmt("BARD")
	local sacer = fmt("AUGUR")
	local caba = fmt("KNIGHT")

	GameTooltip:SetOwner(CE_ART,"ANCHOR_TOP",0,0);
	GameTooltip:ClearAllAnchors();
	GameTooltip:SetAnchor("BOTTOMLEFT","TOPLEFT",CE_ART,0,0);
	GameTooltip:SetText("|cffffd700" .. _G.CE_LANG.Tooltip.SupportedClasses .. "|r");

	-- ROGUE
	GameTooltip:AddDoubleLine(pica .. " / " .. mago, pica .. " / " .. explo);
	GameTooltip:AddDoubleLine(pica .. " / " .. brujo, pica .. " / " .. guerrero);
	GameTooltip:AddDoubleLine(pica .. " / " .. druida, pica .. " / " .. alca);
	GameTooltip:AddDoubleLine(pica .. " / " .. camper, pica .. " / " .. bardo);
	GameTooltip:AddDoubleLine(pica .. " / " .. sacer, pica .. " / " .. caba);
	GameTooltip:AddSeparator()
	-- SCOUT
	GameTooltip:AddDoubleLine(explo .. " / " .. mago, explo .. " / " .. druida);
	GameTooltip:AddDoubleLine(explo .. " / " .. bardo, explo .. " / " .. sacer);
	GameTooltip:AddDoubleLine(explo .. " / " .. alca, explo .. " / " .. guerrero);
	GameTooltip:AddDoubleLine(explo .. " / " .. pica, explo .. " / " .. caba);
	GameTooltip:AddDoubleLine(explo .. " / " .. brujo, explo .. " / " .. camper);
	GameTooltip:AddSeparator()
	-- KNIGHT
	GameTooltip:AddDoubleLine(caba .. " / " .. brujo, caba .. " / " .. alca);
	GameTooltip:AddSeparator()
	-- WARLOCK
	GameTooltip:AddDoubleLine(brujo .. " / " .. pica, brujo .. " / " .. guerrero);
	GameTooltip:AddDoubleLine(brujo .. " / " .. camper, brujo .. " / " .. mago);
	GameTooltip:AddDoubleLine(brujo .. " / " .. explo, brujo .. " / " .. bardo);
	GameTooltip:AddDoubleLine(brujo .. " / " .. alca, "");
	GameTooltip:AddSeparator()
	-- WARDEN
	GameTooltip:AddDoubleLine(alca .. " / " .. camper, alca .. " / " .. explo);
	GameTooltip:AddDoubleLine(alca .. " / " .. mago, "");
	GameTooltip:AddSeparator()
	-- MAGE
	GameTooltip:AddDoubleLine(mago .. " / " .. pica, mago .. " / " .. sacer);
	GameTooltip:AddDoubleLine(mago .. " / " .. guerrero, mago .. " / " .. caba);
	GameTooltip:AddDoubleLine(mago .. " / " .. alca, mago .. " / " .. druida);
	GameTooltip:AddDoubleLine(mago .. " / " .. explo, mago .. " / " .. brujo);
	GameTooltip:AddDoubleLine(mago .. " / " .. camper, "");
	GameTooltip:AddSeparator()
	-- WARRIOR
	GameTooltip:AddDoubleLine(guerrero .. " / " .. mago, guerrero .. " / " .. brujo);
	GameTooltip:AddDoubleLine(guerrero .. " / " .. alca, guerrero .. " / " .. explo);
	GameTooltip:AddDoubleLine(guerrero .. " / " .. bardo, guerrero .. " / " .. pica);
	GameTooltip:AddDoubleLine(guerrero .. " / " .. sacer, "");
	GameTooltip:AddSeparator()
	-- DRUID
	GameTooltip:AddDoubleLine(druida .. " / " .. guerrero, druida .. " / " .. brujo);
	GameTooltip:AddSeparator()
	-- BARD
	GameTooltip:AddDoubleLine(bardo .. " / " .. alca, bardo .. " / " .. explo);
	GameTooltip:AddDoubleLine(bardo .. " / " .. pica, bardo .. " / " .. guerrero);
	GameTooltip:AddDoubleLine(bardo .. " / " .. mago, bardo .. " / " .. druida);
	GameTooltip:AddDoubleLine(bardo .. " / " .. camper, bardo .. " / " .. brujo);
	GameTooltip:AddSeparator()
	-- PRIEST
	GameTooltip:AddDoubleLine(sacer .. " / " .. guerrero, "");

	GameTooltip:Show();
	local title = getglobal("GameTooltipTextLeft1");
	title:SetWidth(286);
	title:SetJustifyHType("CENTER");
	title:ClearAllAnchors();
	title:SetAnchor("TOP", "TOP", GameTooltip, 0, 10);
	local firstLine = getglobal("GameTooltipTextLeft2");
	firstLine:ClearAllAnchors();
	firstLine:SetAnchor("TOPLEFT", "TOPLEFT", GameTooltip, 12, 30);
	for i = 2, 60 do
		local textTooltipR = getglobal("GameTooltipTextRight" .. i);
		local textTooltipL = getglobal("GameTooltipTextLeft" .. i);
		textTooltipR:ClearAllAnchors();
		textTooltipL:SetWidth(143);
		textTooltipR:SetWidth(135);
		textTooltipR:SetJustifyHType("LEFT");
		textTooltipR:SetAnchor("LEFT", "LEFT", textTooltipL, 135, 0);
	end
	GameTooltip:SetWidth(286);
	GameTooltip:SetHeight(580);
	GameTooltip:AddSeparator()
	GameTooltip:AddLine(_G.CE_LANG.Tooltip.Contact);
end
--Usar curación automática
function CE_HEALING_ITEM()
	local hpRatio = CE_PlayerHealthRatio()
	if not hpRatio then return end
	--Universal
	if GetZoneID() ~= 977 then
		if hpRatio <= CE_HEALING_THRESHOLDS.UNIVERSAL and CE_UseItem(202153) then
			return
		end
	end
	--Poción de Phirius Tipo B
	if hpRatio <= CE_HEALING_THRESHOLDS.PHIRIUS_B and CE_UseItem(203495) then
		return
	end
	-- hierba norma
	if UnitLevel("player") >= 100 then
		if hpRatio <= CE_HEALING_THRESHOLDS.HERB_HIGH_LVL and CE_UseItem(208520) then
			return
		end
	end
end
--Identifica si el obejtivo tiene targeteado al jugador
function CE_TARGET_ON_ME(self, value)
	if(value == nil) then
		value = true;
	end
	local condition = UnitName("targettarget") == UnitName("player")
	if(value) then
		return condition
	else
		return not condition
	end
end

function CE_LOAD_LANG(path)
	CE_safeLoadFile(path, "Error al cargar el archivo: ")
end

function CE_OnLoad(this)
	this:RegisterEvent("EXCHANGECLASS_SUCCESS");
	this:RegisterEvent("LOADING_END");
	this:RegisterEvent("CLOSE_WINDOW");
	this:RegisterEvent("CASTING_START");
	this:RegisterEvent("CASTING_STOP");
	this:RegisterEvent("CASTING_FAILED");
	this:RegisterEvent("VARIABLES_LOADED");
	SaveVariables("C_EngineSettings", "CombatEngine");
	SaveVariables("CE_BUTTON_SETTINGS", "CombatEngine");
	SaveVariables("C_EngineSettings_newVars", "CombatEngine");
	SaveVariables("CE_SHOW_TARGET_STATS", "CombatEngine");
	C_EngineSettings = C_EngineSettings
	C_EngineSettings_newVars = C_EngineSettings_newVars or {}
	if C_EngineSettings.AOE == nil then C_EngineSettings.AOE = true end
	if C_EngineSettings.Consumables == nil then C_EngineSettings.Consumables = true end
	if C_EngineSettings.FastBuffs == nil then C_EngineSettings.FastBuffs = true end
	if C_EngineSettings.Perfect_Slide == nil then C_EngineSettings.Perfect_Slide = true end
	if C_EngineSettings_newVars.AutoTarget == nil then C_EngineSettings_newVars.AutoTarget = true end
end
--Lanzador
function CombatEngine( preset )
	local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
	local serial = MAIN_CLASS .. SEC_CLASS;
	--Autotarget
	if C_EngineSettings_newVars.AutoTarget and C_EngineSettings_newVars.AutoTarget == true then
		Target_CE();
	end

	if not CE_targetIsAttackable() then
		return
	end
	if COMBAT_ENGINE_CUSTOM_ENABLED[serial] == true then
		CE_UseCustomPreset( preset );
	else
		CE_Assign();
	end
end
--Save button position
function CE_SAVE_BUTTON_POS()
	local _, _, _, x, y = CE_BUTTON:GetAnchor()
	CE_BUTTON_SETTINGS.point = "CENTER";
	CE_BUTTON_SETTINGS.relativePoint = "CENTER";
	CE_BUTTON_SETTINGS.relativeTo = "MinimapViewFrame";
	CE_BUTTON_SETTINGS.offsetX = x;
	CE_BUTTON_SETTINGS.offsetY = y;
end
--Formatear texto current class
function CE_SET_TEXT_CLASS(VAR)
	local language = GetLanguage()
	local classLine = ""
	if language == "ES" then
		classLine = _G.CE_LANG.Sys.Playing .. "\n" .. _G.CE_MAIN .. " / " .. _G.CE_SEC .. "\n" .. _G.CE_STATE
	else
		classLine = _G.CE_LANG.Sys.Playing .. "\n" .. _G.CE_MAIN .. " / " .. _G.CE_SEC .. "\n" .. _G.CE_STATE
	end
	VAR:SetText("|cffffffff" .. classLine)
end
--Formatear texto AOE
local function CE_SetLabel(target, text)
	if target and text then
		target:SetText(text)
	end
end

function CE_SET_TEXT_AOE(VAR)
	CE_SetLabel(VAR, _G.CE_LANG.Main.Aoe)
end
--Formatear texto consumibles
function CE_SET_TEXT_CONSUMABLES(VAR)
	CE_SetLabel(VAR, _G.CE_LANG.Main.Consumables)
end
--Formatear texto FAST BUFFS
function CE_SET_TEXT_FAST_BUFFS(VAR)
	CE_SetLabel(VAR, _G.CE_LANG.Main.FastBuffs)
end
--Formatear texto copiar macro
function CE_SET_TEXT_MACRO(VAR)
	CE_SetLabel(VAR, _G.CE_LANG.Main.Macro)
end
--Formatear texto Auto Target
function CE_SET_TEXT_AUTOTARGET(VAR)
	CE_SetLabel(VAR, _G.CE_LANG.Main.AutoTarget)
end
--Formatear texto titulo info
function CE_SET_TEXT_JUST_CLASS(VAR)
	VAR:SetText(_G.CE_MAIN.."|cffffffff / ".._G.CE_SEC);
end
--Copia la macro al portapapeles
function CE_COPY_MACRO()
	Chat_CopyToClipboard("/run CombatEngine()");
	SendSystemMsg(_G.CE_LANG.Sys.SystemMsg)
	DEFAULT_CHAT_FRAME:AddMessage("|cff0099ffCE: " .. _G.CE_LANG.Sys.ChatMsg)
end
--Mensaje addon ready
function CE_IS_SUPPORTED(MAIN_CLASS, SEC_CLASS)
	DEFAULT_CHAT_FRAME:AddMessage("|cff0099ff CombatEngine: " .."|cff00ff00"..MAIN_CLASS.."|cff0099ff / ".."|cff00ff00"..SEC_CLASS.."|cff0099ff Is Ready! ")
	_G.CE_MAIN = "|cff00FFFF "..MAIN_CLASS
	_G.CE_SEC = "|cff00FFFF"..SEC_CLASS
	_G.CE_STATE = "|cffffff00".._G.CE_LANG.Main.Ready
	_G.COMBAT_ENGINE_IS_READY = true;
	_G.CE_FIRST_LOAD = true;
	--Update info
	CE_SET_TEXT_JUST_CLASS(LINE_CE_INFO_TITTLE)
	CE_INFO_TEXT(LINE_CE_INFO_BODY)
	CE_SET_TEXT_CLASS(CE_STRING_PLAYIN_CLASS)
end
--Mensaje clase no soportada
function CE_IS_UNSUPPORTED(MAIN_CLASS, SEC_CLASS)
	_G.CE_MAIN = "|cffff0000"..MAIN_CLASS
	_G.CE_SEC = "|cffff0000"..SEC_CLASS
	_G.CE_STATE = "|cffff0000" .. _G.CE_LANG.Main.Unsupport .. "|r"
	DEFAULT_CHAT_FRAME:AddMessage("|cff0099ff CombatEngine: " .."|cffff0000"..MAIN_CLASS.."|cff0099ff / ".."|cffff0000"..SEC_CLASS.."|cff0099ff Has no default preset")
	_G.COMBAT_ENGINE_IS_READY = false;
	_G.CE_FIRST_LOAD = true;
	--Update info
	CE_SET_TEXT_JUST_CLASS(LINE_CE_INFO_TITTLE)
	CE_INFO_TEXT(LINE_CE_INFO_BODY)
	CE_SET_TEXT_CLASS(CE_STRING_PLAYIN_CLASS)
end
--Cargar combinación
function CE_LOAD_CLASS(path)
	if CE_safeLoadFile(path, "Error al cargar el archivo: ") then
		CE_COMBAT_ACTIVE_FILE = path
	end
end
--TARGETEAR--
function Target_CE()
	if CE_targetIsAttackable() then return end
	TargetNearestEnemy();
end
--Leer escudo
function CE_isShield()
	local mainHand = GetInventoryItemType("player", 15);
	local secondaryHand = GetInventoryItemType("player", 16);
	if(mainHand == 1 and secondaryHand == -1) then
		return false
	elseif(mainHand == 1 and secondaryHand == 0)  or (mainHand == -1 and secondaryHand == 0) then
		return true
	elseif(mainHand == 1 and secondaryHand == 1) then
		return false
	else
		return false
	end
end
--Leer arma a una mano
function CE_WEAPON_TYPE(weapon)
	local link = GetInventoryItemLink("player", 15)
	local a,b,c = ParseHyperlink(link)
	local id_hex = string.sub(b, 1, 6)
	local id_decimal = tonumber(id_hex, 16)
	local type_weapon = GetObjectInfo(id_decimal, "weapontype")
	if weapon == "axe" then
		if type_weapon == 4 then
			return true
		else
			return false
		end
	elseif weapon == "Sword-2H" then
		if type_weapon == 6 then
			return true
		else
			return false
		end
	elseif weapon == "Katana" then
		if type_weapon == 22 then
			return true
		else
			return false
		end
	elseif weapon == "Daga" then
		if type_weapon == 2 then
			return true
		else
			return false
		end
	end
end
--Get weapon
function CE_GET_WEAPON_TYPE()
	local link = GetInventoryItemLink("player", 15)
	local a,b,c = ParseHyperlink(link)
	local id_hex = string.sub(b, 1, 6)
	local id_decimal = tonumber(id_hex, 16)
	local type_weapon = GetObjectInfo(id_decimal, "weapontype")
	return type_weapon
end
--Get energy cost
function CE_ENERGY_COST_TYPE()
	local link = GetSkillHyperLink(4, 4)
	local a,b,c = ParseHyperlink(link)
	local id_hex = b:match("(%d+) ")
	local energy = GetObjectInfo(id_hex, "costvalue1")
	return energy
end
--CONVERTIR ID A STRING
function CE_toName(ID)
	if not ID then
		ID = 0
	end
	result = TEXT("Sys" .. ID .. "_name")
	return result
end
--FIND CD FOR SKILL
function CE_CD(skill, id_1, id_2)
	local CD = 0
	if skill and id_1 and id_2 then
		_, CD = GetSkillCooldown(id_1, id_2)
		return CD
	end
end
--FIND CD TO ISS
function CE_ISS_CD(name)
	for i = 0, SkillPlateUpdate(-1) do
		local nombre, _, _, CD = SkillPlateUpdate(i)
		if nombre == name then
			if CD <= 0.25 then
				return true
			else
				return false
			end
		end
	end
	return false
end
--CE_GET_FAST_POS_SKILL
function CE_GET_FAST_POS(ID)
	local name = CE_toName(ID)
	for A = 1, 5 do
		local maxEsp = GetNumSkill(A)
		for B = 1, maxEsp do
			local nameSkill, _, _, _, _, _, _, _, _ = GetSkillDetail(A, B)
			if nameSkill == name then
				return A, B
			end
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage("No se encontró coincidencia para el ID: " .. ID)
	return false, nil, nil
end
--Encontrar Skill y determinar posición
function Match_CE(ID)
	local name = CE_toName(ID)
	for A = 1, 6 do
		local maxEsp = GetNumSkill(A)
		if not maxEsp or type(maxEsp) ~= "number" then
			maxEsp = 0
		end
		for B = 1, maxEsp do
			local nameSkill, _, _, _, _, _, _, _, _ = GetSkillDetail(A, B)
			if nameSkill == name then
				return true, A, B
			end
		end
	end
	return false, nil, nil
end
--Determinar tiempo restante de un buff
function CE_BuffTimeLeftById(buffid)
	local i = 1
	repeat
		local _, _, _, id = UnitBuff("player", i)
		if id ~= nil then
			if id == buffid then
				local timeLeft = UnitBuffLeftTime("player", i)
				return timeLeft <= 3
			end
			i = i + 1
		end
	until id == nil
	return false
end
--Determinar tiempo restante de un buff
function CE_BuffTimeLeftById_TIME(buffid)
	local i = 1
	repeat
		local _, _, _, id = UnitBuff("player", i)
		if id ~= nil then
			if id == buffid then
				local timeLeft = UnitBuffLeftTime("player", i)
				return timeLeft
			end
			i = i + 1
		end
	until id == nil
end
--DEBUFFS
function CE_DebuffIdPlayer(buffid)
	local i = 1
	repeat
		local _,_,_,id = UnitDebuff("player",i);
		if (id ~= nil) then
			if (id == buffid) then
				return true
			end
			i=i+1
		end
	until (id==nil)
	return false
end
--Debuff target
function CE_DebuffIdTarget(id, stack, orMore)
	local fx = false
	local debuffStack = false
	local buffStack = false
	local buff = false

	--Debuff
	for i = 1, #UNIT_BUFF.target.DEBUFFS do
		local id_Debuff = UNIT_BUFF["target"]["DEBUFFS"][i][4]
		if id_Debuff == id then
			fx = true
			if stack then
				local currentStack = UNIT_BUFF["target"]["DEBUFFS"][i][3]
				if orMore == true then
					if currentStack >= stack then
						debuffStack = true
					end
				else
					if stack == currentStack then
						debuffStack = true
					end
				end
			end
			break
		end
	end

	for i = 1, #UNIT_BUFF.target.BUFFS do
		local id_Buff = UNIT_BUFF["target"]["BUFFS"][i][4]
		if id_Buff == id then
			buff = true
			if stack then
				local currentStack = UNIT_BUFF["target"]["BUFFS"][i][3]
				if orMore == true then
					if currentStack >= stack then
						buffStack = true
					end
				else
					if stack == currentStack then
						buffStack = true
					end
				end
			end
			break
		end
	end

	if stack then
		return debuffStack or buffStack
	else
		return fx or buff
	end
end
--self debuff target
function CE_SELF_DEBUFF(id, stack, orMore)
	local self = false
	local debuffStack = false
	for i = 1, #UNIT_BUFF.target.DEBUFFS do
		local id_Debuff = UNIT_BUFF["target"]["DEBUFFS"][i][4]
		local caster = UNIT_BUFF["target"]["DEBUFFS"][i][9]
		local player = UnitName("player")
		if id_Debuff == id and caster == player then
			self = true
			if stack then
				local currentStack = UNIT_BUFF["target"]["DEBUFFS"][i][3]
				if orMore == true then
					if currentStack >= stack then
						debuffStack = true
					end
				else
					if stack == currentStack then
						debuffStack = true
					end
				end
			end
			break
		end
	end
	if stack then
		return debuffStack
	else
		return self
	end
end
--self Buff player
function CE_SELF_BUFF(id, stack, orMore)
	local self = false
	local stackStatus = false
	for i = 1, #UNIT_BUFF.player.BUFFS do
		local id_Buff = UNIT_BUFF["player"]["BUFFS"][i][4]
		local caster = UNIT_BUFF["player"]["BUFFS"][i][9]
		local player = UnitName("player")
		if id_Buff == id and caster == player then
			self = true
			if stack then
				local currentStack = UNIT_BUFF["player"]["BUFFS"][i][3]
				if orMore == true then
					if currentStack >= stack then
						stackStatus = true
					end
				else
					if stack == currentStack then
						stackStatus = true
					end
				end
			end
			break
		end
	end
	if stack then
		return stackStatus
	else
		return self
	end
end
--Before end buff player
function CE_BEFORE_END_PLAYERBUFF(effect, time)
	local success = false
	local match = false
	for i = 1, #UNIT_BUFF.player.BUFFS do
		local id = UNIT_BUFF["player"]["BUFFS"][i][4]
		if id == effect  then
			match = true
			local leftTime = UnitBuffLeftTime("player", UNIT_BUFF["player"]["BUFFS"][i][8]) or 0;
			if leftTime <= time then
				success = true
			end
			break
		end
	end
	if not match then
		return true
	else
		return success
	end
end
--Before end buff target
function CE_BEFORE_END_TARGETBUFF(effect, time)
	local success = false
	local match = false
	for i = 1, #UNIT_BUFF.target.DEBUFFS do
		local id = UNIT_BUFF["target"]["DEBUFFS"][i][4]
		if id == effect  then
			match = true
			local leftTime = UnitDebuffLeftTime("target", UNIT_BUFF["target"]["DEBUFFS"][i][8]) or 0;
			if leftTime <= time then
				success = true
			end
			break
		end
	end
	if not match then
		return true
	else
		return success
	end
end
--player buffs--
function CE_BuffIdPlayer(id, stack, orMore)
	local buff = false
	local stackStatus = false
	for i = 1, #UNIT_BUFF.player.BUFFS do
		local id_Buff = UNIT_BUFF["player"]["BUFFS"][i][4]
		if id_Buff == id then
			buff = true
			if stack then
				local currentStack = UNIT_BUFF["player"]["BUFFS"][i][3]
				if orMore == true then
					if currentStack >= stack then
						stackStatus = true
					end
				else
					if stack == currentStack then
						stackStatus = true
					end
				end
			end
			break
		end
	end
	if stack then
		return stackStatus
	else
		return buff
	end
end
--New autoshoot
function CE_NewAutoShoot(id)
	local found = false;
	local language = GetLanguage();
	for i = 1, 80 do
		local icon, _, _, _, _, enable, skillID = GetActionInfo(i);
		if skillID == id then
			found = true;
			if enable == false then
				CastSpellByName(CE_toName(id));
			end
		end
	end
	if not found then
		if language == "ES" then
			SendWarningMsg("|cff00FF00Combat Engine:|r Necesitas equipar en la barra la habilidad: " .. "|cff00BFF2" .. TEXT("Sys" .. id .. "_name") .. "|r");
		else
			SendWarningMsg("|cff00FF00Combat Engine:|r You need to equip it in the bar " .. "|cff00BFF2" .. TEXT("Sys" .. id .. "_name") .. "|r" .. " skill.");
		end
	end
end
function CE_BuffIdTarget(buffid)
	local i = 1
	repeat
		local _,_,_,id = UnitBuff("target",i);
		if (id ~= nil) then
			if (id == buffid) then
				return true
			end
			i=i+1
		end
	until (id==nil)
	return false
end
--GET INDEX BUFF
function CE_GET_INDEX_BUFF(ID)
	local i = 1
	while true do
		local index, _, _, id_debuff = UnitBuff("player", i)
		if not id_debuff then
			break
		end
		if id_debuff == ID then
			return i
		end
		i = i + 1
	end
	return 0
end
--leer buffo en forma rápida
function CE_READ_BUFF_FAST(ID)
	local i = 1
	while true do
		local name, icon, count, id_buff = UnitBuff("player", i);
		if not id_buff then
			break
		end
		if id_buff == ID then
			return true
		end
		i = i + 1
	end
	return false
end
--CE AFTER BUFF ENDED CASE 1
local CE_AFE_ZERO = 10
local CE_AFE_FLARE = false
local CE_AFE_GET_TIME = 0
function CE_AFE(ID, TIME)
	if not CE_READ_BUFF_FAST(ID) and not CE_AFE_FLARE then
		CE_AFE_ZERO = 0
		return true
	elseif CE_READ_BUFF_FAST(ID) then
		CE_AFE_FLARE = true
		return false
	elseif CE_AFE_FLARE and CE_AFE_ZERO == 0 and CE_AFE_GET_TIME == 0 then
		CE_AFE_GET_TIME = GetTime()
		return false
	elseif CE_AFE_GET_TIME ~= 0 then
		local elapsed_time = GetTime() - CE_AFE_GET_TIME
		if elapsed_time >= TIME then
			CE_AFE_GET_TIME = 0
			CE_AFE_FLARE = false
			CE_AFE_ZERO = 10
			return true
		else
			return false
		end
	end
end
--CE AFTER BUFF ENDED CASE 2
local CE_AFE_ZERO_2 = 10
local CE_AFE_FLARE_2 = false
local CE_AFE_GET_TIME_2 = 0
function CE_AFE_2(ID, TIME)
	if not CE_READ_BUFF_FAST(ID) and not CE_AFE_FLARE_2 then
		CE_AFE_ZERO_2 = 0
		return true
	elseif CE_READ_BUFF_FAST(ID) then
		CE_AFE_FLARE_2 = true
		return false
	elseif CE_AFE_FLARE_2 and CE_AFE_ZERO_2 == 0 and CE_AFE_GET_TIME_2 == 0 then
		CE_AFE_GET_TIME_2 = GetTime()
		return false
	elseif CE_AFE_GET_TIME_2 ~= 0 then
		local elapsed_time_2 = GetTime() - CE_AFE_GET_TIME_2
		if elapsed_time_2 >= TIME then
			CE_AFE_GET_TIME_2 = 0
			CE_AFE_FLARE_2 = false
			CE_AFE_ZERO_2 = 10
			return true
		else
			return false
		end
	end
end
function CE_AFE_2_TARGET(ID, TIME)
	if not CE_DebuffIdTarget(ID) and not CE_AFE_FLARE_2 then
		CE_AFE_ZERO_2 = 0
		return true
	elseif CE_DebuffIdTarget(ID) then
		CE_AFE_FLARE_2 = true
		return false
	elseif CE_AFE_FLARE_2 and CE_AFE_ZERO_2 == 0 and CE_AFE_GET_TIME_2 == 0 then
		CE_AFE_GET_TIME_2 = GetTime()
		return false
	elseif CE_AFE_GET_TIME_2 ~= 0 then
		local elapsed_time_2 = GetTime() - CE_AFE_GET_TIME_2
		if elapsed_time_2 >= TIME then
			CE_AFE_GET_TIME_2 = 0
			CE_AFE_FLARE_2 = false
			CE_AFE_ZERO_2 = 10
			return true
		else
			return false
		end
	end
end
function CE_TARGET_IS_BOSS()
	local zone = GetZoneID() % 1000
	local mirrorInstance = { 215, 217 }
	local isMirror = zone >= 215 and zone <= 235
	if UnitSex("target") >= 3 and not isMirror then
		return true
	else
		return false
	end
end
--Read Pet
function CE_READ_PET(ID)
	local pet = UnitName("pet")
	if pet == nil or UnitName("pet") ~= CE_toName(ID) then
		return false
	else
		return true
	end
end
-- Mejor detección de movimiento del jugador
local lastX, lastY = GetPlayerWorldMapPos()
lastX = lastX or 0
lastY = lastY or 0
local MOVE_TOLERANCE = 0.0001

function CE_isMoving()
	local posX, posY = GetPlayerWorldMapPos()
	if not posX or not posY then return false end
	local moving = math.abs(posX - lastX) > MOVE_TOLERANCE or math.abs(posY - lastY) > MOVE_TOLERANCE
	lastX, lastY = posX, posY
	return moving
end
--USAR ITEM POR ID
function CE_UseItem(ItemID)
	local found = false
	for i = 1, 350 do
		local index, _, n, c, _, _ = GetBagItemInfo(i)
		local maxCD, CurrentCD = GetBagItemCooldown(index)
		if CE_toName(ItemID) == n then
			if c > 0 then
				if CurrentCD <= 0.45 then
					UseItemByName(n)
					found = true
					return true
				end
			end
		end
	end
	for i = 1, 50 do
		local _, name, cantidad, _, _ = GetGoodsItemInfo(i)
		local _, CD_ITEM_SHOP = GetGoodsItemCooldown(i)
		if CE_toName(ItemID) == name then
			if cantidad > 0 then
				if CD_ITEM_SHOP <= 0.45 then
					UseItemByName(name)
					found = true
					return true
				else
					return false
				end
			end
		end
	end
	if not found then
		--DEFAULT_CHAT_FRAME:AddMessage("No tienes: " .. CE_toName(ItemID) .." en tu mochila de combate")
	end
end
--Debuff stack
function CE_DEBUFF_STACK(ID, stack)
	local i = 1
	while true do
		local _, _, count, id_debuff = UnitDebuff("target", i)
		if not id_debuff then
			break
		end
		if id_debuff == ID then
			if stack == count then
				return true
			else
				return false
			end
		end
		i = i + 1
	end
	return false
end
--Buff stack Player
function CE_BUFF_PLAYER_STACK(ID, stack)
	local i = 1
	while true do
		local _, _, count, id_debuff = UnitBuff("player", i)
		if not id_debuff then
			break
		end
		if id_debuff == ID then
			if stack == count then
				return true
			else
				return false
			end
		end
		i = i + 1
	end
	return false
end
local lastUpdateTime = GetTime()
local frameIndex = 1
local frames = {
	[1] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\01.tga",
	[2] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\02.tga",
	[3] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\03.tga",
	[4] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\04.tga",
	[5] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\05.tga",
	[6] = "Interface\\Addons\\CombatEngine\\texture\\animation\\01\\06.tga",
}
local frameRate = 0.05
function AnimationTest()
	local currentTime = GetTime()
	local elapsed = currentTime - lastUpdateTime
	if elapsed >= frameRate then
		CE_Anim01_Texture:SetFile(frames[frameIndex])
		frameIndex = frameIndex + 1
		if frameIndex > #frames then
			frameIndex = 1
		end
		lastUpdateTime = currentTime
	end
end
