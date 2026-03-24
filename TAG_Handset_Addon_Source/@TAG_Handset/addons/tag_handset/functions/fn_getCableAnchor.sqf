
params ["_owner"];
if (isNull _owner) exitWith {[0, -0.15, 0.05]};
private _pos = _owner selectionPosition "Spine3";
if (_pos isEqualTo [0,0,0]) then { _pos = _owner selectionPosition "pelvis"; };
if (_pos isEqualTo [0,0,0]) then { _pos = [0, -0.15, 0.05]; };
_pos vectorAdd [0, -0.12, 0.02]
