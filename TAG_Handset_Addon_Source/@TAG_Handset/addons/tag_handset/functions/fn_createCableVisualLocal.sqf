
params ["_connectionId", "_owner", "_borrower"];
if (!hasInterface) exitWith {false};
if (_connectionId isEqualTo "") exitWith {false};
if (isNull _owner || {isNull _borrower}) exitWith {false};
if (!alive _owner || {!alive _borrower}) exitWith {false};

private _visuals = missionNamespace getVariable ["TAG_handsetVisuals", []];
if ((_visuals findIf {(_x select 0) isEqualTo _connectionId}) > -1) exitWith {true};

private _anchor = [_owner] call TAG_Handset_fnc_getCableAnchor;
private _handset = createSimpleObject [TAG_HANDSET_MODEL, ASLToAGL eyePos _borrower];
_handset attachTo [_borrower, [-0.14, -0.02, 0.02], "head", true];
_handset setVectorDirAndUp [[-2.5,0.8,0.25],[-1,-1,1]];

private _rope = ropeCreate [
    _owner,
    _anchor,
    _handset,
    "plug",
    TAG_HANDSET_MAX_CABLE_DISTANCE,
    ["", [0,0,-1]],
    ["", [0,0,-1]],
    TAG_HANDSET_ROPE_TYPE
];

_visuals pushBack [_connectionId, _handset, _rope];
missionNamespace setVariable ["TAG_handsetVisuals", _visuals];
true
