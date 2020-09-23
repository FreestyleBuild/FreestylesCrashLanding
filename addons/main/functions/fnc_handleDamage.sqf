#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Handle the crashes of air vehicles using the handle damage eventhandler, returns new damage depending on state of the vehicle.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 * 1: Hit Selection <STRING>
 * 2: Damage <SCALAR>
 *
 * Return Value:
 * 0: Damage <SCALAR>
 *
 * Example:
 * _aircraft addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
 *
 */

params ["_aircraft", "_selection", "_damage"];

private _stateThreshold = GVARMAIN(stateThreshold);
private _state = _aircraft getVariable [QGVARMAIN(state), 0];

if (_stateThreshold > _state) then {

	if (_selection isEqualTo "") then {

		private _damageThreshold = GVARMAIN(damageTreshold) / 100;

		if (_damage > _damageThreshold) then {

			private _newState = _state + _damage - (_aircraft getHit "");
                        [_aircraft, QGVARMAIN(state), _newState] call CBA_fnc_setVarNet;

			if !(_aircraft getVariable [QGVARMAIN(effects), false]) then {

				[_aircraft] remoteExecCall [QFUNC(effects), 0, true];
				[_aircraft, QGVARMAIN(effects), true] call CBA_fnc_setVarNet;

				[_aircraft] remoteExec [QFUNC(resetDamage), 2];

				if (GVARMAIN(captiveSystem)) then {
					[_aircraft] remoteExec [QFUNC(setCaptive), 2];
				};
			};

			_damageThreshold

		} else {
			_damage
		};

	} else {
		_damage
	};

} else {
	_damage
};

_damage
