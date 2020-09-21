/*
Handle the crashes of air vehicles using the handle damage eventhandler, returns new damage depending on state of the vehcile.

Parameters:
	Handle Damage Event Handler
*/


params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];


private _state = _unit getVariable ["FSCL_state", 0];
private _eff = _unit getVariable ["FSCL_effects", false];
private _damageThreshold = FSCL_damageTreshold / 100;
private _stateThreshold = FSCL_stateThreshold;
private _result = 0;


if(_state < _stateThreshold) then
{

	if(_selection == "") then
	{
		if(_damage > _damageThreshold) then
		{
			_unit setVariable ["FSCL_state", _state + _damage - (_unit getHit ""), true];
				
			if(not _eff) then 
			{
				[_unit] remoteExec ["FSCL_fnc_effects", 0, true];
				_unit setVariable ["FSCL_effects", true, true];
				_null = _unit spawn FSCL_fnc_resetDamage;
				if(FSCL_captiveSystem) then {_null2 = _unit spawn FSCL_fnc_activateCaptive;};
			};
			
			_result = _damageThreshold;
		}
		else
		{
			_result = _damage;
		};
	}
	else
	{
		_result = _damage;
	};
}
else
{
	_result = _damage;
};

_result;