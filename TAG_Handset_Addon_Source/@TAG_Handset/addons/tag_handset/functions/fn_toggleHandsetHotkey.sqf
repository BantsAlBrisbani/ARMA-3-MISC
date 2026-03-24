
if (!hasInterface) exitWith {};
if (player getVariable ["TAG_handsetActive", false]) exitWith {
    [] call TAG_Handset_fnc_releaseHandset;
};
private _target = [] call TAG_Handset_fnc_findNearestHandsetTarget;
if (isNull _target) exitWith { hint "No nearby player with a borrowable LR backpack radio."; };
private _radios = [_target] call TAG_Handset_fnc_getBorrowableLrRadios;
if (_radios isEqualTo []) exitWith { hint "No borrowable LR radio found."; };
[_target, player, _radios select 0] call TAG_Handset_fnc_borrowHandset;
