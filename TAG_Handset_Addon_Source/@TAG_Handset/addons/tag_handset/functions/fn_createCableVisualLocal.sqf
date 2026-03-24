params ["_connectionId", "_owner", "_borrower"];

if (!hasInterface) exitWith {false};
if (_connectionId isEqualTo "") exitWith {false};
if (isNull _owner || {isNull _borrower}) exitWith {false};

true