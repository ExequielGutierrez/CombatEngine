
--Lua KNIGHT/WARLOCK BY NEORAXER 07-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_KNIGHT_WARDEN()

--DEFAULT_CHAT_FRAME:AddMessage("Usando Caba/brujo")


    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	local pm = UnitMana("player")
	local MaxPm = UnitMaxMana("player")
	
	-----SKILLS----
	--Sello sagrado
	local SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2 = Match_CE(490149);
	local SELL_SAG_CD = CE_CD(SELL_SAG_SKILL, SELL_SAG_ID_1, SELL_SAG_ID_2);	
	--Corte cargado
	local COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2 = Match_CE(1490823);
	local COR_CAR_CD = CE_CD(COR_CAR_SKILL, COR_CAR_ID_1, COR_CAR_ID_2);	
	--Aplastamiento frenético
	local APL_FRE_SKILL, APL_FRE_ID_1, APL_FRE_ID_2 = Match_CE(1490494);
	local APL_FRE_CD = CE_CD(APL_FRE_SKILL, APL_FRE_ID_1, APL_FRE_ID_2);	
	--Castigo    
	local CAST_SKILL, CAST_ID_1, CAST_ID_2 = Match_CE(490151);
	local CAST_CD = CE_CD(CAST_SKILL, CAST_ID_1, CAST_ID_2);
	--Golpe divino
	local GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2 = Match_CE(490148);
	local GOL_DIV_CD = CE_CD(GOL_DIV_SKILL, GOL_DIV_ID_1, GOL_DIV_ID_2);		
	
	---FAST BUFFS---
	--Poder feroz
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);
	
	----BUFFS---
	--Amenaza 
	local AME_SKILL, AME_ID_1, AME_ID_2 = Match_CE(490153);


	
	--Amenaza 
    if AME_SKILL and (CE_BuffIdPlayer(500246) == false) then
        UseSkill(AME_ID_1, AME_ID_2) 
    end

	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar costilla de primera
		if (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end


	if _G.C_EngineSettings.FastBuffs then
		if POD_FER_SKILL and POD_FER_CD <= 0.25 then
			UseSkill(POD_FER_ID_1, POD_FER_ID_2);
		end
	
	end


	--Huellas de la espada cruzada
	if pm >= MaxPm/10 and CE_ISS_CD(CE_toName(490241)) and _G.C_EngineSettings.AOE then
		CastSpellByName(CE_toName(490241));
	end
	--ROTACION--
	--Sello sagrado
	if SELL_SAG_SKILL and SELL_SAG_CD <= 0.25 and pm > 600 then
		UseSkill(SELL_SAG_ID_1, SELL_SAG_ID_2);
	--Aplastamiento frenético
	elseif APL_FRE_SKILL and APL_FRE_CD <= 0.25 and pm > 800 and (CE_DebuffIdTarget(500169) or CE_DebuffIdTarget(500140) or CE_DebuffIdTarget(5001460) or CE_DebuffIdTarget(500168)) then
		UseSkill(APL_FRE_ID_1, APL_FRE_ID_2);
	--Castigo    
	elseif CAST_SKILL and CAST_CD <= 0.25 and pm > 350 and (CE_DebuffIdTarget(500169) or CE_DebuffIdTarget(500140) or CE_DebuffIdTarget(5001460) or CE_DebuffIdTarget(500168)) then
		UseSkill(CAST_ID_1, CAST_ID_2);
	--Corte cargado
	elseif COR_CAR_SKILL and COR_CAR_CD <= 0.25 and pm > 340 then
		UseSkill(COR_CAR_ID_1, COR_CAR_ID_2);
	--Golpe divino
	elseif GOL_DIV_SKILL and GOL_DIV_CD <= 0.25 and pm > 800 then
		UseSkill(GOL_DIV_ID_1, GOL_DIV_ID_2);
	end 

	
end 


function CE_KNIGHT_WARDEN_IMPORT()
	local Skills = {
		1244060, 200173, 1244062, 490153, 493406, 490241, 490149,
		1490494, 1490494, 1490494, 1490494, 490151, 490151, 490151, 490151, 1490823, 490148,
	}
	local conditions = {
		{ -- 1 Costilla de primera 1244060
			[12] = { id1="1500235", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 2 Estimulante fuerte 200173
			[12] = { id1="1500237", id2="0", id3="0", id4="0", status=true },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 3 Agilidad elfica 1244062
			[12] = { id1="1500237", id2="0", id3="0", id4="0", status=true },
			[17] = { id="501321", status=true, time="0" },
			[29] = { enable=true, status=true },
			[40] = { enable=true, status=true },
		},
		{ -- 4 Amenaza 490153
			[12] = { id1="500246", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 5 Poder feroz 493406
			[41] = { enable=true, status=true },
		},
		{ -- 6 Huellas de la espada cruzada 490241
			[2] = { min="10", max="100", status=true },
			[39] = { enable=true, status=true },
		},
		{ -- 7 Sello sagrado 490149
			[2] = { min="60", max="100", status=true },
		},
		{ -- 8 Aplastamiento frenetico 1490494
			[2] = { min="80", max="100", status=true },
			[32] = { id1="500169", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 9 Aplastamiento frenetico 1490494
			[2] = { min="80", max="100", status=true },
			[32] = { id1="500140", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 10 Aplastamiento frenetico 1490494
			[2] = { min="80", max="100", status=true },
			[32] = { id1="5001460", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 11 Aplastamiento frenetico 1490494
			[2] = { min="80", max="100", status=true },
			[32] = { id1="500168", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 12 Castigo 490151
			[2] = { min="35", max="100", status=true },
			[32] = { id1="500169", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 13 Castigo 490151
			[2] = { min="35", max="100", status=true },
			[32] = { id1="500140", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 14 Castigo 490151
			[2] = { min="35", max="100", status=true },
			[32] = { id1="5001460", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 15 Castigo 490151
			[2] = { min="35", max="100", status=true },
			[32] = { id1="500168", id2="0", id3="0", id4="0", status=true },
		},
		{ -- 16 Corte cargado 1490823
			[2] = { min="34", max="100", status=true },
		},
		{ -- 17 Golpe divino 490148
			[2] = { min="80", max="100", status=true },
		},
	}
	local iss = {
		[490241] = true,
	}
	local consumables = {
		[1244060] = true,
		[200173] = true,
		[1244062] = true,
	}
	return CE_Import_MakeExport(Skills, iss, consumables, conditions)
end
