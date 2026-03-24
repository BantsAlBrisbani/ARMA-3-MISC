
if (!hasInterface) exitWith {};

private _registry = missionNamespace getVariable ["TAG_handsetConnections", []];
private _visuals = missionNamespace getVariable ["TAG_handsetVisuals", []];

private _toRemove = [];
{
    _x params ["_connectionId", "_handset", "_rope"];
    private _entryIndex = _registry findIf {(_x select 0) isEqualTo _connectionId};
    if (_entryIndex < 0) then {
        _toRemove pushBack _connectionId;
    } else {
        private _entry = _registry select _entryIndex;
        _entry params ["_id", "_owner", "_borrower"];
        if (isNull _owner || {isNull _borrower} || {!alive _owner} || {!alive _borrower} || {(_owner distance _borrower) > TAG_HANDSET_MAX_CABLE_DISTANCE + 0.5}) then {
            _toRemove pushBack _connectionId;
        };
    };
} forEach +_visuals;

{ [_x] call TAG_Handset_fnc_destroyCableVisualLocal; } forEach _toRemove;

{
    _x params ["_connectionId", "_owner", "_borrower"];
    if (!isNull _owner && {!isNull _borrower} && {alive _owner} && {alive _borrower} && {(_owner distance _borrower) <= TAG_HANDSET_MAX_CABLE_DISTANCE + 0.5}) then {
        if ((_visuals findIf {(_x select 0) isEqualTo _connectionId}) < 0) then {
            [_connectionId, _owner, _borrower] call TAG_Handset_fnc_createCableVisualLocal;
        };
    };
} forEach _registry;
