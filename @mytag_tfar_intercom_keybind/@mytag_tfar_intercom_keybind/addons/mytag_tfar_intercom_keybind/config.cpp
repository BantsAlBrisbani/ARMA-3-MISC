class CfgPatches {
    class mytag_tfar_intercom_keybind {
        name = "TFAR INTERCOM HOTKEY";
        author = "Bants Al Brisbani";
        requiredVersion = 2.10;
        requiredAddons[] = {
            "cba_main",
            "cba_keybinding",
            "tfar_core"
        };
        units[] = {};
        weapons[] = {};
    };
};

class Extended_PostInit_EventHandlers {
    class mytag_tfar_intercom_keybind {
        init = "call compile preprocessFileLineNumbers '\x\mytag_tfar_intercom_keybind\addons\mytag_tfar_intercom_keybind\XEH_postInit.sqf'";
    };
};
