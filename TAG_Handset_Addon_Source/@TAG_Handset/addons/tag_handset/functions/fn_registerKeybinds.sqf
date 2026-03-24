
if (!hasInterface) exitWith {};
if (isNil "CBA_fnc_addKeybind") exitWith {};
[
    "TAG Handset",
    "TAG_ToggleHandset",
    ["Toggle Radio Handset", "Borrow nearest valid backpack LR radio, or release current handset."],
    { [] call TAG_Handset_fnc_toggleHandsetHotkey; },
    {},
    [0, [false, false, false]]
] call CBA_fnc_addKeybind;
