
--Lua WARLOCK/rogue BY NEORAXER 08-03-2024 -> Rotaci�n base kitty Solara
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

local juicio = true
local flag_juicio = "flag"


--Temporizador en cero
local function FLAG_JUICIO_FUNCTION()
	--DEFAULT_CHAT_FRAME:AddMessage("Slide_1");
	TimerQueue[flag_juicio] = nil
	juicio = true
end

function CE_WARLOCK_ROGUE()

--DEFAULT_CHAT_FRAME:AddMessage("Usando BRUJO/PICA")

	local foco = UnitMana("player");
	local energia = UnitSkill("player");
	local psi = GetSoulPoint();

	--Oleada de conciencia
	local OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2 = Match_CE(498555);
	local OLE_CON_CD = CE_CD(OLE_CON_SKILL, OLE_CON_ID_1, OLE_CON_ID_2);
	--Golpe de recolecci�n de coraz�n
	local GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2 = Match_CE(498545);
	local GOL_REC_CD = CE_CD(GOL_REC_SKILL, GOL_REC_ID_1, GOL_REC_ID_2);
	--Espada de fuerza de voluntad
	local ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2 = Match_CE(497955);
	local ESP_FUE_CD = CE_CD(ESP_FUE_SKILL, ESP_FUE_ID_1, ESP_FUE_ID_2);
	--Movimiento fugaz
	local MOV_FUG_SKILL, MOV_FUG_ID_1, MOV_FUG_ID_2 = Match_CE(499666);
	local MOV_FUG_CD = CE_CD(MOV_FUG_SKILL, MOV_FUG_ID_1, MOV_FUG_ID_2);
	--Carga combada
	local CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2 = Match_CE(497958);
	local CARG_COMB_CD = CE_CD(CARG_COMB_SKILL, CARG_COMB_ID_1, CARG_COMB_ID_2);
	--Rugido de la bestia
	local RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2 = Match_CE(498547);
	local RUG_BES_CD = CE_CD(RUG_BES_SKILL, RUG_BES_ID_1, RUG_BES_ID_2);
	--Maldici�n del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(497959);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Crime
	local CRI_SKILL, CRI_ID_1, CRI_ID_2 = Match_CE(498695);
	local CRI_CD = CE_CD(CRI_SKILL, CRI_ID_1, CRI_ID_2);
	--Juicio Implacable
	local JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2 = Match_CE(498544);
	local JUI_IMP_CD = CE_CD(JUI_IMP_SKILL, JUI_IMP_ID_1, JUI_IMP_ID_2);
	--Castigo
	local CAS_SKILL, CAS_ID_1, CAS_ID_2 = Match_CE(498700);
	local CAS_CD = CE_CD(CAS_SKILL, CAS_ID_1, CAS_ID_2);
	--Fin de pensamiento
	local FIN_PEN_SKILL, FIN_PEN_ID_1, FIN_PEN_ID_2 = Match_CE(498699);
	local FIN_PEN_CD = CE_CD(FIN_PEN_SKILL, FIN_PEN_ID_1, FIN_PEN_ID_2);
	--Cuchillada avelosa
	local CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2 = Match_CE(499865);
	local CUC_ALE_CD = CE_CD(CUC_ALE_SKILL, CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Arrojar
	local ARR_SKILL, ARR_ID_1, ARR_ID_2 = Match_CE(499867);
	local ARR_CD = CE_CD(ARR_SKILL, ARR_ID_1, ARR_ID_2);
	--Adquisici�n del conocimiento
	local ADQ_CON_SKILL, ADQ_CON_ID_1, ADQ_CON_ID_2 = Match_CE(498552);
	--The Hex
	local THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2 = Match_CE(1492465);
	local THE_HEX_CD = CE_CD(THE_HEX_SKILL, THE_HEX_ID_1, THE_HEX_ID_2);
	--Colmillo del alma
	local COL_ALM_SKILL, COL_ALM_ID_1, COL_ALM_ID_2 = Match_CE(498670);
	local COL_ALM_CD = CE_CD(COL_ALM_SKILL, COL_ALM_ID_1, COL_ALM_ID_2);
	
    ----------------COMIDAS------------------
	if C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if (energia <= 20 or foco <= 20 or psi <= 2 ) and CE_UseItem(1244064) and (CE_BuffIdPlayer(1500239) == false) then	
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del esp�ritu �lfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los esp�ritus de anta�o
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		end
	CE_HEALING_ITEM()
	end
	
	
	
--ROTACI�N--


	--Adquisici�n del conocimiento
	if ADQ_CON_SKILL and (CE_BuffIdPlayer(621277) == false) then
		UseSkill(ADQ_CON_ID_1, ADQ_CON_ID_2);
	--The Hex
	elseif _G.C_EngineSettings.FastBuffs and THE_HEX_CD <= 0.25 then
		UseSkill(THE_HEX_ID_1, THE_HEX_ID_2);	
	--Usar poci�n del enano
    elseif (energia <= 40 or foco <= 20) and CE_UseItem(1244064) then
	--Poder mental de la hormiga reina
	elseif CE_ISS_CD(CE_toName(490339)) and psi <= 2 then 
		CastSpellByName(CE_toName(490339));
	--Curso del tormento del alma
	elseif CE_ISS_CD(CE_toName(490342)) then 
		CastSpellByName(CE_toName(490342));
	--Oleada de conciencia
	elseif OLE_CON_SKILL and OLE_CON_CD <= 0.45 and CE_isMoving() == false and foco >= 25 then
		UseSkill(OLE_CON_ID_1, OLE_CON_ID_2);
	--Golpe de recolecci�n de coraz�n
	elseif GOL_REC_SKILL and GOL_REC_CD <= 0.45 then
		UseSkill(GOL_REC_ID_1, GOL_REC_ID_2);
	--Espada de fuerza de voluntad
	elseif ESP_FUE_SKILL and ESP_FUE_CD <= 0.45 and (CE_BuffIdPlayer(501571) == false) and psi >= 6 then
		UseSkill(ESP_FUE_ID_1, ESP_FUE_ID_2);	
	--Movimiento Fugaz
	elseif MOV_FUG_SKILL and MOV_FUG_CD <= 0.45 and (CE_BuffIdPlayer(621406) == false) and energia >= 20 then
		UseSkill(MOV_FUG_ID_1, MOV_FUG_ID_2);	
	--Carga combada
	elseif CARG_COMB_SKILL and (CARG_COMB_CD <= 0.45) and (CE_BuffIdPlayer(501575) == false) then
		UseSkill(CARG_COMB_ID_1, CARG_COMB_ID_2);
	--Colmillo debuff
	elseif COL_ALM_CD <= 0.25 and (CE_DebuffIdTarget(621399) == false) and energia >= 25 then
		UseSkill(COL_ALM_ID_1, COL_ALM_ID_2);
	--Castigo PONER 10% DAMAGE
	elseif CAS_CD <= 0.25 and psi >= 3 and CE_BuffIdPlayer(501571) and CE_DebuffIdTarget(621654) and (CE_BuffIdPlayer(1501637) == false )then
		UseSkill(CAS_ID_1, CAS_ID_2);
	--Rugido de la bestia
	elseif RUG_BES_SKILL and RUG_BES_CD <= 0.45 and foco >= 30 and C_EngineSettings.AOE then
		UseSkill(RUG_BES_ID_1, RUG_BES_ID_2);
	--Maldici�n del tejido debilitante
	elseif MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.45 and foco >= 20 and  (CE_DebuffIdTarget(501577) == false) and (CE_isMoving() == false) and C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
    -- Grieta espacial
	elseif foco >= 25 and CE_ISS_CD(CE_toName(490444)) and (CE_isMoving() == false) and _G.C_EngineSettings.AOE then 
		CastSpellByName(CE_toName(490444));	
	--Oleada de malicia
	elseif OLE_MAL_SKILL and OLE_MAL_CD <= 0.45 and CE_TARGET_IS_BOSS() and foco >= 20 and C_EngineSettings.AOE then
		UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);	
	--Crime
	elseif CRI_SKILL and CRI_CD <= 0.45 and energia >= 20 and (CE_DebuffIdTarget(621654) == false) then
		UseSkill(CRI_ID_1, CRI_ID_2);		
	--Juicio Implacable
	elseif CE_AFE(621199, 11) then
		if (CE_READ_BUFF_FAST(621199) == false) and JUI_IMP_SKILL and JUI_IMP_CD <= 0.45 and psi >= 1 and CE_isMoving() == false and CE_BuffIdPlayer(501571) and juicio and not TimerQueue[flag_juicio] then
			UseSkill(JUI_IMP_ID_1, JUI_IMP_ID_2);	
			TimerQueue[flag_juicio] = { GetTime() + 2.5, FLAG_JUICIO_FUNCTION }
			juicio = false
		end
	--Castigo
	elseif CAS_SKILL and CAS_CD <= 0.45 and CE_BuffIdPlayer(501571) and psi >= 2 then
		UseSkill(CAS_ID_1, CAS_ID_2);
	--Crime
	elseif CRI_SKILL and CRI_CD <= 0.45 and energia >= 20 then
		UseSkill(CRI_ID_1, CRI_ID_2);		
	--Fin de pensamiento
	elseif FIN_PEN_SKILL and FIN_PEN_CD <= 0.45 and foco >= 20 and CE_BuffIdPlayer(501571) then
		UseSkill(FIN_PEN_ID_1, FIN_PEN_ID_2);
	--Cuchillada alevosa
	elseif CUC_ALE_SKILL and CUC_ALE_CD <= 0.45 and energia >= 20 then
		UseSkill(CUC_ALE_ID_1, CUC_ALE_ID_2);
	--Colmillo Attack
	elseif COL_ALM_SKILL and (COL_ALM_CD <= 0.45) and energia >= 25 then
		UseSkill(COL_ALM_ID_1, COL_ALM_ID_2);
	--Arrojar
	elseif ARR_SKILL and ARR_CD <= 0.45 then
		UseSkill(ARR_ID_1, ARR_ID_2);
			
	end


end 

