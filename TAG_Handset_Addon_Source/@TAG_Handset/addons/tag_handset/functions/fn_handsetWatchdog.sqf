
while {true} do {
    uiSleep TAG_HANDSET_SYNC_INTERVAL;
    private _active = player getVariable ["TAG_handsetActive", false];
    if (!_active) exitWith {};

    private _owner = player getVariable ["TAG_handsetOwner", objNull];
    private _radioData = player getVariable ["TAG_handsetRadioData", []];

    if (isNull _owner) exitWith { [] call TAG_Handset_fnc_releaseHandset; };
    if (!alive player || {!alive _owner}) exitWith { [] call TAG_Handset_fnc_releaseHandset; };
    if ((player distance _owner) > TAG_HANDSET_MAX_CABLE_DISTANCE) exitWith { [] call TAG_Handset_fnc_releaseHandset; };
    if (vehicle player != player) exitWith { [] call TAG_Handset_fnc_releaseHandset; };
    if (vehicle _owner != _owner) exitWith { [] call TAG_Handset_fnc_releaseHandset; };

    private _currentRadios = [_owner] call TAG_Handset_fnc_getBorrowableLrRadios;
    private _stillExists = _currentRadios findIf {_x isEqualTo _radioData} > -1;
    if (!_stillExists) exitWith { [] call TAG_Handset_fnc_releaseHandset; };

    if (isNil "TFAR_OverrideActiveLRRadio") then {
        TFAR_OverrideActiveLRRadio = _radioData;
    };
};
player setVariable ["TAG_handsetWatchdogHandle", nil];
