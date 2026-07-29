thrust = 0; % N
weight = 0; % N
TWR = thrust / weight;

disp(TWR)
disp(isnan(TWR))

climb_rate = 500 / 0; % ft/min, divided by zero time

disp(climb_rate)
disp(isinf(climb_rate))
