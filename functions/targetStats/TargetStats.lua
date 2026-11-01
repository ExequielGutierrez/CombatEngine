--Target Stats
--Author: Neoraxer

function SetStats( unit )

	if not CE_SHOW_TARGET_STATS or not unit then return end

    if ( not UnitIsNPC( unit ) and not UnitIsPlayer( unit )) or UnitIsMine( unit ) or UnitIsQuestNPC( unit ) then return end

	if GameTooltip and GameTooltip:IsVisible() then
		local physical_attack, magic_attack = UnitAttack( unit, false );
		local physical_defense, magic_defense = UnitDefense( unit, false );

		if not physical_attack or not magic_attack or not physical_defense or not magic_defense then return end
		if physical_attack == 0 or magic_attack == 0 or physical_defense == 0 or magic_defense == 0 then return end

		GameTooltip:AddSeparator()
		GameTooltip:AddLine("|cff00CCCC - Combat Engine Stats -|r" );
		GameTooltip:AddDoubleLine("|e0237w |cffFFFFFF" .. SYS_TOOLTIP_ATTACK ..":|r ", "|cffFF8080" .. tostring( ScoresNormalization( physical_attack) ) .. "|r" );
		GameTooltip:AddDoubleLine("|e0207w |cffFFFFFF" .. SYS_TOOLTIP_MATTACK ..":|r ", "|cff8080FF" .. tostring( ScoresNormalization( magic_attack) ) .. "|r" );
		GameTooltip:AddDoubleLine("|e0211w |cffFFFFFF" .. SYS_TOOLTIP_DEF ..":|r ", "|cffCC9966" .. tostring( ScoresNormalization( physical_defense) ) .. "|r" );
		GameTooltip:AddDoubleLine("|e0206w |cffFFFFFF" .. SYS_TOOLTIP_MDEF ..":|r ", "|cff9966CC" .. tostring( ScoresNormalization( magic_defense) ) .. "|r" );
	end
end

local orgGameTooltip_SetUnit = GameTooltip_SetUnit

GameTooltip_SetUnit = function( tipsObj, unit, isFrame )
    orgGameTooltip_SetUnit( tipsObj, unit, isFrame );
    SetStats( unit );
end

function CE_CustomPreset_CheckSystem()
	if CE_SHOW_TARGET_STATS == false then
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipAttackCheckButton:Enable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicAttackCheckButton:Enable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipDefenseCheckButton:Enable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicDefenseCheckButton:Enable();
	else
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipAttackCheckButton:SetChecked(false);
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipAttackCheckButton:Disable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicAttackCheckButton:SetChecked(false);
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicAttackCheckButton:Disable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipDefenseCheckButton:SetChecked(false);
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipDefenseCheckButton:Disable();
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicDefenseCheckButton:SetChecked(false);
		GameSettingsFrameScrollFrameChildInterfaceTooltipsUnitTooltipMagicDefenseCheckButton:Disable();
		GameTooltip_SetUnitTooltipInfo("SHOW_ATTACK", false) ;
		GameTooltip_SetUnitTooltipInfo("SHOW_MAGIC_ATTACK", false) ;
		GameTooltip_SetUnitTooltipInfo("SHOW_DEF", false) ;
		GameTooltip_SetUnitTooltipInfo("SHOW_MAGIC_DEF", false) ;
	end
end

function CE_CustomPreset_OnLoad( this )
	this:RegisterEvent("VARIABLES_LOADED");
end

function CE_CustomPreset_OnEvent( this, event )
	if event == "VARIABLES_LOADED" then
		_G[ this:GetName().."_TEXT" ]:SetText(CE_LANG.Main.Stats);
		this:SetChecked( CE_SHOW_TARGET_STATS );
		CE_SHOW_TARGET_STATS = CE_SHOW_TARGET_STATS or true;
		CE_CustomPreset_CheckSystem();
	end
end