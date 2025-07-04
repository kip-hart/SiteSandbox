poly_pumpkin_cannon  % the script in the example

%% Evaluate entire trajectory
dt = (0:0.01:100)*U.S;
h = polyval(p, dt);

%% Plot trajectory above ground
mask = h >= 0;
plot(dt(mask)/U.S, h(mask)/U.FT, ... 
     'Color', '#FF7518', ... % pumpkin color
     'LineWidth', 2);
ylim([0 inf])  % force lower bound to be y=0
grid('on')
xlabel('Time [s]')
ylabel('Height [ft]')
title('Pumpkin Height vs Time')
