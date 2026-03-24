if (!hasInterface) exitWith {};

waitUntil { !isNull player };

if (isNil { missionNamespace getVariable "TAG_handsetVisuals" }) then {
    missionNamespace setVariable ["TAG_handsetVisuals", []];
};

private _oldEh = missionNamespace getVariable ["TAG_handsetDraw3DEH", -1];
if (_oldEh >= 0) then {
    removeMissionEventHandler ["Draw3D", _oldEh];
};
missionNamespace setVariable ["TAG_handsetDraw3DEH", nil];

[] call TAG_Handset_fnc_registerKeybinds;
[] call TAG_Handset_fnc_registerAceActions;

"TAG_handsetConnections" addPublicVariableEventHandler {
    [] call TAG_Handset_fnc_syncCableVisualsLocal;
};

[] call TAG_Handset_fnc_syncCableVisualsLocal;

player addEventHandler ["Respawn", {
    [] call TAG_Handset_fnc_releaseHandset;
    [] spawn {
        uiSleep 1;
        [] call TAG_Handset_fnc_syncCableVisualsLocal;
    };
}];

[] spawn {
    while {true} do {
        uiSleep 2;
        [] call TAG_Handset_fnc_syncCableVisualsLocal;
    };
};