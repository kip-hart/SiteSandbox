poly_pumpkin_cannon  % the script in the example

%% Get speed polynomial
p_speed = polyder(p);

%% Find the root
r_speed = roots(p_speed)

%% Find max height
h_max = polyval(p, r_speed)
disp(['Max height of ' num2str(h_max/U.FT) ...
      ' achieved at ' numstr(r_speed/U.S) ' s'])
