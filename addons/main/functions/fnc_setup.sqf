#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Setup new aircrafts upon initialization
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] call EFUNC(main,setup);
 *
 */

params ["_aircraft"];

[_aircraft, QGVARMAIN(state), 0] call CBA_fnc_setVarNet;
[_aircraft, QGVARMAIN(effects), false] call CBA_fnc_setVarNet;

_aircraft addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
