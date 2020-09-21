/*
Reset aircrafts state to default once it is repaired

Parameters:
	_veh, object, aircraft to reset
*/

params ["_veh"];

private _dam = damage _veh;

waitUntil{(damage _veh) < _dam};

//reset all effects upon vehicle being repaired
if(FSCL_captiveSystem) then
{
	{_x setCaptive (_x getVariable ["FSCL_captiveState", false]);} forEach (crew _veh);
	_veh setCaptive (_veh getVariable ["FSCL_captiveState", false]);
};
	
_veh setVariable ["FSCL_effects", false, true];
_veh setVariable ["FSCL_state", 0, true];
