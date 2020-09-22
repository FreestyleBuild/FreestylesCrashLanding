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
            init = QUOTE(call FUNC(setup));
            exclude[] = {QUOTE(ParachuteBase)};
        };
    };
};
