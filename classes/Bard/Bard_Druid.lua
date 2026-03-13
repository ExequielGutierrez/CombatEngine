
--Lua BARD/DRUID BY NEORAXER 08-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_DRUID()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local mana = UnitSkill("player")
	local MaxPm = UnitMaxSkill("player")
	
	--Bendici�n salvaje
	local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);	
	--Plegaria de concentraci�n
	local PLE_CON_SKILL, PLE_CON_ID_1, PLE_CON_ID_2 = Match_CE(493530);	
	--Tormenta de rocas
	local TOR_ROC_SKILL, TOR_ROC_ID_1, TOR_ROC_ID_2 = Match_CE(1491186);	
	local TOR_ROC_CD = CE_CD(TOR_ROC_SKILL, TOR_ROC_ID_1, TOR_ROC_ID_2);
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491388);	
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2);
	--Latido de la tierra
	local LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2 = Match_CE(493540);	
	local LAT_TIE_CD = CE_CD(LAT_TIE_SKILL, LAT_TIE_ID_1, LAT_TIE_ID_2);
	--Invoncaci�n de rocas
	local INV_ROC_SKILL, INV_ROC_ID_1, INV_ROC_ID_2 = Match_CE(1491183);	
	local INV_ROC_CD = CE_CD(INV_ROC_SKILL, INV_ROC_ID_1, INV_ROC_ID_2);
	--Disparo r�pido de piedras
	local DIS_RAP_SKILL, DIS_RAP_ID_1, DIS_RAP_ID_2 = Match_CE(1491184);	
	local DIS_RAP_CD = CE_CD(DIS_RAP_SKILL, DIS_RAP_ID_1, DIS_RAP_ID_2);
	--Delirio ritmico
	local DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2 = Match_CE(1491387);	
	local DEL_RIT_CD = CE_CD(DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Armon�a
	local ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2 = Match_CE(1491389);	
	local ARMONIA_CD = CE_CD(ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2);
	--Salpicadura Terrosa
	local SAL_TERR_SKILL, SAL_TERR_ID_1, SAL_TERR_ID_2 = Match_CE(1491182);	
	local SAL_TERR_CD = CE_CD(SAL_TERR_SKILL, SAL_TERR_ID_1, SAL_TERR_ID_2);

	if(_G.C_EngineSettings.FastBuffs) then		
		--Amuleto de la suerte
		if CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			CastSpellByName(CE_toName(1491345));
		end
	end
	
	--Bendici�n salvaje
	if BEN_SAL_SKILL and CE_BuffIdPlayer(620454) == false and not UnitInParty( "player" ) then
		UseSkill(BEN_SAL_ID_1, BEN_SAL_ID_2);
	--Plegaria de concentraci�n
	elseif PLE_CON_SKILL and CE_BuffIdPlayer(503799) == false and not UnitInParty( "player" ) then
		UseSkill(PLE_CON_ID_1, PLE_CON_ID_2);
	end
	
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del esp�ritu �lfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los esp�ritus de anta�o
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar Phirius tipo E
		elseif mana < 10000 and CE_UseItem(203503) then		
		end
		CE_HEALING_ITEM()
	end
	
	
	--ROTACION--

	--Tormenta de rocas
	if TOR_ROC_SKILL and TOR_ROC_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(TOR_ROC_ID_1, TOR_ROC_ID_2);
	--Cambio de octava
	elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 and _G.C_EngineSettings.AOE then
		UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
	--Latido de la tierra
	elseif LAT_TIE_SKILL and LAT_TIE_CD <= 0.25 and mana >= 700 and _G.C_EngineSettings.AOE then
		UseSkill(LAT_TIE_ID_1, LAT_TIE_ID_2);
	--Invoncaci�n de rocas
	elseif INV_ROC_SKILL and INV_ROC_CD <= 0.25 and mana >= MaxPm/20 and _G.C_EngineSettings.AOE then
		UseSkill(INV_ROC_ID_1, INV_ROC_ID_2);
	--Disparo r�pido de piedras
	elseif DIS_RAP_SKILL and DIS_RAP_CD <= 0.25 and _G.C_EngineSettings.AOE then
		UseSkill(DIS_RAP_ID_1, DIS_RAP_ID_2);
	--Delirio ritmico
	elseif DEL_RIT_SKILL and DEL_RIT_CD <= 0.25 and foco >= 25 then
		UseSkill(DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Armon�a
	elseif ARMONIA_SKILL and ARMONIA_CD <= 0.25 and CE_isMoving() == false then
		UseSkill(ARMONIA_ID_1, ARMONIA_ID_2);
	--Salpicadura Terrosa
	elseif SAL_TERR_SKILL and SAL_TERR_CD <= 0.25 and mana >= MaxPm/100 then
		UseSkill(SAL_TERR_ID_1, SAL_TERR_ID_2);
	end


end


