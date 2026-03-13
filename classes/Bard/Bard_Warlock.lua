
--Lua BARD/DRUID BY NEORAXER 08-04-2024
--V1.0 High quality for Combat Engine -> Autor: NEORAXER
--Neoraxer@live.com

function CE_BARD_WARLOCK()




    --DEFAULT_CHAT_FRAME:AddMessage("Usando Picaro/Alcaide")
	

	local foco = UnitMana("player")
    local mana = UnitSkill("player")
	local MaxPm = UnitMaxSkill("player")
	
	-- Warp Charge
	local WARP_SKILL, WARP_ID_1, WARP_ID_2 = Match_CE (497958);
	local WARP_CD = CE_CD(WARP_SKILL, WARP_ID_1, WARP_ID_2);
	--Cambio de octava
	local CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2 = Match_CE(1491388);	
	local CAM_OCT_CD = CE_CD(CAM_OCT_SKILL, CAM_OCT_ID_1, CAM_OCT_ID_2);
	-- Weakening Weave Curse
	local WEAK_SKILL, WEAK_ID_1, WEAK_ID_2 = Match_CE(497959);
	local WEAK_CD = CE_CD(WEAK_SKILL, WEAK_ID_1, WEAK_ID_2);
	-- Octave Shifting
	local OCTA_SKILL, OCTA_ID_1, OCTA_ID_2 = Match_CE(1491100);
	local OCTA_CD = CE_CD(OCTA_SKILL, OCTA_ID_1, OCTA_ID_2);
	-- Immaterial Recurrence
	local IMM_SKILL, IMM_ID_1, IMM_ID_2 = Match_CE(1491193);
	local IMM_CD = CE_CD(IMM_SKILL, IMM_ID_1, IMM_ID_2);
	--Delirio ritmico
	local DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2 = Match_CE(1491387);	
	local DEL_RIT_CD = CE_CD(DEL_RIT_SKILL, DEL_RIT_ID_1, DEL_RIT_ID_2);
	--Armon�a -- Harmony
	local ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2 = Match_CE(1491389);	
	local ARMONIA_CD = CE_CD(ARMONIA_SKILL, ARMONIA_ID_1, ARMONIA_ID_2);
	--Surge of Malece
	local SURGE_SKILL, SURGE_ID_1, SURGE_ID_2 = Match_CE(497966);
	local SURGE_CD = CE_CD(SURGE_SKILL, SURGE_ID_1, SURGE_ID_2);
	-- Soul Blast
	local SOULB_SKILL, SOULB_ID_1, SOULA_ID_2 = Match_CE(1491192);
	local SOULB_CD = CE_CD(SOULB_SKILL, SOULB_ID_1, SOULA_ID_2);
	-- Musical Attack
	local MUA_SKILL, MUA_ID_1, MUA_ID_2 = Match_CE(1491086);
	local MUA_CD = CE_CD(MUA_SKILL, MUA_ID_1, MUA_ID_2);
	-- Spiritual Rune
	local SPI_RU_SKILL, SPI_RU_ID_1, SPI_RU_ID_2 = Match_CE(1491195);
	local SPI_RU_CD = CE_CD(SPI_RU_SKILL, SPI_RU_ID_1, SPI_RU_ID_2);
	-- Tempo
	local TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2 = Match_CE(1491103);
	local TEMPO_CD = CE_CD(TEMPO_SKILL, TEMPO_ID_1, TEMPO_ID_2);
	-- Cazador de almas
	local CAZADOR_SKILL, CAZADOR_ID_1, CAZADOR_ID_2 = Match_CE(1491189);
	--Cosechador cruel
	local COSECHADOR_SKILL, COSECHADOR_ID_1, COSECHADOR_ID_2 = Match_CE(1491190);
	local COSECHADOR_CD = CE_CD(COSECHADOR_SKILL, COSECHADOR_ID_1, COSECHADOR_ID_2);

	--if(_G.C_EngineSettings.FastBuffs) then		
		--Amuleto de la suerte -- Lucky Charm 
		--if CE_ISS_CD(CE_toName(1491345)) and C_EngineSettings.FastBuffs then
			--CastSpellByName(CE_toName(1491345));
		
		--end
	--end
	
	
	
	
	--COMIDAS--
	if _G.C_EngineSettings.Consumables then
		--Usar poci�n del enano
		if CE_TARGET_IS_BOSS() and foco <= 20 and CE_UseItem(1244064) then
		--Usar papas de col rizada
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500234) == false and  CE_UseItem(1244059) then
		--Usar frasco del esp�ritu �lfico
		elseif CE_TARGET_IS_BOSS() and CE_BuffIdPlayer(1500238) == false and  CE_UseItem(1244063) then
		--Usar agua de los esp�ritus de anta�o
		elseif CE_TARGET_IS_BOSS() and CE_BuffTimeLeftById(1500238) and CE_BuffIdPlayer(500112) == false and CE_UseItem(200192) then
				
		end
		CE_HEALING_ITEM()
	end
	
	--BUFF--
	if not CE_BuffIdPlayer( 1501983 ) then
		UseSkill( CAZADOR_ID_1, CAZADOR_ID_2 );
	end

	
	--ROTACION--

	
	-- Warp Charge
	if WARP_SKILL and WARP_CD <= 0.25 and foco >= 14 then
		UseSkill(WARP_ID_1, WARP_ID_2);
	elseif SPI_RU_SKILL and (SPI_RU_CD <=0.25) and (foco>=28) then
		UseSkill(SPI_RU_ID_1, SPI_RU_ID_2);
	--tempo buff
	elseif TEMPO_SKILL and (TEMPO_CD <=0.25) and (foco>=17) and _G.C_EngineSettings.FastBuffs then
		UseSkill(TEMPO_ID_1, TEMPO_ID_2);
	--cosechador cruel buff
	elseif COSECHADOR_SKILL and (COSECHADOR_CD <= 0.25) and _G.C_EngineSettings.FastBuffs and CE_BuffIdPlayer(1501977) then
		UseSkill(COSECHADOR_ID_1, COSECHADOR_ID_2);
	-- Stolen Music
	elseif (CE_DebuffIdTarget(1501799) == true) and IsSpellUsable(1491356) then
		CastSpellByName(CE_toName(1491356));
	--Delirio ritmico -- Rhythmic Delusion
	elseif DEL_RIT_SKILL and DEL_RIT_CD <= 0.25 and foco >= 25 then
		UseSkill(DEL_RIT_ID_1, DEL_RIT_ID_2);
	-- Immaterial Recurrence
	elseif IMM_SKILL and IMM_CD <= 0.25 then
		UseSkill(IMM_ID_1, IMM_ID_2);
	-- Weakening Weave Curse
	elseif WEAK_SKILL and WEAK_CD <= 0.25 and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
		UseSkill(WEAK_ID_1, WEAK_ID_2);
	--Cambio de octava
	elseif CAM_OCT_SKILL and CAM_OCT_CD <= 0.25 and foco >= 15 and _G.C_EngineSettings.AOE then
		UseSkill(CAM_OCT_ID_1, CAM_OCT_ID_2);
	-- Surge of Malice
	elseif SURGE_SKILL and SURGE_CD <= 0.25 and foco >= 14 and _G.C_EngineSettings.AOE and not CE_TARGET_IS_BOSS() then
		UseSkill(SURGE_ID_1, SURGE_ID_2);
	--Armon�a -- Harmony
	elseif ARMONIA_SKILL and ARMONIA_CD <= 0.25 and CE_isMoving() == false then
		UseSkill(ARMONIA_ID_1, ARMONIA_ID_2);
	-- Soul Blast
	elseif SOULB_SKILL and SOULB_CD <= 0.25 and foco >= 14 and (CE_BuffIdPlayer(1501977) == true) then
		UseSkill(SOULB_ID_1, SOULA_ID_2);
	-- Musical Attack
	elseif MUA_SKILL and MUA_CD <= 0.25 and foco >= 10 then
		UseSkill(MUA_ID_1, MUA_ID_2);
	
	end


end


