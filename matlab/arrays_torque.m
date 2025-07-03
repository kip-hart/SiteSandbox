% Torque (Nm) and Power (W) data
performance = [
    4.1,   75;
    4.3,   82;
    4.0,   78;
    4.5,   89;
    4.2,   85
];

% Extract the torque and power columns
torque = performance(:,1);
power = performance(:,2);

% Calculate rotational speed (rad/s) for each measurement
omega = power ./ torque
