/*
Creates effects for crashing aircrafts

Parameters:
	_veh, object, crashing aircraft
*/


params ["_veh"];

private _light = "#lightpoint" createVehicleLocal [0,0,0];
private _smoke = "#particlesource" createVehicleLocal [0,0,0];
private _fire = "#particlesource" createVehicleLocal [0,0,0];

private _objs = [_light, _smoke, _fire];

_r = 255;
_b = 255;
_g = 255;
_a = 100;

private _color = [_r / 255, _g / 255, _b / 255, _a / 100];


_r = 255;
_b = 255;
_g = 255;
_a = 100;

private _color2 = [_r / 255, _g / 255, _b / 255, _a / 100];

if(_veh isKindOf "Helicopter" and ("tail rotor" in (selectionNames _veh))) then
{
	private _lightTail = "#lightpoint" createVehicleLocal [0,0,0];
	private _smokeTail = "#particlesource" createVehicleLocal [0,0,0];
	private _fireTail = "#particlesource" createVehicleLocal [0,0,0];
	
	_objs append [_lightTail, _smokeTail, _fireTail];
	
	_light lightAttachObject [_veh, _veh selectionPosition "main rotor"];
	_lightTail lightAttachObject [_veh, _veh selectionPosition "tail rotor"];
	
	_light setLightBrightness 5;
	_light setLightColor [0.9,0.4,0];
	_light setLightUseFlare true;
	_light setLightFlareSize 10;
	_light setLightDayLight true;
	_light setLightFlareMaxDistance 100;
	
	_lightTail setLightBrightness 3;
	_lightTail setLightColor [0.9,0.4,0];
	_lightTail setLightUseFlare true;
	_lightTail setLightFlareSize 7;
	_lightTail setLightDayLight true;
	_lightTail setLightFlareMaxDistance 70;
	
	_fire attachTo [_veh, _veh selectionPosition "main rotor"];
	_fireTail attachTo [_veh, _veh selectionPosition "tail rotor"];
	
	
	_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _veh selectionPosition "main rotor", [0,0,0], 0, 8,7.84, 0, [2,1], [_color ,_color2 ], [1,1], 0, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_fire setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fire setDropInterval 0.03;
	
	_fireTail setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _veh selectionPosition "tail rotor", [0,0,0], 0, 8,7.84, 0, [1,0.5], [_color ,_color2 ], [1,1], 0, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_fireTail setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fireTail setDropInterval 0.03;
	
	
	
	_smoke attachTo [_veh, _veh selectionPosition "main rotor"];
	_smokeTail attachTo [_veh, _veh selectionPosition "tail rotor"];
	
	
	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_veh selectionPosition "main rotor") vectorAdd [0,0,1], [0,0,0], 0, 8,7.84, 0, [5,7], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_smoke setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smoke setDropInterval 0.1;
	
	_smokeTail setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_veh selectionPosition "tail rotor") vectorAdd [0,0,0.7], [0,0,0], 0, 8,7.84, 0, [3,5], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_smokeTail setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smokeTail setDropInterval 0.1;

}
else
{
	_light lightAttachObject [_veh, _veh selectionPosition "engine"];
	
	_light setLightBrightness 5;
	_light setLightColor [0.9,0.4,0];
	_light setLightUseFlare true;
	_light setLightFlareSize 10;
	_light setLightDayLight true;
	_light setLightFlareMaxDistance 100;

	
	_fire attachTo [_veh, _veh selectionPosition "engine"];
	
	_fire setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal.p3d",16,10,32,1], "", "Billboard", 1, 2, _veh selectionPosition "engine", [0,0,0], 0, 8,7.84, 0, [2,1], [_color ,_color2 ], [1,1], 0, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_fire setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_fire setDropInterval 0.03;
	

	_smoke attachTo [_veh, _veh selectionPosition "engine"];
		
	_smoke setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal_02.p3d",8,0,40,1], "", "Billboard", 1, 5, (_veh selectionPosition "engine") vectorAdd [0,0,1], [0,0,0], 0, 8,7.84, 0, [5,7], [[0.4,0.4,0.4,1],[0.4,0.4,0.4,0.3]], [1,1], 1, 0.5, "", "", _veh, 0, false, -1.0, [_color ,_color2]];
	_smoke setParticleRandom [0, [0.1, 0.1, 0.1], [0, 0, 0], 1, 0.2, [0, 0, 0, 0], 0, 0, 2 * pi];
	_smoke setDropInterval 0.1;

};


waitUntil {!(alive _veh)  or !(((getPos _veh) # 2) > 2) or !(_veh getVariable ["FSCL_effects", false])};

sleep 10;

{deleteVehicle _x;} forEach _objs;
