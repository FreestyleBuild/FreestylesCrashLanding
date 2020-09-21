/*
Sets vehicle captive and prepares its crew to be reset once the is repaired/landed. Also forces AI to stay inside helicopters.

Parameters:
	_veh, object, aircraft to use
*/

params ["_veh"];

private _vehCrew = crew _veh;

{
	_x setVariable ["FSCL_captiveState", captive _x, true];		//save current captive state for the each crew
} forEach _vehCrew;

_veh setVariable ["FSCL_captiveState", captive _veh, true];		//save current captive state for the aircraft


private _temp = 0;

{
	_x setCaptive true;		//set each crew to captive
	
	_temp = _x addEventHandler ["GetOutMan", {
	
		params ["_unit", "_role", "_vehicle", "_turret"];
		
		
		
		//If helicopter landed remove captive state
		if((((getPos _vehicle) # 2) <= 2) or (isPlayer _unit) or (!(_vehicle isKindOf "Helicopter"))) then 
		{
			_unit setCaptive (_unit getVariable ["FSCL_captiveState", false]);		
		
			_unit removeEventHandler ["GetOutMan", _unit getVariable ["FSCL_captiveEventHandler", 0]];
		}
		else
		{
			if(_role == "gunner") then 
			{
				_unit moveInTurret [_vehicle, _turret];
			}
			else
			{
				if(_role == "driver") then
				{
					_unit moveInDriver _vehicle;
				}
				else
				{
					_unit moveInCargo _vehicle;
				};
			}
		};
		
		
	} ];		//add eventhandler reset captive state and allow disembarking
	
	_x setVariable ["FSCL_captiveEventHandler", _temp, true];
	
} forEach _vehCrew;

_veh setCaptive true;		//set aircraft captive

waitUntil{!(alive _veh)  or !(((getPos _veh) # 2) > 2)};

_veh setCaptive (_veh getVariable ["FSCL_captiveState", false]);		//reset captive state after vehicle has landed or is destroyed

{
	_x setCaptive (_x getVariable ["FSCL_captiveState", false]);	
} forEach _vehCrew;