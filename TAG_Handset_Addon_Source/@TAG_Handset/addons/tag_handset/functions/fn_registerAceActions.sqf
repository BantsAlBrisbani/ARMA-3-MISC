
if (!hasInterface) exitWith {};
if (isNil "ace_interact_menu_fnc_createAction") exitWith {};
private _borrowRoot = [
    "TAG_RadioHandsetRoot",
    "Radio Handset",
    "",
    {},
    {
        params ["_target", "_player", "_params"];
        [_target, _player] call TAG_Handset_fnc_canBorrowHandset
    },
    {
        params ["_target", "_player", "_params"];
        [_target, _player, _params] call TAG_Handset_fnc_buildBorrowChildren
    }
] call ace_interact_menu_fnc_createAction;

["CAManBase", 0, ["ACE_MainActions"], _borrowRoot, true] call ace_interact_menu_fnc_addActionToClass;

private _releaseAction = [
    "TAG_ReleaseRadioHandset",
    "Release Borrowed Handset",
    "",
    { [] call TAG_Handset_fnc_releaseHandset; },
    { player getVariable ["TAG_handsetActive", false] }
] call ace_interact_menu_fnc_createAction;

["CAManBase", 1, ["ACE_SelfActions"], _releaseAction, true] call ace_interact_menu_fnc_addActionToClass;
