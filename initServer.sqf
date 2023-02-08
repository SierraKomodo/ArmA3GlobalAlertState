/*************************
 * CONFIGURATION OPTIONS *
 *************************/
/// SK Global Behaviour Settings
// Array of strings (behaviour). Behaviours that should not be overridden if a group is set to them during changing of
// global. It's recommended to, at minimum, have "COMBAT" in this list.
sk_global_behaviour_blacklist = [
	"CARELESS",
	"COMBAT",
	"STEALTH"
];
publicVariable "sk_global_behaviour_blacklist";



/********************
 * GLOBAL VARIABLES *
 ********************/
/// SK Global Behaviour
// String (behaviour). The current default behaviour for the given side.
sk_global_behaviour_west = "AWARE";
publicVariable "sk_global_behaviour_west";

sk_global_behaviour_east = "AWARE";
publicVariable "sk_global_behaviour_east";

sk_global_behaviour_resistance = "AWARE";
publicVariable "sk_global_behaviour_resistance";



/******************
 * EVENT HANDLERS *
 ******************/
{
	/// SK Global handlers
	// Event handler for setting placed group behavior
	_x addEventHandler ["CuratorObjectPlaced", {
		params ["_curator", "_entity"];
		private _group = group _entity;
		private _leader = leader _group;
		private _behaviour = combatBehaviour _leader;
		if (_entity == _leader) then {
			[_group, ""] call SK_fnc_globalBehaviourSetGroup;
		};
	}];
} foreach AllCurators;
