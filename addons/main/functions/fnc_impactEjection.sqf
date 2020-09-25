#include "..\script_component.hpp"

/*
 * Author: Freestyle_Build
 * Eject passengers of the aircraft, if certain conditions are met.
 *
 * Arguments:
 * 0: Aircraft <OBJECT>
 *
 * Return Value:
 * <NONE>
 *
 * Example:
 * _aircraft call FUNC(impactEjection);
*/

params ["_aircraft"];

private _gThreshold = GVARMAIN(gForceThreshold); 
private _ejectProp = GVARMAIN(ejectionProp);

private _timeStep = 0.1;

private _prevVel = velocity _aircraft;

while {(alive _aircraft) and (_aircraft getVariable [QGVARMAIN(effects), false])} do 
{
	sleep _timeStep;
	
	if(((getPos _aircraft) # 2) <= 2) then
	{
		private _gForce = (vectorMagnitude (_prevVel vectorDiff (velocity _aircraft))) / _timeStep / 9.81;
		
		
		if(GVARMAIN(debug)) then
		{
			hint str(_gForce);
		};
		
		if(_gForce >= _gThreshold) then
		{
			{
				if((random 100) <= _ejectProp) then 
				{
					moveOut _x;
					
					_x setVelocity ((velocity _aircraft) vectorAdd ((getPosAsl _aircraft) vectorFromTo (getPosAsl _x))) vectorMultiply 2;
					
					_null =_x spawn {
										if((lifeState _this) != "INCAPACITATED") then
										{
											_this setUnconscious true; 
											sleep 2; 
											_this setUnconscious false;
										};
									};
				};
			} forEach (crew _aircraft);
		};
	};
};