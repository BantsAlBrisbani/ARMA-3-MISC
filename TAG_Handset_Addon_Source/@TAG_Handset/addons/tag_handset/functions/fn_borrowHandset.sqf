params ["_owner", "_user", "_radioData"];

if (!hasInterface) exitWith {};
if (_user != player) exitWith {};
if (isNull _owner || {isNull _user}) exitWith {};
if (!alive _owner || {!alive _user}) exitWith {};
if ((_user distance _owner) > TAG_HANDSET_INTERACT_DISTANCE) exitWith {};
if (_radioData isEqualType [] && {_radioData isEqualTo []}) exitWith {};
if !([_owner, _user] call TAG_Handset_fnc_canBorrowHandset) exitWith {};

if (player getVariable ["TAG_handsetActive", false]) then {
    [] call TAG_Handset_fnc_releaseHandset;
};

private _connectionId = format ["HS_%1_%2_%3", netId _owner, netId _user, round (diag_tickTime * 1000)];

TFAR_OverrideActiveLRRadio = _radioData;
player setVariable ["TAG_handsetOwner", _owner];
player setVariable ["TAG_handsetRadioData", _radioData];
player setVariable ["TAG_handsetActive", true];
player setVariable ["TAG_handsetConnectionId", _connectionId];

[_connectionId, _owner, _user] remoteExecCall ["TAG_Handset_fnc_serverAddConnection", 2];

cutText [format ["Connected to %1's backpack radio.", name _owner], "PLAIN"];

if (isNil {player getVariable "TAG_handsetWatchdogHandle"}) then {
    player setVariable ["TAG_handsetWatchdogHandle", [] spawn TAG_Handset_fnc_handsetWatchdog];
};