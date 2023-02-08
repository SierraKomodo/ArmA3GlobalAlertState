if (player in (units curators)) then {
	// Add actions to curators group to set global safe/alert status
	player addAction
	[
		"Set Global Aware",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[resistance, "AWARE"] spawn SK_fnc_globalBehaviourSetGlobal;
			[east, "AWARE"] spawn SK_fnc_globalBehaviourSetGlobal;
			{["Hostile forces globally set to AWARE."] remoteExec ["hint", _x]} forEach (units curators);
		},
		nil,
		0,
		true,
		true,
		"",
		"_target == _this && sk_global_behaviour_resistance != 'AWARE'",
		0,
		false,
		"",
		""
	];

	player addAction
	[
		"Set Global Safe",
		{
			params ["_target", "_caller", "_actionId", "_arguments"];
			[resistance, "SAFE"] spawn SK_fnc_globalBehaviourSetGlobal;
			[east, "SAFE"] spawn SK_fnc_globalBehaviourSetGlobal;
			{["Hostile forces globally set to SAFE."] remoteExec ["hint", _x]} forEach (units curators);
		},
		nil,
		0,
		true,
		true,
		"",
		"_target == _this && sk_global_behaviour_resistance != 'SAFE'",
		0,
		false,
		"",
		""
	];
};
