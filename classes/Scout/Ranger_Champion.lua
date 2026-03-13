
--Lua Scout/Warrior BY NEORAXER 19-03-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_SCOUT_CHAMPION()



    --DEFAULT_CHAT_FRAME:AddMessage("Usando EXPLO/DRUIDA")
	--local hp = UnitHealth("player")
    --local MaxHp = UnitMaxHealth("player")
	
	local foco = UnitMana("player");
	local ira = UnitSkill("player");

	--Bloody Shot
	local BLO_SHO_SKILL, BLO_SHO_SKILL_ID_1, BLO_SHO_SKILL_ID_2 = Match_CE(1490784);
	--Frost Shot
	local FRO_SHO_SKILL, FRO_SHO_ID_1, FRO_SHO_ID_2 = Match_CE(1490776);
	
	--Concentraci�n
	local CONC_SKILL, CONC_ID_1, CONC_ID_2 = Match_CE(490460);
	local CONC_CD = CE_CD(CONC_SKILL, CONC_ID_1, CONC_ID_2);
	--Shot
	local TIR_SKILL, TIR_ID_1, TIR_ID_2 = Match_CE(1490770);
	local TIR_CD = CE_CD(TIR_SKILL, TIR_ID_1, TIR_ID_2);	
	--Fatal Shot
	local FA_SHO_SKILL, FA_SHO_ID_1, FA_SHO_ID_2 = Match_CE(1490773);
	local FA_SHO_CD = CE_CD(FA_SHO_SKILL, FA_SHO_ID_1, FA_SHO_ID_2);
    --Snipe
	local SNI_SKILL, SNI_ID_1, SNI_ID_2 = Match_CE(1490782);
	local SNI_CD = CE_CD(SNI_SKILL, SNI_ID_1, SNI_ID_2);
    --Combo Shot
    local COM_SHO_SKILL, COM_SHO_ID_1, COM_SHO_ID_2 = Match_CE(1490774);
	local COM_SHO_CD = CE_CD(COM_SHO_SKILL, COM_SHO_ID_1, COM_SHO_ID_2);
    --Joint Blow
	local JOI_BLO_SKILL, JOI_BLO_ID_1, JOI_BLO_ID_2 = Match_CE(490420);
	local JOI_BLO_CD = CE_CD(JOI_BLO_SKILL, JOI_BLO_ID_1, JOI_BLO_ID_2);
    --Piercing Arrow
    local PI_ARR_SKILL, PI_ARR_ID_1, PI_ARR_ID_2 = Match_CE(490400);
	local PI_ARR_CD = CE_CD(PI_ARR_SKILL, PI_ARR_ID_1, PI_ARR_ID_2);  
	--Vampire Arrow
    local VAM_ARR_SKILL, VAM_ARR_ID_1, VAM_ARR_ID_2 = Match_CE(491292);
	local VAM_ARR_CD = CE_CD(VAM_ARR_SKILL, VAM_ARR_ID_1, VAM_ARR_ID_2); 
    --Reflected Shot
    local RE_SHO_SKILL, RE_SHO_ID_1, RE_SHO_ID_2 = Match_CE(1490772);
	local RE_SHO_CD = CE_CD(RE_SHO_SKILL, RE_SHO_ID_1, RE_SHO_ID_2);   
    --Wind Shot
    local WIN_SHO_SKILL, WIN_SHO_ID_1, WIN_SHO_ID_2 = Match_CE(1490777);
	local WIN_SHO_CD = CE_CD(WIN_SHO_SKILL, WIN_SHO_ID_1, WIN_SHO_ID_2); 
    --Rain of Vengeance
	local RAI_VEN_SKILL, RAI_VEN_CD_1, RAI_VEN_CD_2 = Match_CE(1490445);
	local RAI_VEN_CD = CE_CD(RAI_VEN_SKILL, RAI_VEN_CD_1, RAI_VEN_CD_2);






   --COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if CE_TARGET_IS_BOSS() and foco <= 10 and CE_UseItem(1244064) then
		--Estimulante fuerte
        elseif  CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(501321) == false) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(200173) then
		--Agilidad elfica
        elseif  CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(501321) and (CE_BuffIdPlayer(1500237) == false) and CE_UseItem(1244062) then
		--Filete de costilla de primer ID 1244060 (solo Boss)
        elseif CE_TARGET_IS_BOSS() and (CE_BuffIdPlayer(1500235) == false) and CE_UseItem(1244060) then
		end
		CE_HEALING_ITEM()
	end


    --ROTACI�N--
	
	--Autoshoot
	CE_NewAutoShoot( 1490917 )
	
	--Snipe
	if SNI_SKILL and SNI_CD <=0.25 and (CE_BUFF_PLAYER_STACK(1501097, 4) == true) then
		UseSkill(SNI_ID_1, SNI_ID_2);
	--Fatal Shot
	elseif FA_SHO_SKILL and FA_SHO_CD <=0.25 then
		UseSkill(FA_SHO_ID_1, FA_SHO_ID_2);
	--shot
	elseif TIR_SKILL and TIR_CD<=0.25 then
		UseSkill(TIR_ID_1, TIR_ID_2);
	--Combo Shot
	elseif COM_SHO_SKILL and COM_SHO_CD<=0.25 then
		UseSkill(COM_SHO_ID_1, COM_SHO_ID_2);
	-- Rain Vengeance
	elseif RAI_VEN_SKILL and RAI_VEN_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		SpellTargetUnit("mouseover");
		UseSkill(RAI_VEN_CD_1, RAI_VEN_CD_2);
	-- Reflected Shot
	elseif RE_SHO_SKILL and RE_SHO_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(RE_SHO_ID_1, RE_SHO_ID_2);
	-- Piercing Arrow
	elseif PI_ARR_SKILL and PI_ARR_CD<=0.25 and not CE_TARGET_IS_BOSS() and C_EngineSettings.AOE then
		UseSkill(PI_ARR_ID_1, PI_ARR_ID_2);
	--Joint Blow
	elseif JOI_BLO_SKILL and JOI_BLO_CD <= 0.25 and foco >= 15 then
		UseSkill(JOI_BLO_ID_1, JOI_BLO_ID_2);    
    --Wind Arrow
	elseif WIN_SHO_SKILL and WIN_SHO_CD<=0.25 then
		UseSkill(WIN_SHO_ID_1, WIN_SHO_ID_2);
	end
	
end








