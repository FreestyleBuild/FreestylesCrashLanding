#define MAINPREFIX x
#define PREFIX fscl

#include "script_version.hpp"

#define VERSION MAJOR.MINOR.PATCH
#define BETA ##VERSION##-##beta
#define RC ##VERSION##-##RC

#define REQUIRED_VERSION 2.00
#define COMPONENT_NAME QUOTE(FSCL - COMPONENT)

#include "\x\cba\addons\main\script_macros_common.hpp"

#undef PREP
#define PREP(fncName) [QPATHTOF(functions\DOUBLES(fnc,fncName).sqf), QFUNC(fncName)] call CBA_fnc_compileFunction
