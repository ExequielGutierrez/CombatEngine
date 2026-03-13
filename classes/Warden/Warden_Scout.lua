
--Lua Rouge/SCOUT BY NEORAXER 20-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_WARDEN_SCOUT()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	
	local pm = UnitMana("player")
	local foco = UnitSkill("player")
    local MaxPm = UnitMaxMana("player")
    local hp = UnitHealth("player")
    local MaxHp = UnitMaxHealth("player")
	
	--Chirón el centauro
	local CHI_CEN_SKILL, CHI_CEN_ID_1, CHI_CEN_ID_2 = Match_CE(494212);
	--Escudo de zarzas
	local ESC_ZAR_SKILL, ESC_ZAR_ID_1, ESC_ZAR_ID_2 = Match_CE(493642);	
	--Protección de la naturaleza
	local PRO_NAT_SKILL, PRO_NAT_ID_1, PRO_NAT_ID_2 = Match_CE(493348);		
	--Disparo de aparición
	local DIS_APA_SKILL, DIS_APA_ID_1, DIS_APA_ID_2 = Match_CE(494612);
	local DIS_APA_CD = CE_CD(DIS_APA_SKILL, DIS_APA_ID_1, DIS_APA_ID_2);	
	--Corazón del roble -> res 2 golpes
	local COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2 = Match_CE(491668);
	local COR_ROB_CD = CE_CD(COR_ROB_SKILL, COR_ROB_ID_1, COR_ROB_ID_2);	
	--Guia elfica -> restore pm
	local GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2 = Match_CE(493405);
	local GUI_ELF_CD = CE_CD(GUI_ELF_SKILL, GUI_ELF_ID_1, GUI_ELF_ID_2);			
	--Poder feroz -> + daño
	local POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2 = Match_CE(493406);
	local POD_FER_CD = CE_CD(POD_FER_SKILL, POD_FER_ID_1, POD_FER_ID_2);			
	--Exposión de poder
	local EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2 = Match_CE(493403);
	local EXP_POD_CD = CE_CD(EXP_POD_SKILL, EXP_POD_ID_1, EXP_POD_ID_2);
	--Moral y deseo
	local MOR_DES_SKILL, MOR_DES_ID_1, MOR_DES_ID_2 = Match_CE(494357);
	local MOR_DES_CD = CE_CD(MOR_DES_SKILL, MOR_DES_ID_1, MOR_DES_ID_2);	
	--Agua oscuras
	local AGU_OSC_SKILL, AGU_OSC_ID_1, AGU_OSC_ID_2 = Match_CE(499898);
	local AGU_OSC_CD = CE_CD(AGU_OSC_SKILL, AGU_OSC_ID_1, AGU_OSC_ID_2);
	--Absorción de energia
	local ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2 = Match_CE(493644);
	local ABS_ENE_CD = CE_CD(ABS_ENE_SKILL, ABS_ENE_ID_1, ABS_ENE_ID_2);	
	--Golpe a las articulaciones
	local GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2 = Match_CE(490420);
	local GOL_ART_CD = CE_CD(GOL_ART_SKILL, GOL_ART_ID_1, GOL_ART_ID_2);
	--Sombra del oceano
	local SOM_OCE_SKILL, SOM_OCE_ID_1, SOM_OCE_ID_2 = Match_CE(494006);
	local SOM_OCE_CD = CE_CD(SOM_OCE_SKILL, SOM_OCE_ID_1, SOM_OCE_ID_2);
	--Corte Cruzado
	local COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2 = Match_CE(493394);
	local COR_CRU_CD = CE_CD(COR_CRU_SKILL, COR_CRU_ID_1, COR_CRU_ID_2);	
    --Flecha vampírica
    local FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2 = Match_CE(491292);
	local FLE_VAM_CD = CE_CD(FLE_VAM_SKILL, FLE_VAM_ID_1, FLE_VAM_ID_2);    
    --Tiro
    local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(490423);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2); 
	--Oración élfica
	local ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2 = Match_CE(493398);
	local ORA_ELF_CD = CE_CD(ORA_ELF_SKILL, ORA_ELF_ID_1, ORA_ELF_ID_2);
	
	
	--BUFFOS--
	
	--Chiron
	if CHI_CEN_SKILL and (CE_READ_PET(102803) == false) then
		UseSkill(CHI_CEN_ID_1, CHI_CEN_ID_2);
	--Escudo de zarzas
	elseif ESC_ZAR_SKILL and (CE_BuffIdPlayer(503958) == false) then
		UseSkill(ESC_ZAR_ID_1, ESC_ZAR_ID_2);
	--Protección de la naturaleza
	elseif PRO_NAT_SKILL and (CE_BuffIdPlayer(503581) == false) then
		UseSkill(PRO_NAT_ID_1, PRO_NAT_ID_2);
	end
	
	

	--BUFFOS OFENSIVOS--

	--Poder feroz
	if POD_FER_SKILL and POD_FER_CD <= 0.25 and (_G.C_EngineSettings.FastBuffs or CE_TARGET_IS_BOSS()) then
		UseSkill(POD_FER_ID_1, POD_FER_ID_2);
	--Explosión de poder
	elseif EXP_POD_SKILL and EXP_POD_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(EXP_POD_ID_1, EXP_POD_ID_2);
	--Moral y deseo
	elseif MOR_DES_SKILL and MOR_DES_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(MOR_DES_ID_1, MOR_DES_ID_2);
	--Aguas oscuras
	elseif AGU_OSC_SKILL and AGU_OSC_CD <= 0.25 and CE_TARGET_IS_BOSS() then
		UseSkill(AGU_OSC_ID_1, AGU_OSC_ID_2);
		
	end

	
	-- HABILIDADES DE RESTAURACIÓN
	
	--Guia elfica
	if GUI_ELF_SKILL and GUI_ELF_CD <= 0.25 and pm <= MaxPm/3 then
		UseSkill(GUI_ELF_ID_1, GUI_ELF_ID_2);
	--Oracion elfica
	elseif CE_READ_PET(102803) and ORA_ELF_SKILL and ORA_ELF_CD <= 0.25 and UnitHealth("pet") <= UnitMaxHealth("pet")/2 then
		UseSkill(ORA_ELF_ID_1, ORA_ELF_ID_2);	
	--Corazón del roble
	elseif COR_ROB_SKILL and COR_ROB_CD <= 0.25 and hp <= MaxHp/4 then
		UseSkill(COR_ROB_ID_1, COR_ROB_ID_2);
	end
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poción del enano
		if foco <= 20 and CE_UseItem(1244064) then
		--Usar costilla de primera
		elseif (CE_BuffIdPlayer(1500235) == false) and CE_TARGET_IS_BOSS() and CE_UseItem(1244060) then
		--Usar Phirius de mana
		elseif pm <= MaxPm/3 and CE_UseItem(203503) then
		--Estimulante fuerte
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		end
		CE_HEALING_ITEM()
	end
	
	
	--Disparo de aparición
    if CE_READ_PET(102803) and DIS_APA_SKILL then
        UsePetAction(5);
	end
	
	
	--Absorción de energia
    if ABS_ENE_SKILL and ABS_ENE_CD <= 0.25 and CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(504137) == false) then
        UseSkill(ABS_ENE_ID_1, ABS_ENE_ID_2);
	--Flecha vampírica
    elseif FLE_VAM_SKILL and FLE_VAM_CD <= 0.25 and foco >= 10 and (CE_DebuffIdTarget(501690) == false) then
        UseSkill(FLE_VAM_ID_1, FLE_VAM_ID_2);
	--Corte Cruzado
    elseif COR_CRU_SKILL and COR_CRU_CD <= 0.25 and _G.C_EngineSettings.AOE then
        UseSkill(COR_CRU_ID_1, COR_CRU_ID_2);
	--Golpe a las articulaciones
    elseif GOL_ART_SKILL and GOL_ART_CD <= 0.25 and foco >= 15 then
        UseSkill(GOL_ART_ID_1, GOL_ART_ID_2);
	--Sombra del oceano
    elseif SOM_OCE_SKILL and SOM_OCE_CD <= 0.25 and foco >= 20 then
        UseSkill(SOM_OCE_ID_1, SOM_OCE_ID_2);
	--Tiro
    elseif TIR_SKILL and TIR_CD <= 0.25 then
        UseSkill(TIR_ID_1, TIR_ID_2);
	end

end





