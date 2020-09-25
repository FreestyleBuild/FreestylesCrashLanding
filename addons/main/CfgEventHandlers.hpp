class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_initPost_EventHandlers {
    class Air {
        class FSCL {
            init = QUOTE([_this select 0] call FUNC(setup));
            exclude[] = {QUOTE(ParachuteBase), QUOTE(UAV), QUOTE(UAV_01_base_F)};
        };
    };
};
