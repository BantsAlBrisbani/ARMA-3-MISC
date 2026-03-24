
params ["_target", "_player", "_params"];
private _actions = [];
private _radios = [_target] call TAG_Handset_fnc_getBorrowableLrRadios;

{
    private _radioData = _x;
    private _action = [
        format ["TAG_BorrowHandset_%1", _forEachIndex],
        format ["Use LR Radio %1", _forEachIndex + 1],
        "",
        {
            params ["_target", "_player", "_params"];
            _params params ["_radioData"];
            [_target, _player, _radioData] call TAG_Handset_fnc_borrowHandset;
        },
        {
            params ["_target", "_player", "_params"];
            [_target, _player] call TAG_Handset_fnc_canBorrowHandset
        },
        {},
        [_radioData]
    ] call ace_interact_menu_fnc_createAction;

    _actions pushBack [_action, [], _target];
} forEach _radios;

_actions
