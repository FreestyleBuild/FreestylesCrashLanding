#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = "Freestyle_Build";
        units[] = {};
        weapons[] = {};
        requiredVersion = 1.98;
        requiredAddons[] = {"cba_main"};
    };
};

class CfgMods {
    class PREFIX {
        dir = "@Freestyle\'s Crash Landing";
        name = "Freestyle\'s Crash Landing";
        picture = "";
        hidePicture = "true";
        hideName = "true";
        actionName = "";
        action = "";
        description = "";
    };
};

#include "CfgEventHandlers.hpp"
