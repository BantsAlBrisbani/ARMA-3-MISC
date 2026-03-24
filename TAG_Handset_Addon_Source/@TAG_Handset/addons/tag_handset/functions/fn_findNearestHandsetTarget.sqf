
private _best = objNull;
private _bestDist = 1e10;
{
    if ([_x, player] call TAG_Handset_fnc_canBorrowHandset) then {
        private _d = player distance _x;
        if (_d < _bestDist) then {
            _best = _x;
            _bestDist = _d;
        };
    };
} forEach (player nearEntities ["CAManBase", TAG_HANDSET_NEARBY_SCAN_RADIUS]);
_best
