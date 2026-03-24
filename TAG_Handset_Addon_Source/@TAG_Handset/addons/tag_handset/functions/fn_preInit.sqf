
if (isServer) then {
    if (isNil {missionNamespace getVariable "TAG_handsetConnections"}) then {
        missionNamespace setVariable ["TAG_handsetConnections", [], true];
    };
};
