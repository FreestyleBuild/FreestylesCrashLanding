#include "script_component.hpp"

/*
 * Author: Freestyle_Build
 * Creates effects for crashing aircrafts
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * NONE
 *
 * Example:
 * [_aircraft] call EFUNC(main,effects);
 *
 */

params ["_aircraft"];

if (isNull _aircraft || {!alive _aircraft}) exitWith {};

private _light = "#lightpoint" createVehicleLocal [0,0,0];
private _smoke = "#particlesource" createVehicleLocal [0,0,0];
private _fire = "#particlesource" createVehicleLocal [0,0,0];

private _effects = [_light, _smoke, _fire];

if (_aircraft isKindOf "Helicopter" && {"tail rotor" in (selectionNames _aircraft)}) then {

	private _lightTail = "#lightpoint" createVehicleLocal [0,0,0];
	private _smokeTail = "#particlesource" createVehicleLocal [0,0,0];
	private _fireTail = "#particlesource" createVehicleLocal [0,0,0];

	_effects append [_lightTail, _smokeTail, _fireTail];

	_light lightAttachObject [_aircraft, _aircraft selectionPosition "main rotor"];

	_light setLightBrightness 5;
	_light setLightColor [0.9,0.4,0];
	_light setLightUseFlare true;
	_light setLightFlareSize 10;
	_light setLightDayLight true;
	_light setLightFlareMaxDistance 100;

	_lightTail lightAttachObject [_aircraft, _aircraft selectionPosition "tail rotor"];

	_lightTail setLightBrightness 3;
	_lightTail setLightColor [0.9,0.4,0];
	_lightTail setLightUseFlare true;
	_lightTail setLightFlareSize 7;
	_lightTail setLightDayLight true;
	_lightTail setLightFlareMaxDistance 70;

	_fire attachTo [_aircraft, _aircraft selectionPosition "main rotor"];

	_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _aircraft selectionPosition "main rotor", [0,0,0], 0, 8,7.84, 0, [2,1], [[1,1,1,1], [1,1,1,1]], [1,1], 0, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_fire setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fire setDropInterval 0.03;

	_fireTail attachTo [_aircraft, _aircraft selectionPosition "tail rotor"];

	_fireTail setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _aircraft selectionPosition "tail rotor", [0,0,0], 0, 8,7.84, 0, [1,0.5], [[1,1,1,1], [1,1,1,1]], [1,1], 0, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_fireTail setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fireTail setDropInterval 0.03;

	_smoke attachTo [_aircraft, _aircraft selectionPosition "main rotor"];

	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_aircraft selectionPosition "main rotor") vectorAdd [0,0,1], [0,0,0], 0, 8,7.84, 0, [5,7], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_smoke setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smoke setDropInterval 0.1;

	_smokeTail attachTo [_aircraft, _aircraft selectionPosition "tail rotor"];

	_smokeTail setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_aircraft selectionPosition "tail rotor") vectorAdd [0,0,0.7], [0,0,0], 0, 8,7.84, 0, [3,5], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_smokeTail setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smokeTail setDropInterval 0.1;

} else {

	_light lightAttachObject [_aircraft, _aircraft selectionPosition "engine"];

	_light setLightBrightness 5;
	_light setLightColor [0.9,0.4,0];
	_light setLightUseFlare true;
	_light setLightFlareSize 10;
	_light setLightDayLight true;
	_light setLightFlareMaxDistance 100;

	_fire attachTo [_aircraft, _aircraft selectionPosition "engine"];

	_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _aircraft selectionPosition "engine", [0,0,0], 0, 8,7.84, 0, [2,1], [[1,1,1,1], [1,1,1,1]], [1,1], 0, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_fire setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fire setDropInterval 0.03;

	_smoke attachTo [_aircraft, _aircraft selectionPosition "engine"];

	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_aircraft selectionPosition "engine") vectorAdd [0,0,1], [0,0,0], 0, 8,7.84, 0, [5,7], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _aircraft, 0, false, -1.0, [[1,1,1,1], [1,1,1,1]]];
	_smoke setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smoke setDropInterval 0.1;
};

[{
	params ["_aircraft"];

	private _reset = _aircraft getVariable [QGVARMAIN(effects), false];

	isNull _aircraft || {!alive _aircraft || {(getPos _aircraft #2) > 3 || {!_reset}}}

}, {

	params ["", "_effects"];

	[{
		params ["_effects"];

		{
			deleteVehicle _x;
		} forEach _effects;

	}, _effects, 10] call CBA_fnc_waitAndExecute;

}, [_aircraft, _effects]] call CBA_fnc_waitUntilAndExecute;
