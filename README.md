# ArmA 3 Global Behaviour Script

This script for ArmA 3 missions provides a means for mission curators to globally set combat behavior states at will during a mission.

The original intended use was having a global combat state of `SAFE` applied to all hostile units, including those spawned mid-mission until the Zeus sets the global state to `AWARE` to simulate the enemy forces entering an alert status during stealth missions.


## Installation

1. To add this script to your mission file, first, create and save a mission file.

2. Once the mission file is saved, navigate to your ArmA 3 missions folder, typically in one of these two paths:

- `C:\Users\[WINDOWS USERNAME]\Documents\Arma 3\missions`
- `C:\Users\[WINDOWS USERNAME]\Documents\Arma 3 - Other Profiles\[ARMA PROFILE NAME]\missions`

3. Copy the `SierraKomodo` folder into a `SierraKomodo` folder in your mission folder.

4. Copy the contents of the `addActions.sqf`, `Description.ext`, `initPlayerLocal.sqf`, `initServer.sqf`, and `onPlayerRespawn.sqf` files to the existing files in your mission folder. If any of the files don't already exist, feel free to copy the entire file over, or create new files with the names. File names are case-sensitive. Your folder and file structure should look like this:

```
SierraKomodo\global_behaviour\sk_darkness_start.sqf
SierraKomodo\global_behaviour\sk_darkness_stop.sqf
addActions.sqf
Description.ext
initPlayerLocal.sqf
initServer.sqf
onPlayerRespawn.sqf
```

5. Open `initServer.sqf` and edit the variables defined in the `CONFIGURATION OPTIONS` section. See the `Configuration` section below for more information on this step.


## Usage

When in game, any curators will have a scroll wheel menu option to `Set Global Safe`. Running this action will switch all members of `east` and `resistance` to `SAFE`, and ensure any future placed units are automatically switched to `SAFE`. Once the action has run, the option will change to `Set Global Aware`, which will switch forces back to `AWARE` state.

Any units that have a combat behaviour state defined in `sk_global_behaviour_blacklist` will not be updated by this action.


## Configuration

The script's functions can be configured by editing the variables defined in the `CONFIGURATION OPTIONS` section of the `initServer.sqf` file.

### General Settings

**`sk_global_behaviour_blacklist`**\
`array of strings` (Combat Behaviour options), default `"CARELESS", "COMBAT", "STEALTH"`.\
Defines a list of combat behaviours that will not be changed by the script. It's recommended to, at minimum, have `COMBAT` defined here as combat states have special internal behaviour and will probably be overridden almost immediately by ArmA if changed.


## Integration

This script's functions can be integrated into other scripts or triggers in the 3den Editor.

### Checking the current global combat behaviour
**Variables `sk_global_behaviour_[west|east|resistance]`**\
*`string` ([Combat Behaviour](https://community.bistudio.com/wiki/setCombatBehaviour))*

These variables store the current global combat behaviour for each side, and can be checked by scripts or triggers. If you wish to change the default behaviour of new units without updating all existing units, you can do so by changing these variables.

### Updating all units of a given side
**Function `SK_fnc_globalBehaviourSetGlobal`**\
**Parameters:**
- `_side` *[`side`](https://community.bistudio.com/wiki/side)* - The side to have their global combat behaviour updated.
- `_behaviour` *`string` ([Combat Behaviour](https://community.bistudio.com/wiki/setCombatBehaviour))* - The global combat behaviour to set.

Call this function to globally update all units to the given combat behaviour. This function obeys `sk_global_behaviour_blacklist` and also updates the `sk_global_behaviour_[west|east|resistance]` variable for the given side.

### Updating a single group
**Function `SK_fnc_globalBehaviourSetGroup`**\
**Parameters:**
- `_group` *[`group`](https://community.bistudio.com/wiki/group)* - The group to change the combat behaviour of.
- `_behaviour` *`string` ([Combat Behaviour](https://community.bistudio.com/wiki/setCombatBehaviour))* - The combat behaviour to set.

Call this function to update a specific group's combat behaviour. This function obeys `sk_global_behaviour_blacklist`, but does not update the global behaviour variables.

Use this instead of the default `setCombatBehaviour` or `setBehaviourStrong` if you wish to obey the blacklist setting.

### Scroll wheel menu integration
By default, this script provides two scroll wheel menu items that update both `east` and `resistance` to either `AWARE` or `SAFE`. These can be modified to update other sides by editing the existing entries in `addActions.sqf` to call the `SK_fnc_globalBehaviourSetGlobal` function on the desired sides.

Additional actions can be added by editing the `addActions.sqf` file to add new `player addAction []` calls, following the template provided by the existing entries.
