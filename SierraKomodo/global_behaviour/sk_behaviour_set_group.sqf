/**
 * Sets the given group's behaviour to the given behaviour.
 *
 * Any groups whose current behaviour is found in `sk_global_behaviour_blacklist` will be skipped.
 */

params ["_group", "_behaviour"];


// Check behaviour and set default value if necessary
if (_behaviour == "") then {
	private _side = side _group;
	switch (_side) do {
		case west: {
			_behaviour = sk_global_behaviour_west;
		};
		case east: {
			_behaviour = sk_global_behaviour_east;
		};
		case resistance: {
			_behaviour = sk_global_behaviour_resistance;
		};
	};
};


// Set group behaviour if it meets the conditions
private _currentBehaviour = combatBehaviour leader _group;
private _behaviourBlacklisted = _currentBehaviour in sk_global_behaviour_blacklist;
if (!_behaviourBlacklisted) then {
	_group setBehaviourStrong _behaviour;
};
