poly_pumpkin_cannon  % the script in the example

%% Evaluate roots
r = roots(p)

%% Find time of flight
tf = max(r);
disp(['Time of flight: ' num2str(tf/U.S) ' s'])
