---------------------------------
--------------Asignar------------
---------------------------------
function CE_Assign()
	local main, sec = UnitClassToken("player");
	if(main == "THIEF") then
		THIEF_engine(sec)
	elseif (main == "KNIGHT") then
		KNIGHT_engine(sec)
	elseif (main == "HARPSYN") then
		WARLOCK_engine(sec)
	elseif (main == "RANGER") then
		SCOUT_engine(sec)
	elseif (main == "WARRIOR") then
		WARRIOR_engine(sec)
	elseif (main == "MAGE") then
		MAGE_engine(sec)
	elseif (main == "WARDEN") then
		WARDEN_engine(sec)
	elseif (main == "DRUID") then
		DRUID_engine(sec)
	elseif (main == "AUGUR") then
		AUGUR_engine(sec)
	elseif (main == "BARD") then
		BARD_engine(sec)
	end
end

---------------------------------
-----------Load Files------------
---------------------------------
function CE_OnLoad_Event(event, arg1)
	if event == "VARIABLES_LOADED" then
		COMBATENGINE_LOADED = true;

		CE_SET_TEXT_AOE( LINE_CE_AOE );
		CE_SET_TEXT_CONSUMABLES( LINE_CE_CONSUMABLE );
		CE_SET_TEXT_MACRO( LINE_CE_MACRO );
		CE_SET_TEXT_FAST_BUFFS( LINE_CE_FAST_BUFFS );
		CE_SET_TEXT_AUTOTARGET( LINE_CE_AUTOTARGET );

		_G.CE_AOE_ON = C_EngineSettings.AOE or true;
		_G.CE_CONSUMABLES_ON = C_EngineSettings.Consumables or true;
		_G.CE_HEALING_ON = C_EngineSettings.Healing_items or true;
		_G.CE_FASTBUFFS_ON = C_EngineSettings.FastBuffs or true;

		CE_BUTTON_SETTINGS = CE_BUTTON_SETTINGS or {};
		if not CE_BUTTON_SETTINGS.point then CE_BUTTON_SETTINGS.point = CE_DEFAULT_POS_BUTTON.point or "CENTER"; end
		if not CE_BUTTON_SETTINGS.relativePoint then CE_BUTTON_SETTINGS.relativePoint = CE_DEFAULT_POS_BUTTON.relativePoint or "CENTER"; end
		if not CE_BUTTON_SETTINGS.relativeTo then CE_BUTTON_SETTINGS.relativeTo = "MinimapViewFrame"; end
		if not CE_BUTTON_SETTINGS.offsetX then CE_BUTTON_SETTINGS.offsetX = CE_DEFAULT_POS_BUTTON.offsetX or -80; end
		if not CE_BUTTON_SETTINGS.offsetY then CE_BUTTON_SETTINGS.offsetY = CE_DEFAULT_POS_BUTTON.offsetY or 90; end
		CE_BUTTON:ClearAllAnchors();
		CE_BUTTON:SetAnchor(CE_BUTTON_SETTINGS.point, CE_BUTTON_SETTINGS.relativePoint, CE_BUTTON_SETTINGS.relativeTo, CE_BUTTON_SETTINGS.offsetX, CE_BUTTON_SETTINGS.offsetY);
	end

	if COMBATENGINE_LOADED == true then
		local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
		local main, sec = UnitClass("player");

		if event == "CASTING_START" then
			COMBATENGINE_CASTING = true;
		elseif event == "CASTING_STOP" then
			COMBATENGINE_CASTING = false;
		elseif event == "CASTING_FAILED" then
			COMBATENGINE_CASTING = false;
		end
		if event == "EXCHANGECLASS_SUCCESS" or (event == "LOADING_END" and CE_FIRST_LOAD == false) then
			CE_MAIN_FOR_UI = MAIN_CLASS
			CE_SEC_FOR_UI = SEC_CLASS
			CE_CHANGE_INFO_IMAGE()
			CE_SET_ELEMENT()
			if MAIN_CLASS == "THIEF" then
				if SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Warlock.lua")
				elseif SEC_CLASS == "AUGUR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Priest.lua")
				elseif SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Warrior.lua")
				elseif SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Mage.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Warden.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Scout.lua")
				elseif SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Champion.lua")
				elseif SEC_CLASS == "BARD" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Bard.lua")
				elseif SEC_CLASS == "DRUID" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Druid.lua")
				elseif SEC_CLASS == "KNIGHT" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Rogue\\Rogue_Knight.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			--KNIGHT
			elseif MAIN_CLASS == "KNIGHT" then
				if SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Knight\\Knight_Warlock.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Knight\\Knight_Warden.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			--DRUID
			elseif MAIN_CLASS == "DRUID" then
				if SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Druid\\Druid_Warrior.lua")
				elseif SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Druid\\Druid_Warlock.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			--BARD
			elseif MAIN_CLASS == "BARD" then
				if SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Warden.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Scout.lua")
				elseif SEC_CLASS == "THIEF" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Rogue.lua")
				elseif SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Warrior.lua")
				elseif SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Mage.lua")
				elseif SEC_CLASS == "DRUID" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Druid.lua")
				elseif SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Champion.lua")
				elseif SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Bard\\Bard_Warlock.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			elseif MAIN_CLASS == "HARPSYN" then
				if SEC_CLASS == "THIEF" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Rogue.lua")
				elseif SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Warrior.lua")
				elseif SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Champion.lua")
				elseif SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Mage.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Scout.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Warden.lua")
				elseif SEC_CLASS == "BARD" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warlock\\Warlock_Bard.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			--MAGE
			elseif MAIN_CLASS == "MAGE" then
				if SEC_CLASS == "THIEF" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Rogue.lua")
				elseif SEC_CLASS == "AUGUR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Priest.lua")
				elseif SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Warrior.lua")
				elseif SEC_CLASS == "KNIGHT" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Knight.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Warden.lua")
				elseif SEC_CLASS == "DRUID" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Druid.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Scout.lua")
				elseif SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Warlock.lua")
				elseif SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Mage\\Mage_Champion.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			elseif MAIN_CLASS == "RANGER" then
				if SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Mage.lua")
				elseif SEC_CLASS == "DRUID" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Druid.lua")
				elseif SEC_CLASS == "BARD" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Bard.lua")
				elseif SEC_CLASS == "AUGUR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Priest.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Warden.lua")
				elseif SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Warrior.lua")
				elseif SEC_CLASS == "THIEF" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Rogue.lua")
				elseif SEC_CLASS == "KNIGHT" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Knight.lua")
				elseif SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Champion.lua")
				elseif SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Scout\\Ranger_Warlock.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			elseif MAIN_CLASS == "WARRIOR" then
				if SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Mage.lua")
				elseif SEC_CLASS == "HARPSYN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Warlock.lua")
				elseif SEC_CLASS == "WARDEN" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Warden.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Scout.lua")
				elseif SEC_CLASS == "BARD" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Bard.lua")
				elseif SEC_CLASS == "THIEF" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Rogue.lua")
				elseif SEC_CLASS == "AUGUR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warrior\\Warrior_Priest.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			--Sacer
			elseif MAIN_CLASS == "AUGUR" then
				if SEC_CLASS == "WARRIOR" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Priest\\Priest_Warrior.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			elseif MAIN_CLASS == "WARDEN" then
				if SEC_CLASS == "PSYRON" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warden\\Warden_Champion.lua")
				elseif SEC_CLASS == "RANGER" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warden\\Warden_Scout.lua")
				elseif SEC_CLASS == "MAGE" then
					CE_IS_SUPPORTED(main, sec)
					CE_LOAD_CLASS("Interface\\Addons\\CombatEngine\\classes\\Warden\\Warden_Mage.lua")
				else
					CE_IS_UNSUPPORTED(main, sec)
				end
			else
				CE_IS_UNSUPPORTED(main, sec)
			end
		end
	end
end

---------------------------------
-----------Run Default-----------
---------------------------------
function THIEF_engine(sec)
	--ROGUE/WARLOCK
	if (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_WARLOCK()
		end
	--ROGUE/PRIEST
	elseif (sec == "AUGUR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_PRIEST()
		end
	--ROGUE/WARRIOR
	elseif (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_WARRIOR()
		end
	--ROGUE/MAGE
	elseif (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_MAGE()
		end
	--ROGUE/WARDEN
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_WARDEN()
		end
	--ROGUE/SCOUT
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_SCOUT()
		end
	--ROGUE/CHAMPION
	elseif (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_CHAMPION()
		end
	--ROGUE/BARD
	elseif (sec == "BARD") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_BARD()
		end
	--ROGUE/DRUID
	elseif (sec == "DRUID") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_DRUID()
		end
	--ROGUE/KNIGHT
	elseif (sec == "KNIGHT") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_ROGUE_KNIGHT()
		end
	end
end

function KNIGHT_engine(sec)
	--KNIGHT/WARLOCK
	if (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_KNIGHT_WARLOCK()
		end
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_KNIGHT_WARDEN()
		end
	end
end

function WARLOCK_engine(sec)
	--	WARLOCK/ROGUE
	if (sec == "THIEF") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_ROGUE()
		end
	elseif (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_WARRIOR()
		end
	elseif (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_CHAMPION()
		end
	elseif (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_MAGE()
		end
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_SCOUT()
		end
	elseif (sec == "BARD") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_BARD();
		end
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARLOCK_WARDEN()
		end
	end
end

function MAGE_engine(sec)
	--	MAGE/ROGUE
	if (sec == "THIEF") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_ROGUE()
		end
	elseif (sec == "AUGUR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_PRIEST()
		end
	elseif (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_WARRIOR()
		end
	elseif (sec == "KNIGHT") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_KNIGHT()
		end
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_WARDEN()
		end
	elseif (sec == "DRUID") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_DRUID()
		end
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_SCOUT()
		end
	elseif (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_WARLOCK()
		end
	elseif (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_MAGE_CHAMPION()
		end
	end
end

function WARRIOR_engine(sec)
	--WARRIOR/MAGE
	if (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_MAGE()
		end
	--WARRIOR/WARLOCK
	elseif (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_WARLOCK()
		end
	--WARRIOR/WARDEN
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_WARDEN()
		end
	--WARRIOR/SCOUT
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_SCOUT()
		end
	--WARRIOR/BARD
	elseif (sec == "BARD") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_BARD()
		end
	--WARRIOR/ROGUE
	elseif (sec == "THIEF") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_ROGUE()
		end
	elseif (sec == "AUGUR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARRIOR_PRIEST()
		end
	end
end

function DRUID_engine(sec)
	--	DRUID/WARRIOR
	if (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_DRUID_WARRIOR()
		end
	--	DRUID/WARLOCK
	elseif (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_DRUID_WARLOCK()
		end
	end
end

function SCOUT_engine(sec)
	--	SCOUT/MAGE
	if (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_MAGE()
		end
	--	SCOUT/DRUID
	elseif (sec == "DRUID") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_DRUID()
		end
	--	SCOUT/BARD
	elseif (sec == "BARD") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_BARD()
		end
	--	SCOUT/PRIEST
	elseif (sec == "AUGUR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_PRIEST()
		end
	--	SCOUT/WARDEN
	elseif (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_WARDEN()
		end
	--	SCOUT/WARRIOR
	elseif (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_WARRIOR()
		end
	--	SCOUT/ROGUE
	elseif (sec == "THIEF") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_ROGUE()
		end
	--	SCOUT/KNIGHT
	elseif (sec == "KNIGHT") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_KNIGHT()
		end
	elseif (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_CHAMPION()
		end
	elseif (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_SCOUT_WARLOCK()
		end
	end
end

--------------------------------
------------Clases--------------
--------------------------------
function WARDEN_engine(sec)
	--	WARDEN/CHAMPION
	if (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARDEN_CAMPION()
		end
	--	WARDEN/SCOUT
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARDEN_SCOUT()
		end
	--	WARDEN/SCOUT
	elseif (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_WARDEN_MAGE()
		end
	end
end

function AUGUR_engine(sec)
	--	WARDEN/CHAMPION
	if (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_PRIEST_WARRIOR()
		end
	end
end

function BARD_engine(sec)
	--	WARDEN/CHAMPION
	if (sec == "WARDEN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_WARDEN()
		end
	elseif (sec == "RANGER") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_SCOUT()
		end
	elseif (sec == "THIEF") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_ROGUE()
		end
	elseif (sec == "WARRIOR") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_WARRIOR()
		end
	elseif (sec == "MAGE") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_MAGE()
		end
	elseif (sec == "DRUID") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_DRUID()
		end
	elseif (sec == "HARPSYN") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_WARLOCK()
		end
	elseif (sec == "PSYRON") then
		if _G.COMBAT_ENGINE_IS_READY then
			CE_BARD_CHAMPION()
		end
	end
end