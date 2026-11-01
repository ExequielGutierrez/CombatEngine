


--QUICK BAR ROGUE

function CE_ROGUE_POS_QUICK_BAR()

	local SIZE_BACKGROUND = {
	
		["width"] = 215,   
		["height"] = 58,   
	
	}

	--Set size background
	CE_FRAME_FAST_ROGUE_BACKGROUND:SetSize(SIZE_BACKGROUND.width, SIZE_BACKGROUND.height)
	
	local SIZE_CONTAINER = {
	
		["width"] = 207,   
		["height"] = 50,   
	
	
	}
	--Set size container
	CE_FRAME_FAST_ROGUE:SetSize(SIZE_CONTAINER.width, SIZE_CONTAINER.height)
	
	--Hide Perfect Slide
	CE_ART_PERFECT_SLIDE_TOGGLE:Show();
	
	--Position AOE
	local ANCHOR_AOE = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "RIGHT",
    ["relativeTo"] = "CE_ART_PERFECT_SLIDE_TOGGLE",	
	["offsetX"] = 3,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_AOE:ClearAllAnchors()
	CE_ART_QUICK_AOE:SetAnchor(ANCHOR_AOE.point, ANCHOR_AOE.relativePoint, ANCHOR_AOE.relativeTo, ANCHOR_AOE.offsetX, ANCHOR_AOE.offsetY)
	
	--Position Consumables
	
	local ANCHOR_CONSUMABLES = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "RIGHT",
    ["relativeTo"] = "CE_ART_QUICK_AOE",	
	["offsetX"] = 3,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_CONSUMABLES:ClearAllAnchors()
	CE_ART_QUICK_CONSUMABLES:SetAnchor(ANCHOR_CONSUMABLES.point, ANCHOR_CONSUMABLES.relativePoint, ANCHOR_CONSUMABLES.relativeTo, ANCHOR_CONSUMABLES.offsetX, ANCHOR_CONSUMABLES.offsetY)
	
	--Position fast buffs
		
	local ANCHOR_FAST_BUFFS = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "RIGHT",
    ["relativeTo"] = "CE_ART_QUICK_CONSUMABLES",	
	["offsetX"] = 3,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_BUFFS:ClearAllAnchors()
	CE_ART_QUICK_BUFFS:SetAnchor(ANCHOR_FAST_BUFFS.point, ANCHOR_FAST_BUFFS.relativePoint, ANCHOR_FAST_BUFFS.relativeTo, ANCHOR_FAST_BUFFS.offsetX, ANCHOR_FAST_BUFFS.offsetY)
end


--QUICK BAR OTHER CLASSES

function CE_OTHERCLASS_POS_QUICK_BAR()

	local SIZE_BACKGROUND = {
	
		["width"] = 170,   
		["height"] = 58,   
	
	}

	--Set size background
	CE_FRAME_FAST_ROGUE_BACKGROUND:SetSize(SIZE_BACKGROUND.width, SIZE_BACKGROUND.height)
	
	local SIZE_CONTAINER = {
	
		["width"] = 162,   
		["height"] = 50,   
	
	
	}
	--Set size container
	CE_FRAME_FAST_ROGUE:SetSize(SIZE_CONTAINER.width, SIZE_CONTAINER.height)
	
	--Hide Perfect Slide
	CE_ART_PERFECT_SLIDE_TOGGLE:Hide();
	
	--Position AOE
	local ANCHOR_AOE = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "LEFT",
    ["relativeTo"] = "CE_FRAME_FAST_ROGUE",	
	["offsetX"] = 10,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_AOE:ClearAllAnchors()
	CE_ART_QUICK_AOE:SetAnchor(ANCHOR_AOE.point, ANCHOR_AOE.relativePoint, ANCHOR_AOE.relativeTo, ANCHOR_AOE.offsetX, ANCHOR_AOE.offsetY)
	
	--Position Consumables
	
	local ANCHOR_CONSUMABLES = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "RIGHT",
    ["relativeTo"] = "CE_ART_QUICK_AOE",	
	["offsetX"] = 3,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_CONSUMABLES:ClearAllAnchors()
	CE_ART_QUICK_CONSUMABLES:SetAnchor(ANCHOR_CONSUMABLES.point, ANCHOR_CONSUMABLES.relativePoint, ANCHOR_CONSUMABLES.relativeTo, ANCHOR_CONSUMABLES.offsetX, ANCHOR_CONSUMABLES.offsetY)
	--Position fast buffs
		
	local ANCHOR_FAST_BUFFS = {
	
	["point"] = "LEFT",
    ["relativePoint"] = "RIGHT",
    ["relativeTo"] = "CE_ART_QUICK_CONSUMABLES",	
	["offsetX"] = 3,
    ["offsetY"] = 0,
	}
	
	CE_ART_QUICK_BUFFS:ClearAllAnchors()
	CE_ART_QUICK_BUFFS:SetAnchor(ANCHOR_FAST_BUFFS.point, ANCHOR_FAST_BUFFS.relativePoint, ANCHOR_FAST_BUFFS.relativeTo, ANCHOR_FAST_BUFFS.offsetX, ANCHOR_FAST_BUFFS.offsetY)
end





if not CE_STATE_QUICKBAR_B or CE_STATE_QUICKBAR_B == nil then

	CE_STATE_QUICKBAR_B = {
	}
	
	CE_STATE_QUICKBAR_B.active = false

end
--SETEAR TEXTOS
function CE_SLIDE_ON_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Perfect Slide |cff00FFFFON")
end
function CE_SLIDE_OFF_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Perfect Slide |cffcc3333OFF")
end
function CE_AOE_ON_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00AoE |cff00FFFFON")
end
function CE_AOE_OFF_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00AoE |cffcc3333OFF")
end
function CE_CONSUMABLES_ON_SYSTEM_TEXT()
	if GetLanguage() == "ES" then
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Consumibles |cff00FFFFON")
	else
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Consumables |cff00FFFFON")
	end
end
function CE_CONSUMABLES_OFF_SYSTEM_TEXT()
	if GetLanguage() == "ES" then
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Consumibles |cffcc3333OFF")
	else
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Consumables |cffcc3333OFF")
	end
end
function CE_FASTBUFFS_ON_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Fast buffs |cff00FFFFON")
end
function CE_FASTBUFFS_OFF_SYSTEM_TEXT()
	DEFAULT_CHAT_FRAME:AddMessage("|cff80ff00Fast buffs |cffcc3333OFF")
end



function CE_LOAD_QUICK_ICONS()
	
	if _G.C_EngineSettings.AOE == false or _G.C_EngineSettings.AOE == nil then
		CE_ART_QUICK_AOE:UnlockPushed();
	elseif _G.C_EngineSettings.AOE == true then
		CE_ART_QUICK_AOE:LockPushed();
	end
	
	if _G.C_EngineSettings.Consumables == false or _G.C_EngineSettings.Consumables == nil then
		CE_ART_QUICK_CONSUMABLES:UnlockPushed();
	elseif _G.C_EngineSettings.Consumables == true then
		CE_ART_QUICK_CONSUMABLES:LockPushed();
	end

	if _G.C_EngineSettings.Perfect_Slide == false or _G.C_EngineSettings.Perfect_Slide == nil then
		CE_ART_PERFECT_SLIDE_TOGGLE:UnlockPushed();
	elseif _G.C_EngineSettings.Perfect_Slide == true then
		CE_ART_PERFECT_SLIDE_TOGGLE:LockPushed();
	end

	if _G.C_EngineSettings.FastBuffs == false or _G.C_EngineSettings.FastBuffs == nil then
		CE_ART_QUICK_BUFFS:UnlockPushed();
	elseif _G.C_EngineSettings.FastBuffs == true then
		CE_ART_QUICK_BUFFS:LockPushed();
	end

end



--GUARDAR POSICION DE BARRA RAPIDA
local CE_QUICK_BAR_POSITION_DEFAULT = {
		["point"] = "TOPLEFT",
		["relativePoint"] = "TOPLEFT",
		["relativeTo"] = "UIParent",
		["offsetX"] = 100,
		["offsetY"] = 200,
    }


--GUARDAR TABLA
function CE_OnLoad_QUICK_BAR(this)

	this:RegisterEvent("LOADING_END");
	this:RegisterEvent("EXCHANGECLASS_SUCCESS");

	SaveVariables("CE_QUICK_BAR_POSITION", "CombatEngine");
	SaveVariables("CE_STATE_QUICKBAR_B", "CombatEngine");	

end

--CAGAR POSICION DE LA BARRA RAPIDA
function CE_OnLoad_Event_QUICK_BAR(event, arg1)

	if event == "LOADING_END" then
		CE_LOAD_QUICK_ICONS()
	--Show Quick Bar
		if CE_STATE_QUICKBAR_B.active then
			CE_FRAME_FAST_ROGUE_BACKGROUND:Show()
		else
			CE_FRAME_FAST_ROGUE_BACKGROUND:Hide()
		end
	
		if not _G.CE_QUICK_BAR_POSITION then
				CE_QUICK_BAR_POSITION = {}
				CE_QUICK_BAR_POSITION.point = CE_QUICK_BAR_POSITION_DEFAULT.point
				CE_QUICK_BAR_POSITION.relativePoint =	CE_QUICK_BAR_POSITION_DEFAULT.relativePoint
				CE_QUICK_BAR_POSITION.relativeTo =	CE_QUICK_BAR_POSITION_DEFAULT.relativeTo
				CE_QUICK_BAR_POSITION.offsetX =	CE_QUICK_BAR_POSITION_DEFAULT.offsetX
				CE_QUICK_BAR_POSITION.offsetY =	CE_QUICK_BAR_POSITION_DEFAULT.offsetY
				CE_FRAME_FAST_ROGUE_BACKGROUND:ClearAllAnchors()
				CE_FRAME_FAST_ROGUE_BACKGROUND:SetAnchor(CE_QUICK_BAR_POSITION.point, CE_QUICK_BAR_POSITION.relativePoint, CE_QUICK_BAR_POSITION.relativeTo, CE_QUICK_BAR_POSITION.offsetX, CE_QUICK_BAR_POSITION.offsetY)
				--DEFAULT_CHAT_FRAME:AddMessage("Cargar default")
		else
				CE_FRAME_FAST_ROGUE_BACKGROUND:ClearAllAnchors()
				CE_FRAME_FAST_ROGUE_BACKGROUND:SetAnchor(CE_QUICK_BAR_POSITION.point, CE_QUICK_BAR_POSITION.relativePoint, CE_QUICK_BAR_POSITION.relativeTo, CE_QUICK_BAR_POSITION.offsetX, CE_QUICK_BAR_POSITION.offsetY)
				--DEFAULT_CHAT_FRAME:AddMessage("Cargar ultima posicion")
		end
	end 
	if event == "EXCHANGECLASS_SUCCESS" or event == "LOADING_END" then
		local mainClass, subClass = UnitClassToken("player");
		if mainClass == "THIEF" then
			CE_ROGUE_POS_QUICK_BAR();
		else
			CE_OTHERCLASS_POS_QUICK_BAR();
		end
	end
end
	


--GUARDAR POSICION BARRA RAPIDA
function CE_SAVE_QUICK_BAR_POSITON()
	
		local point, relativePoint, relativeTo, x, y = CE_FRAME_FAST_ROGUE_BACKGROUND:GetAnchor()
		
		CE_QUICK_BAR_POSITION.point = point
		CE_QUICK_BAR_POSITION.relativePoint = relativePoint
		CE_QUICK_BAR_POSITION.relativeTo = relativeTo:GetName()
		CE_QUICK_BAR_POSITION.offsetX = x
		CE_QUICK_BAR_POSITION.offsetY = y
		--DEFAULT_CHAT_FRAME:AddMessage("Guardar posición")
end


-----------PERFECT SLIDE----------

local PefectSlide = "Slide"
local Slide = true

--Temporizador en cero
local function FIRST_SLIDE()
	--DEFAULT_CHAT_FRAME:AddMessage("Slide_1");
	TimerQueue[PefectSlide] = nil
	Slide = true
end


local function COSTO()

if CE_BuffIdPlayer(1502730) then 
	return 17
elseif CE_BuffIdPlayer(1502908) then
	return 20
else
	return 25
end

end

local function Time()

	local speed_a, speed_b = GetPlayerAbility('MAIN_ATTACKSPEED')
	local speed = speed_a + speed_b


	if speed > 1 then
		return 4.15
	else
		return 3.85
	end

end

function CE_PERFECT_SLIDE()
	if _G.C_EngineSettings.Perfect_Slide and CE_WEAPON_TYPE("Katana") then
	
		local PER_SLI_SKILL, PER_SLI_ID_1, PER_SLI_ID_2
		local skillID = COMBAT_ENG_SERIAL == "THIEFKNIGHT" and 1492413 or 1491731
		PER_SLI_SKILL, PER_SLI_ID_1, PER_SLI_ID_2 = Match_CE(skillID)
		local CD_SLIDE = CE_CD(PER_SLI_SKILL, PER_SLI_ID_1, PER_SLI_ID_2);
		
		local energia = UnitMana("player")

		if CD_SLIDE <= 0.25 and not TimerQueue[PefectSlide] then
			TimerQueue[PefectSlide] = { GetTime() + Time(), FIRST_SLIDE }
		elseif CD_SLIDE == 0 and Slide and energia >= COSTO() then
			CastSpellByName(CE_toName(skillID));
			return true
		elseif CD_SLIDE > 0 then
			Slide = false
			return false
		end	
			
	else
		return false		
	end
end