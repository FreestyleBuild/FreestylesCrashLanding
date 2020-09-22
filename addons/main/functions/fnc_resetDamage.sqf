#include "script_component.hpp"

/*
 * Author: Freestyle_Build
 * Reset aircrafts state to default once it is repaired
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] call EFUNC(main,resetDamage);
 *
 */

params ["_aircraft"];

[{
	params ["_aircraft", "_oldDamage"];

	damage _aircraft < _oldDamage

}, {

	params ["_aircraft"];

	if (isNull _aircraft || {!alive _aircraft}) exitWith {};

	if (GVARMAIN(captiveSystem)) then {
		[_aircraft, QGVARMAIN(state), 0] call CBA_fnc_setVarNet;
		[_aircraft, QGVARMAIN(effects), false] call CBA_fnc_setVarNet;

		private _value = _aircraft getVariable [QGVARMAIN(captiveState), false];
		_aircraft setCaptive _value;

		{
			private _value = _x getVariable [QGVARMAIN(captiveState), false];
			_x setCaptive _value;
		} forEach (crew _aircraft);
	};

}, [_aircraft, damage _aircraft]] call CBA_fnc_waitUntilAndExecute;
