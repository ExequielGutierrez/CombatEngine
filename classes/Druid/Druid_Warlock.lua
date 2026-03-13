
--Lua ROUGE/WARLOCK BY NEORAXER 04-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com


function CE_DRUID_WARLOCK()

    local pm = UnitMana("player")
    local MaxPm = UnitMaxMana("player")
    local foco = UnitSkill("player")
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")

	--Vitalizaci�n de la mente
	local VIT_COR_SKILL, VIT_COR_ID_1, VIT_COR_ID_2 = Match_CE(1490765);
	local VIT_COR_CD = CE_CD(VIT_COR_SKILL, VIT_COR_ID_1, VIT_COR_ID_2);
	--Foco de la madre tierra
	local FOC_MAD_SKILL, FOC_MAD_ID_1, FOC_MAD_ID_2 = Match_CE(493548);
	local FOC_MAD_CD = CE_CD(FOC_MAD_SKILL, FOC_MAD_ID_1, FOC_MAD_ID_2);
	--Semilla curativa
	local SEM_CUR_SKILL, SEM_CUR_ID_1, SEM_CUR_ID_2 = Match_CE(493547);
	local SEM_CUR_CD = CE_CD(SEM_CUR_SKILL, SEM_CUR_ID_1, SEM_CUR_ID_2);
	--Protecci�n de la madre tierra
	local PRO_MAD_SKILL, PRO_MAD_ID_1, PRO_MAD_ID_2 = Match_CE(493558);
	local PRO_MAD_CD = CE_CD(PRO_MAD_SKILL, PRO_MAD_ID_1, PRO_MAD_ID_2);
    --Recuperaci�n
	local RECUP_SKILL, RECUP_ID_1, RECUP_ID_2 = Match_CE(493528);
	local RECUP_CD = CE_CD(RECUP_SKILL, RECUP_ID_1, RECUP_ID_2);
    --Restaurar vida
	local RES_VID_SKILL, RES_VID_ID_1, RES_VID_ID_2 = Match_CE(493526);
	local RES_VID_CD = CE_CD(RES_VID_SKILL, RES_VID_ID_1, RES_VID_ID_2);
    --Fuente de la madre tierra
	local FUE_MAD_SKILL, FUE_MAD_ID_1, FUE_MAD_ID_2 = Match_CE(493529);
	local FUE_MAD_CD = CE_CD(FUE_MAD_SKILL, FUE_MAD_ID_1, FUE_MAD_ID_2);
	--Desprecio de saces
	local DES_SAC_SKILL, DES_SAC_ID_1, DES_SAC_ID_2 = Match_CE(498541);
	local DES_SAC_CD = CE_CD(DES_SAC_SKILL, DES_SAC_ID_1, DES_SAC_ID_2);
	--Carga combada
	local CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2 = Match_CE(1490759);
	local CAR_COM_CD = CE_CD(CAR_COM_SKILL, CAR_COM_ID_1, CAR_COM_ID_2);
	--Semilla debilitante
	local SEM_DEB_SKILL, SEM_DEB_ID_1, SEM_DEB_ID_2 = Match_CE(493546);
	local SEM_DEB_CD = CE_CD(SEM_DEB_SKILL, SEM_DEB_ID_1, SEM_DEB_ID_2);
	--latido de tierra
	local LAD_TIE_SKILL, LAD_TIE_ID_1, LAD_TIE_ID_2 = Match_CE(1490764);
	local LAD_TIE_CD = CE_CD(LAD_TIE_SKILL, LAD_TIE_ID_1, LAD_TIE_ID_2);
	--Veneno de la naturaleza
	local VEN_NAT_SKILL, VEN_NAT_ID_1, VEN_NAT_ID_2 = Match_CE(1490623);
	local VEN_NAT_CD = CE_CD(VEN_NAT_SKILL, VEN_NAT_ID_1, VEN_NAT_ID_2);
	--Flecha toxica
	local FLE_TOX_SKILL, FLE_TOX_ID_1, FLE_TOX_ID_2 = Match_CE(1490621);
	local FLE_TOX_CD = CE_CD(FLE_TOX_SKILL, FLE_TOX_ID_1, FLE_TOX_ID_2);
	--Tormenta de arena
	local TOR_ARE_SKILL, TOR_ARE_ID_1, TOR_ARE_ID_2 = Match_CE(1490763);
	local TOR_ARE_CD = CE_CD(TOR_ARE_SKILL, TOR_ARE_ID_1, TOR_ARE_ID_2);
	--Oleada de malicia
	local OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2 = Match_CE(497966);
	local OLE_MAL_CD = CE_CD(OLE_MAL_SKILL, OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Maldicion del tejido debilitante
	local MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2 = Match_CE(1490761);
	local MAL_TEJ_CD = CE_CD(MAL_TEJ_SKILL, MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Flecha de tierra
	local FLE_TIE_SKILL, FLE_TIE_ID_1, FLE_TIE_ID_2 = Match_CE(1490762);
	local FLE_TIE_CD = CE_CD(FLE_TIE_SKILL, FLE_TIE_ID_1, FLE_TIE_ID_2);
	--Flecha psiquica
	local FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2 = Match_CE(1490760);
	local FLE_PSI_CD = CE_CD(FLE_PSI_SKILL, FLE_PSI_ID_1, FLE_PSI_ID_2);
	--Posesi�n t�xica
	local POS_TOX_SKILL, POS_TOX_ID_1, POS_TOX_ID_2 = Match_CE(1490628);
	--Plegaria de concentraci�n
	local PLE_CON_SKILL, PLE_CON_ID_1, PLE_CON_ID_2 = Match_CE(493530);
	--Bendici�n salvaje
	local BEN_SAL_SKILL, BEN_SAL_ID_1, BEN_SAL_ID_2 = Match_CE(493531);
	--Concentrado de la naturaleza
	local CON_NAT_SKILL, CON_NAT_ID_1, CON_NAT_ID_2 = Match_CE(1490626);
	
	
	
	
	
	--HEALING SKILLS--
	--Protecci�n de la madre tierra
	if PRO_MAD_SKILL and PRO_MAD_CD <= 0.25 and hp <= (MaxHp * 40 / 100) then 
        UseSkill(PRO_MAD_ID_1, PRO_MAD_ID_2);
	--Recuperaci�n
    elseif RECUP_SKILL and hp <= (MaxHp * 60 / 100) and (CE_BuffIdPlayer(503797) == false) and (is_Moving == false) and pm >= (MaxPm * 3 / 100) then
        UseSkill(RECUP_ID_1, RECUP_ID_2);
	--Restaurar vida
    elseif RES_VID_SKILL and hp <= (MaxHp * 50 / 100) and (CE_isMoving()  == false) and pm >= (MaxPm * 3 / 100) and IsShiftKeyDown() == false then
        UseSkill(RES_VID_ID_1, RES_VID_ID_2); 
	--Fuente de la madre tierra
    elseif FUE_MAD_SKILL and FUE_MAD_CD <= 0.25 and hp <= (MaxHp * 80 / 100) then
        UseSkill(FUE_MAD_ID_1, FUE_MAD_ID_2);
    end



	--BUFFS--
	
	--Poseci�n t�xica
    if POS_TOX_SKILL and (CE_BuffIdPlayer(1501091) == false) then
        UseSkill(POS_TOX_ID_1, POS_TOX_ID_2);
	--Plegaria de concentracion
    elseif PLE_CON_SKILL and (CE_BuffIdPlayer(503799) == false) and not UnitInParty( "player" ) then
        UseSkill(PLE_CON_ID_1, PLE_CON_ID_2);
	--Bendicion Salvaje
    elseif BEN_SAL_SKILL and (CE_BuffIdPlayer(620454) == false) and not UnitInParty( "player" ) then
        UseSkill(BEN_SAL_ID_1, BEN_SAL_ID_2);
	--Semilla curativa
    --elseif SEM_CUR_SKILL and SEM_CUR_CD <= 0.45 and (CE_BuffIdPlayer(503816) == false) then
        --UseSkill(SEM_CUR_ID_1, SEM_CUR_ID_2); 
	--Foco de la madre tierra
    elseif (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) and FOC_MAD_SKILL and FOC_MAD_CD <= 0.25 then
        UseSkill(FOC_MAD_ID_1, FOC_MAD_ID_2); 
	--Vitalizacion de la mente
    elseif (CE_TARGET_IS_BOSS() or C_EngineSettings.FastBuffs) and VIT_COR_SKILL and VIT_COR_CD <= 0.25 then
        UseSkill(VIT_COR_ID_1, VIT_COR_ID_2); 
    end

	
	
	
	
	
	
	
	   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/100 * 10 and CE_UseItem(203503) then
		--Usar frasco del esp�ritu �lfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los esp�ritus de anta�o
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		end
		CE_HEALING_ITEM()
	end



	--Puntos de la naturaleza--
	if CON_NAT_SKILL and foco >= 50 and (CE_BuffIdPlayer(503827) == false) then
		UseSkill(CON_NAT_ID_1, CON_NAT_ID_2);
	end


	--ROTACION--

	--Desprecio de saces
    if (CE_isMoving()  == false) and CE_TARGET_IS_BOSS() and DES_SAC_SKILL and DES_SAC_CD <= 0.25 and foco >= 30 then
		UseSkill(DES_SAC_ID_1, DES_SAC_ID_2); 
	--Carga combada
    elseif CAR_COM_SKILL and CAR_COM_CD <= 0.25 and foco >= 20 then
        UseSkill(CAR_COM_ID_1, CAR_COM_ID_2);
	--Semilla debilitante
    elseif SEM_DEB_SKILL and SEM_DEB_CD <= 0.25 and (CE_DebuffIdTarget(503815) == false) then
        UseSkill(SEM_DEB_ID_1, SEM_DEB_ID_2); 
	--latido de tierra
    elseif LAD_TIE_SKILL and LAD_TIE_CD <= 0.45 and pm >= (MaxPm * 3 / 100) and _G.C_EngineSettings.AOE then
        UseSkill(LAD_TIE_ID_1, LAD_TIE_ID_2);
	--Veneno de la naturaleza
	elseif (CE_isMoving()  == false) and VEN_NAT_SKILL and VEN_NAT_CD <= 0.25 and CE_DEBUFF_STACK(1501079, 2) then
		UseSkill(VEN_NAT_ID_1, VEN_NAT_ID_2);
		
	elseif CE_TARGET_IS_BOSS() then
		--Maldicion del tejido debilitante
		if (CE_DebuffIdTarget(501577) == false) and (CE_isMoving()  == false) and MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and foco >= 20 and _G.C_EngineSettings.AOE then
			UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
		--Flecha toxica
		elseif FLE_TOX_SKILL and FLE_TOX_CD <= 0.25 and pm >= (MaxPm * 3 / 100) and (CE_isMoving()  == false) and CE_BuffIdPlayer(503827) and (CE_DEBUFF_STACK(1501079, 2) == false) then
			UseSkill(FLE_TOX_ID_1, FLE_TOX_ID_2);
		end 
	end
	
	
	--Oleada de malicia
	if OLE_MAL_SKILL and OLE_MAL_CD <= 0.25 and foco >= 20 and _G.C_EngineSettings.AOE then
			UseSkill(OLE_MAL_ID_1, OLE_MAL_ID_2);
	--Maldicion del tejido debilitante
    elseif (CE_TARGET_IS_BOSS() == false) and (CE_DebuffIdTarget(501577) == false) and (CE_isMoving()  == false) and MAL_TEJ_SKILL and MAL_TEJ_CD <= 0.25 and foco >= 20 and _G.C_EngineSettings.AOE then
		UseSkill(MAL_TEJ_ID_1, MAL_TEJ_ID_2);
	--Tormenta de arena
    elseif (CE_TARGET_IS_BOSS() == false) and TOR_ARE_SKILL and TOR_ARE_CD <= 0.25 and (CE_isMoving()  == false) and _G.C_EngineSettings.AOE then
		SpellTargetUnit("mouseover")    
		UseSkill(TOR_ARE_ID_1, TOR_ARE_ID_2)
	--Flecha toxica
	elseif (CE_TARGET_IS_BOSS() == false) and (CE_isMoving()  == false) and FLE_TOX_SKILL and FLE_TOX_CD <= 0.25 and pm >= (MaxPm * 3 / 100) and (CE_isMoving()  == false) and CE_BuffIdPlayer(503827) and (CE_DEBUFF_STACK(1501079, 2) == false) then
        UseSkill(FLE_TOX_ID_1, FLE_TOX_ID_2);
	--Flecha de tierra
    elseif FLE_TIE_SKILL and FLE_TIE_CD <= 0.25 and (CE_isMoving()  == false) then
        UseSkill(FLE_TIE_ID_1, FLE_TIE_ID_2)
	--Flecha psiquica
    elseif FLE_PSI_SKILL and FLE_PSI_CD <= 0.25 and foco >= 15 and (CE_isMoving()  == false) then
        UseSkill(FLE_PSI_ID_1, FLE_PSI_ID_2);
    end
	

end


