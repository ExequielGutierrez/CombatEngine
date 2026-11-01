

CE_MAX_DURA_DISPLAY = 21
CE_SHOW_DURA = true


function CE_durability_OnShow( this )
	CE_durability_UpdateValues( this )
end

function CE_durability_OnLoad( this )
	this:RegisterEvent("PLAYER_INVENTORY_CHANGED");
	this:RegisterEvent("PLAYER_EQUIPMENT_UPDATE");	
	SaveVariables("CE_SHOW_DURA", "CombatEngine");
	CE_SHOW_DURA = CE_SHOW_DURA or true;
end

function CE_durability_OnEvent( this, event )
	if this:IsVisible() and event == "PLAYER_INVENTORY_CHANGED" or event == "PLAYER_EQUIPMENT_UPDATE" then
		CE_durability_UpdateValues()
	end
end

function CE_durability_UpdateValues()

	for i = 1, CE_MAX_DURA_DISPLAY do
		local equip = _G["CE_DUR_0" .. i]
		local current , _max, name = GetInventoryItemDurable("player", equip:GetParent():GetID() );
		
		if name and CE_SHOW_DURA then
			local color = current >= 100 and "|cff00FF00" or "|cffFF0000"
			--equip.Value:SetText( color .. current .. "|r" .. "/" .. "|cff00FF00" .. current .. "|r" );
			equip.Value:SetText( color .. current .. "|r" );
			equip:Show();
		else
			equip:Hide();
		end
		
	end

	

end