
if (!hasInterface) exitWith {};
private _connectionId = player getVariable ["TAG_handsetConnectionId", ""];
if (_connectionId != "") then {
    [_connectionId, player] remoteExecCall ["TAG_Handset_fnc_serverRemoveConnection", 2];
};
TFAR_OverrideActiveLRRadio = nil;
player setVariable ["TAG_handsetOwner", nil];
player setVariable ["TAG_handsetRadioData", nil];
player setVariable ["TAG_handsetActive", false];
player setVariable ["TAG_handsetConnectionId", nil];
[] call TAG_Handset_fnc_syncCableVisualsLocal;
