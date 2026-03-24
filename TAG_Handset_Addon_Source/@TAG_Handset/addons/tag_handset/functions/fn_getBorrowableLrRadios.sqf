
params ["_unit"];
if (isNull _unit) exitWith {[]};
if (isNil "TFAR_fnc_lrRadiosList") exitWith {[]};
private _radios = _unit call TFAR_fnc_lrRadiosList;
if (isNil "_radios") exitWith {[]};
if !(_radios isEqualType []) exitWith {[]};
_radios
