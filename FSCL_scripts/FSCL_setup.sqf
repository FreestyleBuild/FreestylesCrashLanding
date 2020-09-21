/*
Setup new aircrafts upon initialization.

Parameters:
	_veh,  object, aircrat to setup
*/

params ["_veh"];


//initialize state and effects variables
_veh setVariable ["FSCL_state", 0, true];
_veh setVariable ["FSCL_effects", false, true];



_veh addEventHandler ["HandleDamage", { 
	 private _val = _this call FSCL_fnc_handleCrashDamage;
	_val;
}];		//add the handleDamage event handler