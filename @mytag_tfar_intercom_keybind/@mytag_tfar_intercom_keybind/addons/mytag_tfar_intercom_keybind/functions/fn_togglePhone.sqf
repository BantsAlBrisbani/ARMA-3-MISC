if (!hasInterface) exitWith {};
if (!alive player) exitWith {};

if (vehicle player != player) exitWith {
    [parseText "You must be on foot to use the external intercom phone.", 3] call TFAR_fnc_showHint;
};

private _currentVehicle = player getVariable ["TFAR_ExternalIntercomVehicle", objNull];

if (!isNull _currentVehicle) exitWith {
    [_currentVehicle, player] call TFAR_external_intercom_fnc_disconnect;
};

private _searchRadius = 25;
private _candidates = nearestObjects [player, ["LandVehicle", "Air", "Ship"], _searchRadius];

private _target = objNull;
private _bestDistance = 1e9;

{
    private _veh = _x;

    if (!alive _veh) then { continue };

    private _hasIntercom = [typeOf _veh, "TFAR_hasIntercom", 0] call TFAR_fnc_getVehicleConfigProperty;
    if (_hasIntercom isEqualTo 0) then { continue };

    private _interactionPointRelative = [_veh] call TFAR_external_intercom_fnc_getInteractionPoint;
    private _interactionPointWorld = _veh modelToWorld _interactionPointRelative;

    private _maxRange = _veh getVariable [
        "TFAR_externalIntercomMaxRange_Phone",
        TFAR_externalIntercomMaxRange_Phone
    ];

    private _dist = player distance _interactionPointWorld;
    if (_dist > _maxRange) then { continue };

    private _speakers = _veh getVariable ["TFAR_ExternalIntercomSpeakers", [objNull, []]];
    private _phoneUser = _speakers param [0, objNull];
    if (!isNull _phoneUser) then { continue };

    if (_dist < _bestDistance) then {
        _bestDistance = _dist;
        _target = _veh;
    };
} forEach _candidates;

if (isNull _target) exitWith {
    [parseText "No available external intercom phone nearby.", 3] call TFAR_fnc_showHint;
};

[_target, player, [false]] call TFAR_external_intercom_fnc_connect;
