if (!hasInterface) exitWith {};

if (player getVariable ["TAG_handsetActive", false]) exitWith {
    ["Disconnected from handset.", true] call TAG_Handset_fnc_releaseHandset;
};

private _target = [] call TAG_Handset_fnc_findNearestHandsetTarget;
if (isNull _target) exitWith {};

private _radios = [_target] call TAG_Handset_fnc_getBorrowableLrRadios;
if (_radios isEqualTo []) exitWith {};

[_target, player, _radios select 0] call TAG_Handset_fnc_borrowHandset;