
class CfgPatches {
    class TAG_Handset {
        name = "TAG Handset";
        author = "OpenAI";
        requiredVersion = 2.10;
        requiredAddons[] = {"cba_main","ace_interact_menu"};
        units[] = {};
        weapons[] = {};
    };
};

class Extended_PreInit_EventHandlers {
    class TAG_Handset {
        init = "call compile preprocessFileLineNumbers '\tag_handset\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class TAG_Handset {
        init = "call compile preprocessFileLineNumbers '\tag_handset\XEH_postInit.sqf'";
    };
};

class CfgFunctions {
    class TAG_Handset {
        tag = "TAG_Handset";
        class Main {
            file = "\tag_handset\functions";
            class constants {};
            class preInit {};
            class postInit {};
            class getBorrowableLrRadios {};
            class canBorrowHandset {};
            class findNearestHandsetTarget {};
            class toggleHandsetHotkey {};
            class borrowHandset {};
            class releaseHandset {};
            class handsetWatchdog {};
            class registerKeybinds {};
            class registerAceActions {};
            class buildBorrowChildren {};
            class getCableAnchor {};
            class createCableVisualLocal {};
            class destroyCableVisualLocal {};
            class syncCableVisualsLocal {};
            class serverAddConnection {};
            class serverRemoveConnection {};
        };
    };
};
