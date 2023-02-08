/**
 * Sets the behaviour of all groups for the given side to the given behaviour.
 *
 * Any groups whose current behaviour is found in `sk_global_behaviour_blacklist` will be skipped.
 */

params ["_side", "_behaviour"];


// Update all groups of side to the new behaviour
{
	if (side _x == _side) then {
		[_x, _behaviour] call SK_fnc_globalBehaviourSetGroup;
	};
} forEach allGroups;


// Update global var
switch (_side) do
{
	case west: {
		sk_global_behaviour_west = _behaviour;
		publicVariable "sk_global_behaviour_west";
	};
	case east: {
		sk_global_behaviour_east = _behaviour;
		publicVariable "sk_global_behaviour_east";
	};
	case resistance: {
		sk_global_behaviour_resistance = _behaviour;
		publicVariable "sk_global_behaviour_resistance";
	};
};
