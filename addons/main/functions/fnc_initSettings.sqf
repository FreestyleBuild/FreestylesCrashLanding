[
    QGVARMAIN(damageTreshold),
    "SLIDER",
    "Hull damage aircraft can receive (in %)",
    ["Freestyle's Crash Landing"],
    [0, 99, 99, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVARMAIN(stateThreshold)
    "SLIDER",
    "Excess damage aircraft can withstand",
    ["Freestyle's Crash Landing"],
    [1, 100, 10, 0],
    true
] call CBA_fnc_addSetting;

[
    QGVARMAIN(captiveSystem)
    "CHECKBOX",
    "Captive System and AI-Anti-Bailing",
    ["Freestyle's Crash Landing"],
    [true],
    true,
    {},
    true
] call CBA_fnc_addSetting;
