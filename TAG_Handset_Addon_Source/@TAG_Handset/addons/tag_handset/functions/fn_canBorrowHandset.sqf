
params ["_target", "_player"];
if (isNull _target || {isNull _player}) exitWith {false};
if (_target isEqualTo _player) exitWith {false};
if (!alive _target || {!alive _player}) exitWith {false};
if ((_player distance _target) > TAG_HANDSET_INTERACT_DISTANCE) exitWith {false};
if (vehicle _player != _player) exitWith {false};
if (vehicle _target != _target) exitWith {false};
if (!isPlayer _target) exitWith {false};
if (!isPlayer _player) exitWith {false};

if (!isNil "ace_common_fnc_canInteractWith") then {
    if !([_player, _target, []] call ace_common_fnc_canInteractWith) exitWith {false};
};

private _borrower = _target getVariable ["TAG_handsetBorrower", objNull];
if (!isNull _borrower && {_borrower != _player}) exitWith {false};

private _radios = [_target] call TAG_Handset_fnc_getBorrowableLrRadios;
(count _radios) > 0
