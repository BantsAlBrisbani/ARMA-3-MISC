
if (!isServer) exitWith {};
params ["_connectionId", ["_borrower", objNull]];

private _registry = + (missionNamespace getVariable ["TAG_handsetConnections", []]);
private _idx = _registry findIf {
    private _matchId = ((_x select 0) isEqualTo _connectionId);
    private _matchBorrower = isNull _borrower || {(_x select 2) isEqualTo _borrower};
    _matchId && _matchBorrower
};

if (_idx > -1) then {
    private _entry = _registry select _idx;
    _entry params ["_id", "_owner", "_existingBorrower"];
    if (!isNull _owner) then { _owner setVariable ["TAG_handsetBorrower", nil, true]; };
    _registry deleteAt _idx;
};

private _pruned = [];
{
    _x params ["_id", "_owner", "_borrower2"];
    if (!isNull _owner && {!isNull _borrower2} && {alive _owner} && {alive _borrower2}) then {
        _pruned pushBack _x;
    } else {
        if (!isNull _owner) then { _owner setVariable ["TAG_handsetBorrower", nil, true]; };
    };
} forEach _registry;

missionNamespace setVariable ["TAG_handsetConnections", _pruned, true];
