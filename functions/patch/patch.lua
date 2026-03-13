

function CombatEnigne_Patch_OnLoad( this )
	this:RegisterEvent("EXCHANGECLASS_SUCCESS");
	this:RegisterEvent("LOADING_END");
end

function CombatEnigne_Patch_OnEvent( this, event )
	if event == "EXCHANGECLASS_SUCCESS" or event == "LOADING_END" then
		if COMBATENGINE_EDIT_LUA:IsVisible() then
			COMBATENGINE_EDIT_LUA:Hide()
		end
		if not TimerQueue["COMBATPATCH"] then
			TimerQueue["COMBATPATCH"] = { GetTime() + 2, CombatEnigne_Patch }
		end
	end
end

function CombatEnigne_Patch()
	local serial = COMBAT_ENG_SERIAL
	local maxSkills = COMBAT_ENG_MAXSKILLS or 50;
	if not COMBAT_ENGINE_CUSTOM_PRESETS[serial] then return end
	local preset = COMBAT_ENGINE_CUSTOM_PRESETS[serial]
	if not preset then return end
	for  i = 1, maxSkills do		
		local indexA = preset[i] and preset[i].IndexA
		local indexB = preset[i] and preset[i].IndexB
		local icon = preset[i] and preset[i].icon
		local id = preset[i] and preset[i].id
		local _type = preset[i] and preset[i].type
		
		if _type == "skill" then
			if not indexA or indexA == 0 or not indexB or indexB == 0 or not id or id == 0 then 
				for A = 1, 6 do
					local maxEsp = GetNumSkill(A)
					if not maxEsp or type(maxEsp) ~= "number" then
						maxEsp = 0
					end
					for B = 1, maxEsp do
						local _name, _, _icon, type, level, _, _, _, _, _, _id = GetSkillDetail( A, B )
						if _icon == icon then
							preset[i].IndexA = A
							preset[i].IndexB = B
							preset[i].id = _id
							preset[i].name = _name
						end
					end
				end	
			end
		elseif _type == "skillplate" then
			for s = 0, 7 do
				local _name, _icon, _, _, _id = SkillPlateUpdate(s)
				if _icon and _icon == icon then
					preset[i].IndexA = s;
					preset[i].id = _id
					preset[i].name = _name
				end
			end
		end
	end
	COMBATENGINE_EDIT_LUA_Slot_Skill_UpdateSlots();
end