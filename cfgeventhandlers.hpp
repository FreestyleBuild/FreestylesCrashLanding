class Extended_InitPost_Eventhandlers
{
	class Helicopter
	{
		class FSCL_setupInit_helicopter
		{
			init = "[_this select 0] call FSCL_fnc_setup";
			exclude = "ParachuteBase";
		};
	};
	
	class Plane
	{
		class FSCL_setupInit_plane
		{
			init = "[_this select 0] call FSCL_fnc_setup";
		};
	};
};

class Extended_PreInit_EventHandlers {
    class FSCL_ininitalize_settings {
        init = "call compile preprocessFileLineNumbers 'FreestylesCrashLanding\FSCL_scripts\FSCL_settings.sqf'";
    };
};