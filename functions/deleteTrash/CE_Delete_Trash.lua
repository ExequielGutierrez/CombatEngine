COMBATENGINE_DELETE = {}
COMBATENGINE_DELETE_INPROGRESS = false;

function CombatEngine_Cleaner_OnLoad( this )

	this:RegisterEvent("BAG_ITEM_UPDATE");	
	SaveVariables("COMBATENGINE_DELETE", "CombatEngine");

	COMBATENGINE_DELETE = COMBATENGINE_DELETE;
	if COMBATENGINE_DELETE.runes == nil then COMBATENGINE_DELETE.runes = false end
	if COMBATENGINE_DELETE.production == nil then COMBATENGINE_DELETE.production = false end
	if COMBATENGINE_DELETE.guild == nil then COMBATENGINE_DELETE.guild = false end
	if COMBATENGINE_DELETE.low == nil then COMBATENGINE_DELETE.low = false end

end

function CombatEngine_Cleaner_OnEvent( this, event )

	if event == "BAG_ITEM_UPDATE" then	
		TimerQueue["CombatEngine_DelayDelete"] = { GetTime() + 3, CombatEngine_Cleaner_DelayDelete};
	end	
end

function CombatEngine_Cleaner_DelayDelete()

	if COMBATENGINE_DELETE.runes == false and COMBATENGINE_DELETE.production == false and COMBATENGINE_DELETE.guild == false then return end;
	if COMBATENGINE_DELETE_INPROGRESS == true then return end;
	COMBATENGINE_DELETE_INPROGRESS = true;
	
	for a = 1, 12 do
		local unOwned, time = GetBagPageLetTime(a);
		if not unOwned or ( unOwned and time ~= -1 ) then
		--print( a .. ": " .. tostring(unOwned) .. " / " .. tostring(time))
			for b = 1, 30 do
				local slot = (a - 1) * 30 + b
				local Index, _, Name, count, locked, _, ItemID = GetBagItemInfo(slot)
				
				if COMBATENGINE_DELETE.runes then
					if CombatEngine_IsLowRune(ItemID) then
						PickupBagItem(Index)
						orgDeleteCursorItem()
					end
				end
				if COMBATENGINE_DELETE.production then
					if CombatEngine_IsProd(ItemID) then
						PickupBagItem(Index)
						orgDeleteCursorItem()
					end
				end
				if COMBATENGINE_DELETE.guild then
					if CombatEngine_IsGuild(ItemID) then
						PickupBagItem(Index)
						orgDeleteCursorItem()
					end
				end
				if COMBATENGINE_DELETE.low then
					if CombatEngine_IsLow(ItemID) then
						PickupBagItem(Index)
						orgDeleteCursorItem()
					end
				end
			end
		end
	end
	
	COMBATENGINE_DELETE_INPROGRESS = false;

end

function CombatEngine_IsLowRune( ItemID )

	if not ItemID then return false end;
	if not GetObjectInfo( ItemID, "Class" ) == EM_Item_Rune then return false end;

	if
	--Vigor
	ItemID >= 520021 and ItemID <= 520029 or
	--Resistance
	ItemID >= 520041 and ItemID <= 520049 or
	--Mind
	ItemID >= 520061 and ItemID <= 520069 or
	--Vitality
	ItemID >= 520081 and ItemID <= 520089 or
	--Rapidez
	ItemID >= 520101 and ItemID <= 520109 or
	--Resistencia	
	ItemID >= 520121 and ItemID <= 520129 or
	--Magic
	ItemID >= 520141 and ItemID <= 520149 or
	--Daño
	ItemID >= 520161 and ItemID <= 520169 or
	--Asalto
	ItemID >= 520181 and ItemID <= 520189 or
	--Defensa
	ItemID >= 520201 and ItemID <= 520209 or
	--Protección
	ItemID >= 520221 and ItemID <= 520229
	then
		return true
	else
		return false
	end

end

function CombatEngine_IsProd( ItemID )

	if not ItemID then return false end
	
	if GetObjectInfo( ItemID, "itemtype") == 24 then
		return true
	else
		return false
	end

end

function CombatEngine_IsGuild( ItemID )

	if not ItemID then return false end
	
	if ItemID == 202916 or ItemID == 202917 then
		return true
	else
		return false
	end

end

function CombatEngine_IsLow( ItemID )

	if not ItemID then return false end
	--pociones
	if GetObjectInfo( ItemID, "itemtype") == 4 and GetQualityByGUID( ItemID ) == 0  and ItemID ~= 200196 and ItemID ~= 200197 and ItemID ~= 200198 or 
	--flechas
	GetObjectInfo( ItemID, "WeaponType") == 14 and GetQualityByGUID( ItemID ) == 0 or
	--proyectiles
	GetObjectInfo( ItemID, "WeaponType") == 16 and GetQualityByGUID( ItemID ) == 0 or 
	--hiernas elementales
	ItemID >= 208473 and ItemID <= 208486 then
		return true
	else
		return false
	end

end