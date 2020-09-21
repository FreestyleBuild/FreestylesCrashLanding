[
    "FSCL_damageTreshold", // variable name for setting
    "SLIDER", // setting type
    "Hull damage aircraft can receive (in %)", // displayed name
    ["Freestyle's Crash Landing"], // category
    [0, 99, 99, 0], // data for setting type
    1 // "_isGlobal" flag
] call CBA_fnc_addSetting;

[
    "FSCL_stateThreshold", // variable name for setting
    "SLIDER", // setting type
    "Excess damage aircraft can withstand", // displayed name
    ["Freestyle's Crash Landing"], // category
    [1, 100, 10, 0], // data for setting type
    1 // "_isGlobal" flag
] call CBA_fnc_addSetting;

[
    "FSCL_captiveSystem", // variable name for setting
    "CHECKBOX", // setting type
    "Captive System and AI-Anti-Bailing", // displayed name
    ["Freestyle's Crash Landing"], // category
    [true], // data for setting type
    1, // "_isGlobal" flag
	{},
	true
] call CBA_fnc_addSetting;