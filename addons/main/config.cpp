#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        author = "Freestyle_Build";
        units[] = {};
        weapons[] = {};
        requiredVersion = 2.00;
        requiredAddons[] = {"cba_main"};
    };
};

class CfgMods {
    class PREFIX {
        dir = "@Freestyles Crash Landing";
        name = "Freestyles Crash Landing";
        picture = "";
        hidePicture = "true";
        hideName = "true";
        actionName = "";
        action = "";
        description = "";
    };
};

#include "CfgEventHandlers.hpp"
