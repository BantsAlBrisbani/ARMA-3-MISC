
params ["_connectionId"];
if (!hasInterface) exitWith {};
if (_connectionId isEqualTo "") exitWith {};

private _visuals = missionNamespace getVariable ["TAG_handsetVisuals", []];
private _idx = _visuals findIf {(_x select 0) isEqualTo _connectionId};

if (_idx > -1) then {
    private _entry = _visuals select _idx;
    _entry params ["_id", "_handset", "_rope"];
    if (!isNull _handset) then { deleteVehicle _handset; };
    if (!isNil "_rope") then { ropeDestroy _rope; };
    _visuals deleteAt _idx;
    missionNamespace setVariable ["TAG_handsetVisuals", _visuals];
};
