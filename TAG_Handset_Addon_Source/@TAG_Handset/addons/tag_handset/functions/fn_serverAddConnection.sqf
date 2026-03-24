
if (!isServer) exitWith {};
params ["_connectionId", "_owner", "_borrower"];
if (_connectionId isEqualTo "") exitWith {};
if (isNull _owner || {isNull _borrower}) exitWith {};
if (!alive _owner || {!alive _borrower}) exitWith {};

private _registry = + (missionNamespace getVariable ["TAG_handsetConnections", []]);
private _removeIdxs = [];
{
    _x params ["_id", "_existingOwner", "_existingBorrower"];
    if (_existingOwner isEqualTo _owner || {_existingBorrower isEqualTo _borrower}) then {
        _removeIdxs pushBack _forEachIndex;
    };
} forEach _registry;

reverse _removeIdxs;
{ _registry deleteAt _x; } forEach _removeIdxs;

_owner setVariable ["TAG_handsetBorrower", _borrower, true];
_registry pushBack [_connectionId, _owner, _borrower];
missionNamespace setVariable ["TAG_handsetConnections", _registry, true];
