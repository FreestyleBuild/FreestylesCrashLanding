[
    QGVARMAIN(damageTreshold),
    "SLIDER",
    ["Hull damage cap in %", "Hull damage aircraft can receive (in %)"],
    ["Freestyle's Crash Landing"],
    [0, 99, 99, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVARMAIN(stateThreshold),
    "SLIDER",
    ["Excess damage cap", "Excess damage aircraft can withstand"],
    ["Freestyle's Crash Landing"],
    [1, 100, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVARMAIN(captiveSystem),
    "CHECKBOX",
    ["Captive System and AI-Anti-Bailing", "Prevent enemies from shooting crashing aircraft, preevent AI passangers from ejecting mid-air"],
    ["Freestyle's Crash Landing"],
    [true],
    1
] call CBA_fnc_addSetting;
