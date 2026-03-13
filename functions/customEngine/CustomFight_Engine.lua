COMBATENGINE_GLOBAL_CD = 0.15;
COMBATENGINE_GLOBAL_LAST_TARGET = "";
local IsCasting = false;
COMBAT_ENGINE_PLAYER_CONDICTIONS = {
	--Player
	[1] = { name = CE_LANG.conditions.hp, icon = "interface\\icons\\item_potion_010_001" },
	[2] = { name = CE_LANG.conditions.mana, icon = "interface\\icons\\item_potion_020_002" },
	[3] = { name = CE_LANG.conditions.focus, icon = "interface\\icons\\item_potion_030_006" },
	[4] = { name = CE_LANG.conditions.psi, icon = "interface\\icons\\dwarf_skill\\skill_har_war30-1" },
	[5] = { name = CE_LANG.conditions.energy, icon = "interface\\icons\\item_potion_070_002" },
	[6] = { name = CE_LANG.conditions.rage, icon = "interface\\icons\\item_potion_010_003" },
	[7] = { name = CE_LANG.conditions.bowSpeed, icon = "interface\\icons\\weapon\\wp_hero-village_bow" },
	[8] = { name = CE_LANG.conditions.mainHandSpeed, icon = "interface\\icons\\blade-m009_female_mall009" },
	[9] = { name = CE_LANG.conditions.offHandSpeed, icon = "interface\\icons\\dagger29_000_001" },
	[10] = { name = CE_LANG.conditions.castingSpeed, icon = "interface\\icons\\weapon\\wp_wand13_z37-01" },
	[11] = { name = CE_LANG.conditions.hasEffect, icon = "interface\\Icons\\boss_skill\\skill_boss_skill_16" },
	[12] = { name = CE_LANG.conditions.hasNoEffect, icon = "interface\\Icons\\boss_skill\\skill_boss_skill_27" },
	[13] = { name = CE_LANG.conditions.hasSelfEffect, icon = "interface\\icons\\skill_thi12-1" },
	[14] = { name = CE_LANG.conditions.hasNoSelfEffect, icon = "interface\\icons\\skill_ran6-3" },
	[15] = { name = CE_LANG.conditions.effectHasStack, icon = "interface\\icons\\coolsuit\\coolsuit_10" },
	[16] = { name = CE_LANG.conditions.effectNoStack, icon = "interface\\icons\\coolsuit\\coolsuit_unshow" },
	[17] = { name = CE_LANG.conditions.effectEndTime, icon = "interface\\icons\\christmas_08" },
	--Control
	[18] = { name = CE_LANG.conditions.isNotCombat, icon = "interface\\icons\\arcadia\\aod\\1503010.dds" },
	[19] = { name = CE_LANG.conditions.isNotMoving, icon = "interface\\icons\\arcadia\\aod\\1503005.dds" },
	[20] = { name = CE_LANG.conditions.pressShift, icon = "interface\\icons\\arcadia\\bard_skills\\bp\\bp_skill_007.dds" },
	[21] = { name = CE_LANG.conditions.pressCtrl, icon = "interface\\icons\\arcadia\\bard_skills\\bp\\bp_skill_009.dds" },
	[22] = { name = CE_LANG.conditions.pressAlt, icon = "interface\\icons\\arcadia\\ccombos\\kwd\\60elite.dds" },
	[23] = { name = CE_LANG.conditions.hasShield, icon = "interface\\icons\\weapon\\wp_shield-m006_001" },
	[24] = { name = CE_LANG.conditions.hasTwoHand, icon = "interface\\icons\\arcadia_item\\weapons\\1210667.dds" },
	[25] = { name = CE_LANG.conditions.castingSuccessful, icon = "interface\\icons\\skill_mag6-2" },
	[26] = { name = CE_LANG.conditions.waitTime, icon = "interface\\icons\\arcadia\\ccombos\\wls\\35elite.dds"},
	--Target
	[27] = { name = CE_LANG.conditions.targetHP, icon = "interface\\icons\\item_potion_010_001" },
	[28] = { name = CE_LANG.conditions.targetOnMe, icon = "interface\\icons\\elf_skill\\skill_ran_war60" },
	[29] = { name = CE_LANG.conditions.targetIsBoss, icon = "interface\\icons\\arcadia\\aod\\1502983.dds" },
	[30] = { name = CE_LANG.conditions.isCasting, icon = "interface\\icons\\dwarf_skill\\skill_mag_har45-1" },
	[31] = { name = CE_LANG.conditions.isCastingName, icon = "interface\\icons\\dwarf_skill\\skill_mag_new20-1" },
	[32] = { name = CE_LANG.conditions.hasEffect, icon = "interface\\Icons\\boss_skill\\skill_boss_skill_16" },
	[33] = { name = CE_LANG.conditions.hasNoEffect, icon = "interface\\Icons\\boss_skill\\skill_boss_skill_27" },
	[34] = { name = CE_LANG.conditions.hasSelfEffect, icon = "interface\\icons\\skill_thi12-1" },
	[35] = { name = CE_LANG.conditions.hasNoSelfEffect, icon = "interface\\icons\\skill_ran6-3" },
	[36] = { name = CE_LANG.conditions.effectHasStack, icon = "interface\\icons\\coolsuit\\coolsuit_10" },
	[37] = { name = CE_LANG.conditions.effectNoStack, icon = "interface\\icons\\coolsuit\\coolsuit_unshow" },
	[38] = { name = CE_LANG.conditions.effectEndTime, icon = "interface\\icons\\christmas_08" },
	--Engine
	[39] = { name = CE_LANG.conditions.cEngAOE, icon = "Interface\\addons\\CombatEngine\\texture\\AOE_ON.tga" },
	[40] = { name = CE_LANG.conditions.cEngConsumable, icon = "Interface\\addons\\CombatEngine\\texture\\CONSUMABLES_ON.tga" },
	[41] = { name = CE_LANG.conditions.cEngFastBuff, icon = "Interface\\addons\\CombatEngine\\texture\\BUFFS_ON.tga" },
	[42] = { name = CE_LANG.conditions.cEngPerfectSlide, icon = "Interface\\addons\\CombatEngine\\texture\\SLIDE_ON.tga" },
	[43] = { name = CE_LANG.conditions.cEngAutoSpellAoE, icon = "interface\\icons\\skill_mag_new45-5" },
	[44] = { name = CE_LANG.conditions.cEngAutoShoot, icon = "interface\\Icons\\skill_ran_new35-7" },

	--Updates
	[45] = { name = CE_LANG.conditions.targetIsNotABoss, icon = "interface\\icons\\pet_rabbit01" },
	[46] = { name = CE_LANG.conditions.beforeBuffEnd, icon = "interface\\icons\\skill_thi27-2" },
	[47] = { name = CE_LANG.conditions.beforeBuffEnd, icon = "interface\\Icons\\skill_mag30-2" },
	[48] = { name = CE_LANG.conditions.isMoving, icon = "interface\\icons/arcadia/bard_skills/rb/rb_skill_002.dds" },
	[49] = { name = CE_LANG.conditions.targetName, icon = "interface\\icons/prestige-type-png/prestige-experience-boost/scroll/wisdom-scroll/blood-wisdom-scroll.dds" },
	[50] = { name = CE_LANG.conditions.targetIsPlayer, icon = "interface\\icons/shop_goods/pet_gingerbread _red.dds" },
	[51] = { name = CE_LANG.conditions.targetIsNotPlayer, icon = "interface\\icons/festival/fe_greenfrog.dds" },
	[52] = { name = CE_LANG.conditions.playerWithLowestHealth, icon = "interface\\icons/skill_aug42-3" },
	[53] = { name = CE_LANG.conditions.targetMe, icon = "interface\\icons/dwarf_skill/skill_har1-2" },
	[54] = { name = CE_LANG.conditions.targetByName, icon = "interface\\icons/skill_aug36-1" },
	[55] = { name = CE_LANG.conditions.ForceEnemyTarget, icon = "interface\\icons/dwarf_skill/skill_har_pri70-1" },
	[56] = { name = CE_LANG.conditions.returnToFriendTarget, icon = "interface\\icons/skill_war_new50-5" },
	[57] = { name = CE_LANG.conditions.targetTank, icon = "interface\\icons/skill_kni27-2" },
}

function CE_CUSTOM_CONDITIONPLAYER_OnLoad( this )
	local obj = this:GetID()
	local icon = COMBAT_ENGINE_PLAYER_CONDICTIONS[obj].icon;
	this.name:SetText( COMBAT_ENGINE_PLAYER_CONDICTIONS[obj].name );
	this.icon:SetFile( icon );
end

function CE_ConditionFrame_OnLoad( this)
	this:RegisterEvent("CASTING_START");
	this:RegisterEvent("CASTING_STOP");
	this:RegisterEvent("CASTING_FAILED");
end

function CE_CUSTOM_liberateCast()
	IsCasting = false;
end

function CE_ConditionFrame_OnEvent( this, event )
	if event == "CASTING_START" then
		IsCasting = true;
	elseif event == "CASTING_STOP" or event == "CASTING_FAILED" then
		if not TimerQueue["delayCast"] then
			TimerQueue["delayCast"] = { GetTime() + 0.1, CE_CUSTOM_liberateCast};
		end
	end
end

local function ce_conditions(i, preset)
	local serial
	if not preset or preset < 1 or preset > 5 then
		serial = COMBAT_ENG_SERIAL;
	else
		if preset == 1 then
			serial = COMBAT_ENG_SERIAL;
		else
			serial = COMBAT_ENG_SERIAL_RAW .. preset;
		end
	end
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial][i]

	if not skill then return false end
	if not skill.conditions then return true end

	local useBlock1 = CE_COND51( skill ) and CE_COND52( skill ) and CE_COND54( skill )
	local useBlock2 = CE_COND1( skill ) and CE_COND2( skill ) and CE_COND3( skill ) and CE_COND4( skill ) and CE_COND5( skill );
	local useBlock3 = CE_COND6( skill ) and CE_COND7( skill ) and CE_COND8( skill ) and CE_COND9( skill ) and CE_COND10( skill );
	local useBlock4 = CE_COND11( skill ) and CE_COND12( skill ) and CE_COND13( skill ) and CE_COND14( skill ) and CE_COND15( skill );
	local useBlock5 = CE_COND16( skill ) and CE_COND17( skill ) and CE_COND18( skill ) and CE_COND19( skill ) and CE_COND20( skill );
	local useBlock6 = CE_COND21( skill ) and CE_COND22( skill ) and CE_COND23( skill ) and CE_COND24( skill ) and CE_COND25( skill );
	local useBlock7 = CE_COND26( skill ) and CE_COND27( skill ) and CE_COND28( skill ) and CE_COND29( skill ) and CE_COND30( skill );
	local useBlock8 = CE_COND31( skill ) and CE_COND32( skill ) and CE_COND33( skill ) and CE_COND34( skill ) and CE_COND35( skill );
	local useBlock9 = CE_COND36( skill ) and CE_COND37( skill ) and CE_COND38( skill ) and CE_COND39( skill ) and CE_COND40( skill );
	local useBlock10 = CE_COND41( skill ) and CE_COND42( skill ) and CE_COND44( skill ) and CE_COND45(skill);
	local useBlock11 = CE_COND46(skill) and CE_COND47(skill) and CE_COND48(skill) and CE_COND49(skill) and CE_COND50(skill);

	local use = useBlock1 and useBlock2 and useBlock3 and useBlock4 and useBlock5 and useBlock6 and useBlock7 and useBlock8 and useBlock9 and useBlock10 and useBlock11
	return use;
end

local function CastAoe()
	SpellTargetUnit("mouseover") 
end

local function use_skill(i, preset)
	local serial
	if not preset or preset < 1 or preset > 5 then
		serial = COMBAT_ENG_SERIAL;
	else
		if preset == 1 then
			serial = COMBAT_ENG_SERIAL_RAW;
		else
			serial = COMBAT_ENG_SERIAL_RAW .. preset;
		end
	end
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial][i]
	
	if not skill then return end

	local indexA, indexB = skill.IndexA, skill.IndexB;
	local type = skill.type;
	if type == "skill" then

		if UnitIsPlayer("target") then
			COMBATENGINE_GLOBAL_LAST_TARGET = UnitName("target");
		end

		if skill.conditions and skill.conditions[53] and skill.conditions[53].status == true then
			TargetUnit("player");
			COMBATENGINE_GLOBAL_LAST_TARGET = "player";
		else
			--Force Enemy Target
			if skill.conditions and skill.conditions[55] and skill.conditions[55].status == true then
				if UnitIsPlayer("target") or not UnitIsNPC("target") then
					TargetNearestEnemy();
				end
			end

			--Player with Lowest Health
			if skill.conditions and skill.conditions[52] and skill.conditions[52].status == true then
				local lowHp ="player"
				local lowestValue = 100;
				
				local numMembers = 0;
				local hpPercent = 100;
				local prevPercent = 100;

				if GetNumRaidMembers() == 0 then
					numMembers = GetNumPartyMembers()
				else
					numMembers = GetNumRaidMembers()
				end

				for i = 1, numMembers do
					local percent = UnitHealth("raid" .. i) / UnitMaxHealth("raid" .. i) * 100
					if percent < lowestValue then
						lowestValue = percent
						lowHp = "raid" .. i
					end
				end

				if numMembers == 0 then
					lowestValue = UnitHealth("player") / UnitMaxHealth("player") * 100
					lowHp = "player"
				end

				if not UnitIsDeadOrGhost(lowHp) and lowestValue < 100 then
					TargetUnit(lowHp);
				else
					return false
				end
			end

			--Target Tank
			if skill.conditions and skill.conditions[57] and skill.conditions[57].status == true then
				if UnitIsPlayer("target") or not UnitIsNPC("target") then
					TargetNearestEnemy();
				end
				if CE_GetMostAggroTarget() then
					if UnitIsPlayer(CE_GetMostAggroTarget()) then
						TargetUnit( CE_GetMostAggroTarget() );
						COMBATENGINE_GLOBAL_LAST_TARGET = UnitName(CE_GetMostAggroTarget());
					else
						TargetUnit( "player" );
						COMBATENGINE_GLOBAL_LAST_TARGET = "player";
					end
				else
					TargetUnit( "player" );
					COMBATENGINE_GLOBAL_LAST_TARGET = "player";	
				end
			end

			--Return to Last Target
			if skill.conditions and skill.conditions[56] and skill.conditions[56].status == true then
				local numMembers = 0;
				if GetNumRaidMembers() == 0 then
					numMembers = GetNumPartyMembers()
				else
					numMembers = GetNumRaidMembers()
				end
				for i = 1, numMembers do
					if UnitName("raid" .. i) == COMBATENGINE_GLOBAL_LAST_TARGET then
						TargetUnit("raid" .. i);
						break;
					end
				end
			end

		end

		if skill.conditions and skill.conditions[43] and skill.conditions[43].status == true and IsCasting == false then
			UseSkill( indexA, indexB );
			if not TimerQueue["castAoe"] then
				TimerQueue["castAoe"] = { GetTime() + 0.1, CastAoe};
			end
		else
			UseSkill( indexA, indexB );
		end
		CE_SetCond26Cooldown(skill);
	elseif type == "item" and skill.enabled then
		CE_UseItem( skill.id );
		CE_SetCond26Cooldown(skill);
	elseif type == "skillplate" and skill.enabled then
		if CE_ISS_CD( CE_toName(skill.id) ) then
			if skill.conditions and skill.conditions[43] and skill.conditions[43].status == true and IsCasting == false then
				CastSpellByName( CE_toName(skill.id) );
				if not TimerQueue["castAoe"] then
					TimerQueue["castAoe"] = { GetTime() + 0.1, CastAoe};
				end
				CE_SetCond26Cooldown(skill);
			else			
				CastSpellByName( CE_toName(skill.id) );
				CE_SetCond26Cooldown(skill);
			end
		else
			print("CD")
		end
	elseif type == "equip" then
		UseEquipmentItem( skill.IndexA );
		CE_SetCond26Cooldown(skill);
	end
end

local function getCD(i, preset)
	local serial
	if not preset or preset < 1 or preset > 5 then
		serial = COMBAT_ENG_SERIAL;
	else
		if preset == 1 then
			serial = COMBAT_ENG_SERIAL_RAW;
		else
			serial = COMBAT_ENG_SERIAL_RAW .. preset;
		end
	end
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial][i]	
	if skill then
		local indexA, indexB = skill.IndexA, skill.IndexB;
		local Skill_CD = CE_CD( true, indexA, indexB );
		if skill.type == "skill" then
			return Skill_CD <= COMBATENGINE_GLOBAL_CD
		elseif skill.type == "item" then
			if skill.enabled then
				return CE_UseItem( skill.id )
			else
				return false
			end
		elseif skill.type == "skillplate" then
			return CE_ISS_CD( CE_toName(skill.id) )
		elseif skill.type == "equip" then
			local duration, remaining = GetEquipItemCooldown( skill.IndexA );
			return remaining <= COMBATENGINE_GLOBAL_CD
		elseif skill.type == "macro" then
			local _, _, macro = GetMacroInfo( skill.IndexA );
			ExecuteMacroLine( macro );
			return false
		end
	else
		return false
	end
end

local function isEnabledSkill(i, preset)
	local serial
	if not preset or preset < 1 or preset > 5 then
		serial = COMBAT_ENG_SERIAL;
	else
		if preset == 1 then
			serial = COMBAT_ENG_SERIAL;
		else
			serial = COMBAT_ENG_SERIAL_RAW .. preset;
		end
	end
	return COMBAT_ENGINE_CUSTOM_PRESETS[serial][i] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][i].enabled
end

function CE_UseCustomPreset( preset )
	for i = 1, COMBAT_ENG_MAXSKILLS do
		if isEnabledSkill(i, preset) then
			if ce_conditions(i, preset) and getCD(i, preset) then
				use_skill(i, preset)
				break
			end
		end
	end
end
----------------------------------------------------------------------------------------
-------------------------------------- CONDITIONS -------------------------------------- 
----------------------------------------------------------------------------------------
-- Player HP
function CE_COND1(skill)
	if not skill.conditions or not skill.conditions[1] then
		return true
	end

    if skill.conditions[1].status == false then
        return true
    else
        local hp = UnitHealth("player")
        local MaxHp = UnitMaxHealth("player")
        local min = tonumber( skill.conditions[1].min ) or 0;
        local max = tonumber( skill.conditions[1].max ) or 0;
        if hp >= MaxHp * min / 100 and hp <= MaxHp * max / 100 then
            return true
        else
            return false
        end
    end
end
--Mana
function CE_COND2(skill)
	if not skill.conditions or not skill.conditions[2] then
		return true
	end

    if skill.conditions[2].status == false then
        return true
    else
        local min = tonumber( skill.conditions[2].min ) or 0;
        local max = tonumber( skill.conditions[2].max ) or 0;
		if UnitManaType("player") == 1 then 
			local mana = UnitMana("player")
			local MaxMana = UnitMaxMana("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		elseif UnitSkillType("player") == 1 then
			local mana = UnitSkill("player")
			local MaxMana = UnitMaxSkill("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		else
			return true
		end
    end
end
--Focus
function CE_COND3(skill)
	if not skill.conditions or not skill.conditions[3] then
		return true
	end
    if skill.conditions[3].status == false then
        return true
    else
        local min = tonumber( skill.conditions[3].min ) or 0;
        local max = tonumber( skill.conditions[3].max ) or 0;
		if UnitManaType("player") == 3 then 
			local mana = UnitMana("player")
			local MaxMana = UnitMaxMana("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		elseif UnitSkillType("player") == 3 then
			local mana = UnitSkill("player")
			local MaxMana = UnitMaxSkill("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		else
			return true
		end
    end
end
--PSI
function CE_COND4(skill)
	if not skill.conditions or not skill.conditions[4] then
		return true
	end
    if skill.conditions[4].status == false then
        return true
    else
        local min = tonumber( skill.conditions[4].min ) or 0;
        local max = tonumber( skill.conditions[4].max ) or 0;
		local psi = GetSoulPoint();
		if psi == -1 then
			return true
		elseif psi >= min and psi <= max then
			return true
		else
			return false
		end		
    end
end
-- Energy
function CE_COND5(skill)
	if not skill.conditions or not skill.conditions[5] then
		return true
	end
    if skill.conditions[5].status == false then
        return true
    else
        local min = tonumber( skill.conditions[5].min ) or 0;
        local max = tonumber( skill.conditions[5].max ) or 0;
		if UnitManaType("player") == 4 then 
			local mana = UnitMana("player")
			local MaxMana = UnitMaxMana("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		elseif UnitSkillType("player") == 4 then
			local mana = UnitSkill("player")
			local MaxMana = UnitMaxSkill("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		else
			return true
		end
    end
end
-- Rage
function CE_COND6(skill)
	if not skill.conditions or not skill.conditions[6] then
		return true
	end
    if skill.conditions[6].status == false then
        return true
    else
        local min = tonumber( skill.conditions[6].min ) or 0;
        local max = tonumber( skill.conditions[6].max ) or 0;
		if UnitManaType("player") == 2 then 
			local mana = UnitMana("player")
			local MaxMana = UnitMaxMana("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		elseif UnitSkillType("player") == 2 then
			local mana = UnitSkill("player")
			local MaxMana = UnitMaxSkill("player")
			if mana >= MaxMana * min / 100 and mana <= MaxMana * max / 100 then
				return true
			else
				return false
			end
		else
			return true
		end
    end
end
-- Bow speed
function CE_COND7(skill)
	if not skill.conditions or not skill.conditions[7] then
		return true
	end
    if skill.conditions[7].status == false then
        return true
    else
        local min = tonumber( skill.conditions[7].min ) or 0;
        local max = tonumber( skill.conditions[7].max ) or 0;
		local _, _, speed = GetPlayerAbility("BOW_ATTACKSPEED");
		if speed >= min and speed <= max then
			return true
		else
			return false
		end
    end
end
-- Main Hand speed
function CE_COND8(skill)
	if not skill.conditions or not skill.conditions[8] then
		return true
	end
    if skill.conditions[8].status == false then
        return true
    else
        local min = tonumber( skill.conditions[8].min ) or 0;
        local max = tonumber( skill.conditions[8].max ) or 0;
		local _, _, speed = GetPlayerAbility("MAIN_ATTACKSPEED");
		if speed >= min and speed <= max then
			return true
		else
			return false
		end
    end
end
-- OFF Hand speed
function CE_COND9(skill)
	if not skill.conditions or not skill.conditions[9] then
		return true
	end
    if skill.conditions[9].status == false then
        return true
    else
        local min = tonumber( skill.conditions[9].min ) or 0;
        local max = tonumber( skill.conditions[9].max ) or 0;
		local _, _, speed = GetPlayerAbility("OFF_ATTACKSPEED");
		if speed >= min and speed <= max then
			return true
		else
			return false
		end
    end
end
-- Cast Speed
function CE_COND10(skill)
	if not skill.conditions or not skill.conditions[10] then
		return true
	end
    if skill.conditions[10].status == false then
        return true
    else
        local min = tonumber( skill.conditions[10].min ) or 0;
        local max = tonumber( skill.conditions[10].max ) or 0;
		local base, bonus = GetPlayerAbility("MAGIC_CASTSPEED");
		local speed = base + bonus;
		if speed >= min and speed <= max then
			return true
		else
			return false
		end
    end
end
-- Player has Effect
function CE_COND11(skill)
	if not skill.conditions or not skill.conditions[11] then
		return true
	end
	if skill.conditions[11].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[11].id1) or 0,
			tonumber(skill.conditions[11].id2) or 0,
			tonumber(skill.conditions[11].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[11].id4) or 0

		local allEffectsActive = true
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_BuffIdPlayer(fx) then
				allEffectsActive = false
				break
			end
		end

		local effect4Active = effect4 ~= 0 and CE_BuffIdPlayer( effect4 ) or false;
		if effect4Active then
			return true			
		else
			return allEffectsActive
		end
	end
end
--Player has no effect
function CE_COND12(skill)
	if not skill.conditions or not skill.conditions[12] then
		return true
	end
	if skill.conditions[12].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[12].id1) or 0,
			tonumber(skill.conditions[12].id2) or 0,
			tonumber(skill.conditions[12].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[12].id4) or 0
		local noEffect = false
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_BuffIdPlayer(fx) then
				noEffect = true
				break
			end
		end
		local another = effect4 ~= 0 and CE_BuffIdPlayer( effect4 ) == false or false;
		if another then
			return true			
		else
			return noEffect
		end
    end
end
-- Player has SELF Effect
function CE_COND13(skill)
	if not skill.conditions or not skill.conditions[13] then
		return true
	end
	if skill.conditions[13].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[13].id1) or 0,
			tonumber(skill.conditions[13].id2) or 0,
			tonumber(skill.conditions[13].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[13].id4) or 0

		local allEffectsActive = true
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_SELF_BUFF(fx) then
				allEffectsActive = false
				break
			end
		end

		local effect4Active = effect4 ~= 0 and CE_SELF_BUFF( effect4 ) or false;
		if effect4Active then
			return true			
		else
			return allEffectsActive
		end
	end
end
--Player has no SELF effect
function CE_COND14(skill)
	if not skill.conditions or not skill.conditions[14] then
		return true
	end
	if skill.conditions[14].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[14].id1) or 0,
			tonumber(skill.conditions[14].id2) or 0,
			tonumber(skill.conditions[14].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[14].id4) or 0
		local noEffect = false
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_SELF_BUFF(fx) then
				noEffect = true
				break
			end
		end
		local another = effect4 ~= 0 and CE_SELF_BUFF( effect4 ) == false or false;
		if another then
			return true			
		else
			return noEffect
		end
    end
end
-- Player has effect Stack
function CE_COND15(skill)
	if not skill.conditions or not skill.conditions[15] then
		return true
	end
    if not skill.conditions[15].status then
        return true
    end

    local effect = tonumber( skill.conditions[15].id )
    local stack = tonumber( skill.conditions[15].stack ) or 1
    local self = skill.conditions[15].self
    local orMore = skill.conditions[15].orMore
	
    if self then
		if stack > 1 then
			if orMore then
				return CE_SELF_BUFF(effect, stack, orMore);
			else
				return CE_SELF_BUFF(effect, stack);
			end			
		else
			return CE_SELF_BUFF(effect);
		end
    else
		if stack > 1 then
			if orMore then
				return CE_BuffIdPlayer(effect, stack, orMore);
			else
				return CE_BuffIdPlayer(effect, stack);
			end			
		else
			return CE_BuffIdPlayer(effect);
		end
    end
end
-- Player has no effect Stack
function CE_COND16(skill)
	if not skill.conditions or not skill.conditions[16] then
		return true
	end
    if not skill.conditions[16].status then
        return true
    end

    local effect = tonumber( skill.conditions[16].id )
    local stack = tonumber( skill.conditions[16].stack ) or 1
    local self = skill.conditions[16].self
    local orMore = skill.conditions[16].orMore

    if self then
        if CE_SELF_BUFF(effect) then
			if stack > 1 then
				if orMore then
					return not CE_SELF_BUFF(effect, stack, orMore)
				else
					return not CE_SELF_BUFF(effect, stack)
				end
			else
				return true
			end
        else
            return true
        end
    else
        if CE_BuffIdPlayer(effect) then
			if stack > 1 then
				if orMore then
					return not CE_BuffIdPlayer(effect, stack, orMore)
				else
					return not CE_BuffIdPlayer(effect, stack)
				end
			else
				return true
			end
        else
            return true
        end
    end
end
--Player After buff end Time
function CE_COND17(skill)
	if not skill.conditions or not skill.conditions[17] then
		return true
	end
	if skill.conditions[17].status == false then
		return true
	else
		local effect = tonumber( skill.conditions[17].id ) or 0;
		local time = tonumber( skill.conditions[17].time ) or 0;
		return not CE_BuffIdPlayer( effect ) and CE_AFE_2( effect, time ) and not IsCasting;
	end
end
--IsCombat
function CE_COND18(skill)
	if not skill.conditions or not skill.conditions[18] then
		return true
	end
	if skill.conditions[18].status == false then
		return true
	else
		return not GetPlayerCombatState();
	end
end
--IsMoving
function CE_COND19(skill)
	if not skill.conditions or not skill.conditions[19] then
		return true
	end
	if skill.conditions[19].status == false then
		return true
	else
		return not CE_isMoving();
	end
end
--Press Shift
function CE_COND20(skill)
	if not skill.conditions or not skill.conditions[20] then
		return true
	end
	if skill.conditions[20].status == false then
		return true
	else
		return IsShiftKeyDown();
	end
end
--Press Ctrl
function CE_COND21(skill)
	if not skill.conditions or not skill.conditions[21] then
		return true
	end
	if skill.conditions[21].status == false then
		return true
	else
		return IsCtrlKeyDown();
	end
end
--Press Alt
function CE_COND22(skill)
	if not skill.conditions or not skill.conditions[22] then
		return true
	end
	if skill.conditions[22].status == false then
		return true
	else
		return IsAltKeyDown();
	end
end
--Has Shield
function CE_COND23(skill)
	if not skill.conditions or not skill.conditions[23] then
		return true
	end
	if skill.conditions[23].status == false then
		return true
	else
		local link = GetInventoryItemLink("player", 16)
		if link then
			local a,b,c = ParseHyperlink(link)
			local id_hex = string.sub(b, 1, 6)
			local id_decimal = tonumber(id_hex, 16)
			local type_weapon = GetObjectInfo(id_decimal, "armortype")
			if type_weapon and type_weapon == 5 then
				return true
			else
				return false
			end
		else
			return false
		end
	end
end
--Has two hand weapon
function CE_COND24(skill)
	if not skill.conditions or not skill.conditions[24] then
		return true
	end
	if skill.conditions[24].status == false then
		return true
	else
		local link = GetInventoryItemLink("player", 15)
		if link then
			local a,b,c = ParseHyperlink(link)
			local id_hex = string.sub(b, 1, 6)
			local id_decimal = tonumber(id_hex, 16)
			local type_weapon = GetObjectInfo(id_decimal, "weaponpos")
			if type_weapon and ( type_weapon == 3 ) then
				return true
			else
				return false
			end
		else
			return false
		end
	end
end
--Casting Successful
function CE_COND25(skill)
	if not skill.conditions or not skill.conditions[25] then
		return true
	end
	if skill.conditions[25].status == false then
		return true
	else
		return not IsCasting
	end
end
--Wait Time
local CE_COND26_COOLDOWNS = {}

function CE_SetCond26Cooldown( skill )
	if not skill or not skill.conditions or not skill.conditions[26] or skill.conditions[26].status == false then
		return
	end

	local wait = tonumber( skill.conditions[26].time ) or 0;
	wait = wait > 0 and wait or 0.3;

	local key = skill.id or ((skill.IndexA or "x") .. "-" .. (skill.IndexB or "y"));
	CE_COND26_COOLDOWNS[key] = GetTime() + wait;
end

function CE_COND26(skill)
	if not skill.conditions or not skill.conditions[26] then
		return true
	end
	if skill.conditions[26].status == false then
		return true
	end

	local key = skill.id or ((skill.IndexA or "x") .. "-" .. (skill.IndexB or "y"));
	local nextReady = CE_COND26_COOLDOWNS[key] or 0;

	return GetTime() >= nextReady;
end
-- Target HP
function CE_COND27(skill)
	if not skill.conditions or not skill.conditions[27] then
		return true
	end
    if skill.conditions[27].status == false then
        return true
    else
        local hp = UnitHealth("target")
        local MaxHp = UnitMaxHealth("target")
        local min = tonumber( skill.conditions[27].min ) or 0;
        local max = tonumber( skill.conditions[27].max ) or 0;
        if hp >= MaxHp * min / 100 and hp <= MaxHp * max / 100 then
            return true
        else
            return false
        end
    end
end
-- Target On me
function CE_COND28(skill)
	if not skill.conditions or not skill.conditions[28] then
		return true
	end
    if skill.conditions[28].status == false then
        return true
    else
		local targetTarget = UnitName("targettarget") or "";
		local player = UnitName("player")
		if targetTarget == player then
			return true
		else
			return false
		end
    end
end
-- Target isBoss
function CE_COND29(skill)
	if not skill.conditions or not skill.conditions[29] then
		return true
	end
    if skill.conditions[29].status == false then
        return true
    else
		return UnitSex("target") >= 3
    end
end
-- Target isCasting
function CE_COND30(skill)
	if not skill.conditions or not skill.conditions[30] then
		return true
	end
    if skill.conditions[30].status == false then
        return true
    else
		local name, maxValue, currValue = UnitCastingTime("target");
		return name ~= nil;
    end
end
-- Target isCasting Name
function CE_COND31(skill)
	if not skill.conditions or not skill.conditions[31] then
		return true
	end
    if skill.conditions[31].status == false then
        return true
    else
		local castName, maxValue, currValue = UnitCastingTime("target");
		local Skillname = skill.conditions[31].name
		return castName ~= nil and castName == Skillname;
    end
end
-- Target has Effect
function CE_COND32(skill)
	if not skill.conditions or not skill.conditions[32] then
		return true
	end
	if skill.conditions[32].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[32].id1) or 0,
			tonumber(skill.conditions[32].id2) or 0,
			tonumber(skill.conditions[32].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[32].id4) or 0

		local allEffectsActive = true
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_DebuffIdTarget(fx) then
				allEffectsActive = false
				break
			end
		end

		local effect4Active = effect4 ~= 0 and CE_DebuffIdTarget( effect4 ) or false;
		if effect4Active then
			return true			
		else
			return allEffectsActive
		end
	end
end
--Target has no effect
function CE_COND33(skill)
	if not skill.conditions or not skill.conditions[33] then
		return true
	end
	if skill.conditions[33].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[33].id1) or 0,
			tonumber(skill.conditions[33].id2) or 0,
			tonumber(skill.conditions[33].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[33].id4) or 0
		local noEffect = false
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_DebuffIdTarget(fx) then
				noEffect = true
				break
			end
		end
		local another = effect4 ~= 0 and CE_DebuffIdTarget( effect4 ) == false or false;
		if another then
			return true			
		else
			return noEffect
		end
    end
end
-- Target has SELF Effect
function CE_COND34(skill)
	if not skill.conditions or not skill.conditions[34] then
		return true
	end
	if skill.conditions[34].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[34].id1) or 0,
			tonumber(skill.conditions[34].id2) or 0,
			tonumber(skill.conditions[34].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[34].id4) or 0

		local allEffectsActive = true
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_SELF_DEBUFF(fx) then
				allEffectsActive = false
				break
			end
		end

		local effect4Active = effect4 ~= 0 and CE_SELF_DEBUFF( effect4 ) or false;
		if effect4Active then
			return true			
		else
			return allEffectsActive
		end
	end
end
--The target has no SELF effect
function CE_COND35(skill)
	if not skill.conditions or not skill.conditions[35] then
		return true
	end
	if skill.conditions[35].status == false then
		return true
	else
		local effects = {
			tonumber(skill.conditions[35].id1) or 0,
			tonumber(skill.conditions[35].id2) or 0,
			tonumber(skill.conditions[35].id3) or 0
		}
		local effect4 = tonumber(skill.conditions[35].id4) or 0
		local noEffect = false
		for _, fx in ipairs(effects) do
			if fx ~= 0 and not CE_SELF_DEBUFF(fx) then
				noEffect = true
				break
			end
		end
		local another = effect4 ~= 0 and CE_SELF_DEBUFF( effect4 ) == false or false;
		if another then
			return true			
		else
			return noEffect
		end
    end
end
--Target has effect Stack
function CE_COND36(skill)
	if not skill.conditions or not skill.conditions[36] then
		return true
	end
	if skill.conditions[36].status == false then
		return true
	else
		local effect = tonumber( skill.conditions[36].id ) or 0;
		local stack = tonumber( skill.conditions[36].stack ) or 0;
		stack = stack ~= 0 and stack or 1;		
		local self = skill.conditions[36].self
		local orMore = skill.conditions[36].orMore
		
		if self then
			return CE_SELF_DEBUFF( effect ) and CE_SELF_DEBUFF( effect, stack, orMore )
		else
			return CE_DebuffIdTarget( effect ) and CE_DebuffIdTarget( effect, stack, orMore )
		end		
	end
end
--Target has no effect Stack
function CE_COND37(skill)
	if not skill.conditions or not skill.conditions[37] then
		return true
	end
	if skill.conditions[37].status == false then
		return true
	else
		local effect = tonumber( skill.conditions[37].id ) or 0;
		local stack = tonumber( skill.conditions[37].stack ) or 0;
		stack = stack ~= 0 and stack or 1;		
		local self = skill.conditions[37].self
		local orMore = skill.conditions[37].orMore
		
		if self then
			if CE_SELF_DEBUFF( effect ) and not CE_SELF_DEBUFF( effect, stack, orMore ) then
				return true
			elseif CE_SELF_DEBUFF( effect ) and CE_SELF_DEBUFF( effect, stack, orMore ) then
				return false
			elseif not CE_SELF_DEBUFF( effect ) then
				return true
			end
		else
			if CE_DebuffIdTarget( effect ) and not CE_DebuffIdTarget( effect, stack, orMore ) then
				return true
			elseif CE_DebuffIdTarget( effect ) and CE_DebuffIdTarget( effect, stack, orMore ) then
				return false
			elseif not CE_DebuffIdTarget( effect ) then
				return true
			end
		end
		
	end
end
--Target After buff + Time
function CE_COND38(skill)
	if not skill.conditions or not skill.conditions[38] then
		return true
	end
	if skill.conditions[38].status == false then
		return true
	else
		local effect = tonumber( skill.conditions[38].id ) or 0;
		local time = tonumber( skill.conditions[38].time ) or 0;
		return not CE_BuffIdPlayer( effect ) and CE_AFE_2_TARGET( effect, time ) and not IsCasting;
	end
end
-- Combat Engine Aoe
function CE_COND39(skill)
	if not skill.conditions or not skill.conditions[39] then
		return true
	end
	if skill.conditions[39].status == false then
		return true
	else
		return C_EngineSettings.AOE
	end
end
-- Combat Engine Consumables
function CE_COND40(skill)
	if not skill.conditions or not skill.conditions[40] then
		return true
	end
	if skill.conditions[40].status == false then
		return true
	else
		return C_EngineSettings.Consumables
	end
end
-- Combat Engine Fast Buffs
function CE_COND41(skill)
	if not skill.conditions or not skill.conditions[41] then
		return true
	end
	if skill.conditions[41].status == false then
		return true
	else
		return C_EngineSettings.FastBuffs
	end
end
-- Combat Engine Perfect Slide
function CE_COND42(skill)
	if not skill.conditions or not skill.conditions[42] then
		return true
	end
	if skill.conditions[42].status == false then
		return true
	else
		local MAIN_CLASS, SEC_CLASS = UnitClassToken("player")
		if MAIN_CLASS == "THIEF" then
			CE_PERFECT_SLIDE();
			return false
		else
			return true
		end
	end
end
-- Condition 43 == AutoAoe
-- Auto shoot 44
function CE_COND44(skill)
	if not skill.conditions or not skill.conditions[44] then
		return true
	end
	local autoShootId = {
		["RANGER"] = 492589,
		["RANGERWARRIOR"] = 492589,
		["RANGERTHIEF"] = 492589,
		["RANGERAUGUR"] = 492589,
		["RANGERKNIGHT"] = 492589,
		["RANGERWARDEN"] = 492589,
		["RANGERDRUID"] = 492589,
		["RANGERHARPSYN"] = 1490789,
		["RANGERBARD"] = 492589,
		["RANGERPSYRON"] = 1490917,
		["BARDPSYRON"] = 1491206,	
	}
	local id = autoShootId[COMBAT_ENG_SERIAL]
	if skill.conditions[44].status == false then
		return true
	else
		if id then
			CE_NewAutoShoot(id);
			return false
		else
			return true
		end
	end
end
-- Target isBoss 
function CE_COND45(skill)
	if not skill.conditions or not skill.conditions[45] then
		return true
	end
    if skill.conditions[45].status == false then
        return true
    else
		local isBoss = UnitSex("target") >= 3
		return not isBoss
    end
end
-- Before Buff End Player
function CE_COND46(skill)
	if not skill.conditions or not skill.conditions[46] then
		return true
	end
    if skill.conditions[46].status == false then
        return true
    else
		local effect = tonumber( skill.conditions[46].id ) or 0;
		local time = tonumber( skill.conditions[46].time ) or 0;

		return CE_BEFORE_END_PLAYERBUFF( effect, time )

    end
end
-- Before Buff End Target
function CE_COND47(skill)
	if not skill.conditions or not skill.conditions[47] then
		return true
	end
    if skill.conditions[47].status == false then
        return true
    else
		local effect = tonumber( skill.conditions[47].id ) or 0;
		local time = tonumber( skill.conditions[47].time ) or 0;

		return CE_BEFORE_END_TARGETBUFF( effect, time )

    end
end
--IsMoving
function CE_COND48(skill)
	if not skill.conditions or not skill.conditions[48] then
		return true
	end
	if skill.conditions[48].status == false then
		return true
	else
		return CE_isMoving();
	end
end
--Target Name
function CE_COND49(skill)
	if not skill.conditions or not skill.conditions[49] then
		return true
	end
	if skill.conditions[49].status == false then
		return true
	else
		return skill.conditions[49].name == UnitName("target")
	end
end
--Target Is Player
function CE_COND50(skill)
	if not skill.conditions or not skill.conditions[50] then
		return true
	end
	if skill.conditions[50].status == false then
		return true
	else
		return UnitIsPlayer("target")
	end
end

--Target Is Not Player
function CE_COND51(skill)
	local unitNotPlayer = UnitIsPlayer("target") == nil
	if not skill.conditions or not skill.conditions[51] then
		return true
	end
	if skill.conditions[51].status == false then
		return true
	else
		return unitNotPlayer
	end
end

-- Player with the lowest health
function CE_COND52(skill)
	if not skill.conditions or not skill.conditions[52] then
		return true
	end
	if skill.conditions[52].status == false then
		return true
	end

	local lowestValue = 100;
	local numMembers = 0;

	if GetNumRaidMembers() == 0 then
		numMembers = GetNumPartyMembers()
	else
		numMembers = GetNumRaidMembers()
	end

	for i = 1, numMembers do
		local unit = "raid"..i;
		local percent = UnitHealth(unit) / UnitMaxHealth(unit) * 100
		if percent < lowestValue then
			lowestValue = percent
		end
	end

	local playerHP = UnitHealth("player") / UnitMaxHealth("player") * 100
	
	if numMembers > 0 then
		return lowestValue < 100
	else
		return playerHP < 100
	end

end
-- Target Me
-- Target by name
function CE_COND54(skill)
	if not skill.conditions or not skill.conditions[54] then
		return true
	end

	if skill.conditions[54].status == false then
		return true
	end
	
	local numMembers = 0;
	local requestName = skill.conditions[54].name or ""

	if GetNumRaidMembers() == 0 then
		numMembers = GetNumPartyMembers()
	else
		numMembers = GetNumRaidMembers()
	end

	if skill.type == "skill" then
		local indexA, indexB = skill.IndexA, skill.IndexB;
		local Skill_CD = CE_CD( true, indexA, indexB );
		if Skill_CD <= COMBATENGINE_GLOBAL_CD then
			for i = 1, numMembers do
				if UnitName("raid" .. i) == requestName then
					TargetUnit("raid" .. i);
					break;
				end
			end
		end
	end

	return TargetFrame.name:GetText() == requestName
end

-- Force Enemy Target
-- Return to friend target

function CE_GetMostAggroTarget()
	local mostAggroValue = 0
	local mostAggroName = nil
	local numMembers = 0;

	TargetHateListRequest()

	if GetNumRaidMembers() == 0 then
		numMembers = GetNumPartyMembers()
	else
		numMembers = GetNumRaidMembers()
	end

	for i = 1, numMembers do
		local name, hate = GetTargetHateList(i)
		if hate and hate > mostAggroValue then
			mostAggroValue = hate
			mostAggroName = name
		end
	end
	-- Si encontramos alguien con más hate
	if mostAggroName then
		for i = 1, numMembers do
			local unit = "raid"..i
			if UnitName(unit) == mostAggroName then
				return unit
			end
		end
	end
end

-- Target Tank

function CE_CUSTOM_SAVESKILL()
	local id = COMBAT_ENGINE_CUSTOM_FOCUSED.id
	local serial = COMBAT_ENG_SERIAL;
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial][id]
	for i = 1, CE_TOTAL_CONDITIONS do
		local parent = getglobal( "CombatEngine_ScrollFrameChild");
		local status = parent["Condition" .. i].CheckBox:IsChecked();
		skill.conditions[i] = {}
		skill.conditions[i] = CE_deepCopy(CE_TEMP_COND.conditions[i])
		local skillCondition = skill.conditions[i]
		skillCondition.status = status;
		if i >= 1 and i <= 10 or i == 27 then
			skillCondition.min = parent["Condition" .. i].Min:GetText();
			skillCondition.max = parent["Condition" .. i].Max:GetText();
		elseif i >= 11 and i <= 14 or i >= 32 and i <= 35 then
			skillCondition.id1 = parent["Condition" .. i].Fx1:GetText();
			skillCondition.id2 = parent["Condition" .. i].Fx2:GetText();
			skillCondition.id3 = parent["Condition" .. i].Fx3:GetText();
			skillCondition.id4 = parent["Condition" .. i].Fx4:GetText();
		elseif i == 15 or i == 16 or i == 36 or i == 37 then
			skillCondition.id = parent["Condition" .. i].Fx1:GetText();
			skillCondition.stack = parent["Condition" .. i].Stack:GetText();
			skillCondition.self = parent["Condition" .. i].Self:IsChecked();
			skillCondition.orMore = parent["Condition" .. i].orMore:IsChecked();
		elseif i == 17 or i == 38 or i == 46 or i == 47 then
			skillCondition.id = parent["Condition" .. i].Fx1:GetText();
			skillCondition.time = parent["Condition" .. i].Time:GetText();
		elseif i >= 18 and i <= 25 or i >= 28 and i <= 30 or i >= 39 and i <= 45 or i == 48 or i == 50 or i == 51 or i == 52 or i == 53 or i == 55 or i == 56 or i == 57 then
			skillCondition.enable = parent["Condition" .. i].CheckBox:IsChecked();
		elseif i == 26 then
			skillCondition.time = parent["Condition" .. i].Time:GetText();
		elseif i == 31 or i == 49 or i == 54 then
			skillCondition.name = parent["Condition" .. i].Fx1:GetText();
		end
	end	
end

function CE_CUSTOM_LOADSKILL( id )
	local parent = getglobal("CombatEngine_ScrollFrameChild")
	for i = 1, CE_TOTAL_CONDITIONS do
		local skillCondition = CE_TEMP_COND.conditions[i]
		if skillCondition then
			parent["Condition" .. i].CheckBox:SetChecked( skillCondition.status );
			if i >= 1 and i <= 10 or i == 27 then
				parent["Condition" .. i].CheckBox:SetChecked(skillCondition.status)
				parent["Condition" .. i].Min:SetText(skillCondition.min)
				parent["Condition" .. i].Max:SetText(skillCondition.max)
			elseif i >= 11 and i <= 14 or i >= 32 and i <= 35 then
				parent["Condition" .. i].Fx1:SetText(skillCondition.id1)
				parent["Condition" .. i].Fx2:SetText(skillCondition.id2)
				parent["Condition" .. i].Fx3:SetText(skillCondition.id3)
				parent["Condition" .. i].Fx4:SetText(skillCondition.id4)
			elseif i == 15 or i == 16 or i == 36 or i == 37 then
				parent["Condition" .. i].Fx1:SetText(skillCondition.id)
				parent["Condition" .. i].Stack:SetText(skillCondition.stack)
				parent["Condition" .. i].Self:SetChecked(skillCondition.self)
				parent["Condition" .. i].orMore:SetChecked(skillCondition.orMore)
			elseif i == 17 or i == 38 or i == 46 or i == 47 then
				parent["Condition" .. i].Fx1:SetText(skillCondition.id)
				parent["Condition" .. i].Time:SetText(skillCondition.time)
			elseif i >= 18 and i <= 25 or i >= 28 and i <= 30 or i >= 39 and i <= 45 or i == 48 or i == 50 or i == 51 or i == 52 or i == 53 or i == 55 or i == 56 or i == 57 then
				parent["Condition" .. i].CheckBox:SetChecked(skillCondition.enable)
			elseif i == 26 then
				parent["Condition" .. i].Time:SetText(skillCondition.time)
			elseif i == 31 or i == 49 or i == 54 then
				parent["Condition" .. i].Fx1:SetText(skillCondition.name)
			end
		end
	end
end

function CE_CUSTOM_CLEANSKILL_Conditions( id )
	local serial = COMBAT_ENG_SERIAL;
	local skill = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id] ~= nil and COMBAT_ENGINE_CUSTOM_PRESETS[serial][id]
	if not skill then return end
	local parent = getglobal("CombatEngine_ScrollFrameChild")

	--Clean active page
	if COMBAT_ENGINE_CUSTOM_FOCUSED.id == id then
		for i = 1, CE_TOTAL_CONDITIONS do
			parent["Condition" .. i].CheckBox:SetChecked( false );
			if i >= 1 and i <= 10 or i == 27 then
				parent["Condition" .. i].CheckBox:SetChecked( false );
				parent["Condition" .. i].Min:SetText( "" );
				parent["Condition" .. i].Max:SetText( "" );
			elseif i >= 11 and i <= 14 or i >= 32 and i <= 35 then
				parent["Condition" .. i].Fx1:SetText( "" );
				parent["Condition" .. i].Fx2:SetText( "" );
				parent["Condition" .. i].Fx3:SetText( "" );
				parent["Condition" .. i].Fx4:SetText( "" );
			elseif i == 15 or i == 16 or i == 36 or i == 37 then
				parent["Condition" .. i].Fx1:SetText( "" );
				parent["Condition" .. i].Stack:SetText( "" );
				parent["Condition" .. i].Self:SetChecked( false );
				parent["Condition" .. i].orMore:SetChecked( false );
			elseif i == 17 or i == 38 or i == 46 or i == 47 then
				parent["Condition" .. i].Fx1:SetText( "" );
				parent["Condition" .. i].Time:SetText( "" );
			elseif i >= 18 and i <= 25 or i >= 28 and i <= 30 or i >= 39 and i <= 45 or i == 48 or i == 50 or i == 51 or i == 52 or i == 53 or i == 55 or i == 56 or i == 57 then
				parent["Condition" .. i].CheckBox:SetChecked( false );
			elseif i == 26 then
				parent["Condition" .. i].Time:SetText( "" );
			elseif i == 31 or i == 49 or i == 54 then
				parent["Condition" .. i].Fx1:SetText( "" );
			end
		end
		COMBATENGINE_EDIT_LUA_CONDITIONS:Hide();
	end

	--erase in memory
	skill.enabled = true;
	for i = 1, CE_TOTAL_CONDITIONS do
		if skill and skill.conditions then
			local skillCondition = skill.conditions[i];
			if skill.conditions[i] then
				skillCondition.status = false;
				if i >= 1 and i <= 10 or i == 27 then
					skillCondition.min = 0;
					skillCondition.max = 0;
				elseif i >= 11 and i <= 14 or i >= 32 and i <= 35 then
					skillCondition.id1 = 0;
					skillCondition.id2 = 0;
					skillCondition.id3 = 0;
					skillCondition.id4 = 0;
				elseif i == 15 or i == 16 or i == 36 or i == 37 then
					skillCondition.id = 0;
					skillCondition.stack = 0;
					skillCondition.self = false;
					skillCondition.orMore = false;
				elseif i == 17 or i == 38 or i == 46 or i == 47 then
					skillCondition.id = 0;
					skillCondition.time = 0;
				elseif i >= 18 and i <= 25 or i >= 28 and i <= 30 or i >= 39 and i <= 45 or i == 48 or i == 50 or i == 51 or i == 52 or i == 53 or i == 55 or i == 56 or i == 57 then
					skillCondition.enable = false
				elseif i == 26 then
					skillCondition.time = 0;
				elseif i == 31 or i == 49 or i == 54 then
					skillCondition.name = "";
				end
			end
		end
	end	
	
	--Clean CD
	local sliderValue = COMBATENGINE_EDIT_LUASlider:GetValue();
	CooldownFrame_SetTime( getglobal( "COMBATENGINE_EDIT_LUA_Skill".. id - sliderValue .."Cooldown" ), 0, 0 );
	
end

function COMBATENGINE_EDIT_LUA_CONDITIONS_OnUpdate( this )
	local _, _, bowSpeed = GetPlayerAbility("BOW_ATTACKSPEED");
	local _, _, MainSpeed = GetPlayerAbility("MAIN_ATTACKSPEED");
	local _, _, OffSpeed = GetPlayerAbility("OFF_ATTACKSPEED");
	local base, bonus = GetPlayerAbility("MAGIC_CASTSPEED");
	local castSpeed = base + bonus;
	
	local bowFrameSpeed = CombatEngine_ScrollFrameChildCondition7Info
	local MainFraneSpeed = CombatEngine_ScrollFrameChildCondition7Info
	local OffFrameSpeed = CombatEngine_ScrollFrameChildCondition7Info
	local CastFrameSpeed = CombatEngine_ScrollFrameChildCondition7Info
	
	bowFrameSpeed:SetText( _G.CE_LANG.conditions.Current .. ": " .. "|cff00FF00" .. string.format("%.1f", bowSpeed) .. "%|r" );
	MainFraneSpeed:SetText( _G.CE_LANG.conditions.Current .. ": " .. "|cff00FF00" .. string.format("%.1f", MainSpeed) .. "%|r" );
	OffFrameSpeed:SetText( _G.CE_LANG.conditions.Current .. ": " .. "|cff00FF00" .. string.format("%.1f", OffSpeed) .. "%|r" );
	CastFrameSpeed:SetText( _G.CE_LANG.conditions.Current .. ": " .. "|cff00FF00" .. string.format("%.1f", castSpeed) .. "%|r" );
end

function CE_ConfigSkill_UpButton_OnClick(this)
	local id = this:GetParent():GetID();
	local serial = COMBAT_ENG_SERIAL;
	local presets = COMBAT_ENGINE_CUSTOM_PRESETS[serial];
    if id > 1 then
		presets[id], presets[id - 1] = presets[id - 1], presets[id];
	end
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end

function CE_ConfigSkill_DownButton_OnClick(this)
	local id = this:GetParent():GetID();
	local serial = COMBAT_ENG_SERIAL;
	local presets = COMBAT_ENGINE_CUSTOM_PRESETS[serial];
    if id < COMBAT_ENG_MAXSKILLS then
		presets[id], presets[id + 1] = presets[id + 1], presets[id];
	end
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end

function CE_ConfigSkill_UpdateCD()

	if not COMBATENGINE_EDIT_LUA:IsVisible() then return end

	local serial = COMBAT_ENG_SERIAL;
	local sliderValue = COMBATENGINE_EDIT_LUASlider:GetValue();
	for i = 1, 10 do
		local frame = getglobal( "COMBATENGINE_EDIT_LUA_Skill" .. i );
		local SKILL = COMBAT_ENGINE_CUSTOM_PRESETS[serial] and  COMBAT_ENGINE_CUSTOM_PRESETS[serial][frame:GetID()];
		if SKILL then
			if SKILL.type == "skill" and SKILL.IndexA and SKILL.IndexB then
				local time, remaining = GetSkillCooldown( SKILL.IndexA, SKILL.IndexB );
				CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), time, remaining );
			elseif SKILL.type == "skillplate" then
				if SKILL.IndexA  then
					local name, icon, time, remaining, id = SkillPlateUpdate( SKILL.IndexA );
					if SKILL.IndexA and name and time and remaining then
						CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), time, remaining );
					else
						CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), 0, 0 );
					end
				else
					CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), 0, 0 );
				end
			elseif SKILL.type == "item" then
				local time, remaining = GetBagItemCooldown( SKILL.IndexA );
				CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), time, remaining );
			elseif SKILL.type == "equip" then
				local time, remaining = GetEquipItemCooldown( SKILL.IndexA );
				CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), time, remaining );
			elseif SKILL.type == "macro" then
				CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), 0, 0 );
			else
				CooldownFrame_SetTime( getglobal(frame:GetName().."Cooldown"), 0, 0 );
			end
		end
	end

end