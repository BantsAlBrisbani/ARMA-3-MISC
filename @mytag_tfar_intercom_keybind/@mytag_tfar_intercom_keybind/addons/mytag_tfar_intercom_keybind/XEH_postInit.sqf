#include "\a3\ui_f\hpp\defineDIKCodes.inc"

if (!hasInterface) exitWith {};

MYTAG_fnc_togglePhone = compile preprocessFileLineNumbers "\x\mytag_tfar_intercom_keybind\addons\mytag_tfar_intercom_keybind\functions\fn_togglePhone.sqf";

[
    ["MYTAG", "TFAR External Intercom"],
    "MYTAG_toggleExternalPhone",
    [
        "Toggle External Intercom Phone",
        "Pick up or put away the nearest TFAR external intercom phone"
    ],
    {
        [] call MYTAG_fnc_togglePhone;
        false
    },
    {},
    [DIK_H, [false, true, false]]
] call CBA_fnc_addKeybind;
