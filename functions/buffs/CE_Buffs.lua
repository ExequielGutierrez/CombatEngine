_G.TrackingCombatEngineBuff = 0;

local buffList_1 = {
	
	[1] = 623772, --Postre de naranja
	[2] = 623778, --Delicia culinaria
	[3] = 501616, --Vino Añejo
	[4] = 501337, --Poción heróica
	[5] = 1500227, --Pata de dinosaurio
	[6] = 626077, --Transformación donichuka de sombrero amarillo
	[7] = 1503798, --Poción de Doncella
	[8] = 1502307, --Inyector de phirius
	[9] = 501389, --Redención del fénix
	[10] = 1500225, --Tarta sorpresa
	[11] = 621080, --Foco de personaje
	[12] = 505058, --Banquete de avestruz
	[13] = 625652, --Impulso de aura
	[14] = 506638, --Ataque doncella
	[15] = 622528, --Draco Adulto
	[16] = 1500232, --Crónica de la guerra
	[17] = 1504027, --Guerrero de la librería
	
}

local buffList_2 = {
	
	[1] = 623775, --Zumo especiado de amor eterno
	[2] = 623778, --Delicia culinaria
	[3] = 501616, --Vino Añejo
	[4] = 501337, --Poción heróica
	[5] = 1500230, --Quimgombo de garuda
	[6] = 1500463, --Transformación Nayat
	[7] = 1503798, --Poción de Doncella
	[8] = 1502307, --Inyector de phirius
	[9] = 501389, --Redención del fénix
	[10] = 1500225, --Tarta sorpresa
	[11] = 621080, --Foco de personaje
	[12] = 505058, --Banquete de avestruz
	[13] = 625653, --Impulso de aura
	[14] = 506634, --Ataque doncella
	[15] = 622528, --Draco Adulto
	[16] = 1500233, --Crónica de la magia
	[17] = 1504027, --Guerrero de la librería

}

local buffList_3 = {
	
	[1] = 623775, --Zumo especiado de amor eterno
	[2] = 623778, --Delicia culinaria
	[3] = 501337, --Poción heróica
	[4] = 501614, --Bola de arroz con huevo
	[5] = 1500230, --Quimgombo de garuda
	[6] = 1500121, --Transformación Demonio desalmado
	[7] = 1503798, --Poción de Doncella
	[8] = 1502307, --Inyector de phirius
	[9] = 501389, --Redención del fénix
	[10] = 1500224, --Pastel de Atlas
	[11] = 621080, --Foco de personaje
	[12] = 625647, --Impulso de aura
	[13] = 506642, --Defensa doncella
	[14] = 622528, --Draco Adulto
	[15] = 1500231, --Crónicas de la vida

}

local buffList_4 = {
	
	[1] = 623772, --Postre de naranja
	[2] = 623778, --Delicia culinaria
	[3] = 501616, --Vino Añejo
	[4] = 501614, --Bola de arroz con huevo
	[5] = 1503801, --Poción de Doncella
	[6] = 501337, --Poción heróica
	[7] = 1500118, --Transformación Kidd
	[8] = 501389, --Redención del fénix
	[9] = 1500227, --Pata de dinosaurio
	[10] = 625645, --Impulso de aura
	[11] = 506642, --Defensa doncella
	[12] = 1502307, --Inyector de phirius
	[13] = 621080, --Foco de personaje
	[14] = 622528, --Draco Adulto
	[15] = 1500231, --Crónicas de la vida
	[16] = 1504027, --Guerrero de la librería

}

function CombatEngine_BuffsUpdate()
	
	if TrackingCombatEngineBuff == 1 then
	
		GameTooltip:ClearLines();
		GameTooltip:SetText(_G.CE_LANG.Tooltip.PhysicalBoost, 1, 0.75, 0 );
		
		for i = 1, #buffList_1 do
			local color
			if CE_BuffIdPlayer( buffList_1[i] ) == true then
				color = "|cff00FF00";
			else
				color = "|cffCDCDCD";
			end
			if i == 12 then
				GameTooltip:AddLine( color .. CE_toName( 1244303 ) .. "|r" );
			else
				GameTooltip:AddLine( color .. CE_toName( buffList_1[i] ) .. "|r" );
			end
		end		
	elseif TrackingCombatEngineBuff == 2 then
	
		GameTooltip:ClearLines();
		GameTooltip:SetText(_G.CE_LANG.Tooltip.MagicBoost, 0.75, 0.25, 0.75 );
		
		for i = 1, #buffList_2 do
			local color
			if CE_BuffIdPlayer( buffList_2[i] ) == true then
				color = "|cff00FF00";
			else
				color = "|cffCDCDCD";
			end
			if i == 12 then
				GameTooltip:AddLine( color .. CE_toName( 1244303 ) .. "|r" );
			else
				GameTooltip:AddLine( color .. CE_toName( buffList_2[i] ) .. "|r" );
			end
		end		
	elseif TrackingCombatEngineBuff == 3 then
	
		GameTooltip:ClearLines();
		GameTooltip:SetText(_G.CE_LANG.Tooltip.HealerBoost, 0.85, 1, 0.85 );
		
		for i = 1, #buffList_3 do
			local color
			if CE_BuffIdPlayer( buffList_3[i] ) == true then
				color = "|cff00FF00";
			else
				color = "|cffCDCDCD";
			end
			GameTooltip:AddLine( color .. CE_toName( buffList_3[i] ) .. "|r" );
		end		
	elseif TrackingCombatEngineBuff == 4 then
	
		GameTooltip:ClearLines();
		GameTooltip:SetText(_G.CE_LANG.Tooltip.TankBoost, 0.9, 0.72, 0.45);
		
		for i = 1, #buffList_4 do
			local color
			if CE_BuffIdPlayer( buffList_4[i] ) == true then
				color = "|cff00FF00";
			else
				color = "|cffCDCDCD";
			end
			GameTooltip:AddLine( color .. CE_toName( buffList_4[i] ) .. "|r" );
		end		
	end

end

function CE_BUFFS( id )

	if id == 1 then
		--Heroica
		if CE_BuffIdPlayer(501337) == false and CE_UseItem(200277) then
		--Pata de dinosaurio
		elseif CE_BuffIdPlayer(1500227) == false and not CE_BuffIdPlayer(501631) and not CE_BuffIdPlayer(501631) and CE_UseItem(1244049) then
		--Vino
		elseif CE_BuffIdPlayer(501616) == false and CE_UseItem(202242) then
		--Delicia culinaria
		elseif CE_BuffIdPlayer(623778) == false and CE_UseItem(241967) then
		--Defensa
		elseif CE_BuffIdPlayer(1500225) == false and CE_UseItem(1244047) then
		--Postre de naranja
		elseif CE_BuffIdPlayer(623772) == false and CE_UseItem(241961) then
		--Donichuka
		elseif CE_BuffIdPlayer(626077) == false and CE_UseItem(200827) then
		--Doncella
		elseif CE_BuffIdPlayer(1503798) == false and CE_UseItem(1249354) then
		--Inyector
		elseif CE_BuffIdPlayer(1502307) == false and CE_UseItem(1244820) then
		--Guerrero de la librería
		elseif CE_BuffIdPlayer(1504027) == false and CE_UseItem(1249461) then
		--Fénix
		elseif CE_BuffIdPlayer(501389) == false and CE_UseItem(201141) then
		end			
	--buffos mágicos
	elseif id == 2 then
		--Heroica
		if CE_BuffIdPlayer(501337) == false and CE_UseItem(200277) then
		--Quimbongo de garuda
		elseif CE_BuffIdPlayer(1500230) == false and CE_UseItem(1244052) then
		--Vino
		elseif CE_BuffIdPlayer(501616) == false and CE_UseItem(202242) then
		--Delicia culinaria
		elseif CE_BuffIdPlayer(623778) == false and CE_UseItem(241967) then
		--Defensa
		elseif CE_BuffIdPlayer(1500225) == false and CE_UseItem(1244047) then
		--Zumo especiado
		elseif CE_BuffIdPlayer(623775) == false and CE_UseItem(241964) then
		--Nayat
		elseif CE_BuffIdPlayer(1500463) == false and CE_UseItem(1244351) then
		--Doncella
		elseif CE_BuffIdPlayer(1503798) == false and CE_UseItem(1249354) then
		--Inyector
		elseif CE_BuffIdPlayer(1502307) == false and CE_UseItem(1244820) then
		--Guerrero de la librería
		elseif CE_BuffIdPlayer(1504027) == false and CE_UseItem(1249461) then
		--Fénix
		elseif CE_BuffIdPlayer(501389) == false and CE_UseItem(201141) then
		end		
	--buffos de healer
	elseif id == 3 then
		--Zumo especiado de amor eterno
		if CE_BuffIdPlayer(623775) == false and CE_UseItem(241964) then
		--Delicia culinaria
		elseif CE_BuffIdPlayer(623778) == false and CE_UseItem(241967) then
		--Poción heróica
		elseif CE_BuffIdPlayer(501337) == false and CE_UseItem(200277) then
		--Bola de arroz con huevo
		elseif CE_BuffIdPlayer(501614) == false and CE_UseItem(202240) then
		--Quimbongo de garuda
		elseif CE_BuffIdPlayer(1500230) == false and CE_UseItem(1244052) then
		--Transformación Demonio desalmado
		elseif CE_BuffIdPlayer(1500121) == false and CE_UseItem(1244031) then
		--Poción de Doncella
		elseif CE_BuffIdPlayer(1503798) == false and CE_UseItem(1249354) then
		--Inyector de phirius
		elseif CE_BuffIdPlayer(1502307) == false and CE_UseItem(1244820) then
		--Pastel de Atlas
		elseif CE_BuffIdPlayer(1500224) == false and CE_UseItem(1244046) then
		--Fénix
		elseif CE_BuffIdPlayer(501389) == false and CE_UseItem(201141) then
		end
	--buffos de tanque
	elseif id == 4 then
		--Postre de naranja
		if CE_BuffIdPlayer(623772) == false and CE_UseItem(241961) then
		--Delicia culinaria
		elseif CE_BuffIdPlayer(623778) == false and CE_UseItem(241967) then
		--Vino Añejo
		elseif CE_BuffIdPlayer(501616) == false and CE_UseItem(202242) then
		--Bola de arroz con huevo
		elseif CE_BuffIdPlayer(501614) == false and CE_UseItem(202240) then
		--Poción de Doncella
		elseif CE_BuffIdPlayer(1503801) == false and CE_UseItem(1249362) then
		--Poción heróica
		elseif CE_BuffIdPlayer(501337) == false and CE_UseItem(200277) then
		--Transformación Kidd
		elseif CE_BuffIdPlayer(1500118) == false and CE_UseItem(1244028) then
		--Pata de dinosaurio
		elseif CE_BuffIdPlayer(1500227) == false and CE_UseItem(1244049) then
		--Inyector de phirius
		elseif CE_BuffIdPlayer(1502307) == false and CE_UseItem(1244820) then
		--Guerrero de la librería
		elseif CE_BuffIdPlayer(1504027) == false and CE_UseItem(1249461) then
		--Redención del fénix
		elseif CE_BuffIdPlayer(501389) == false and CE_UseItem(201141) then
		end
	
	end

end
