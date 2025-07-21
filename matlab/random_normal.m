% Normal Distribution
wind_mean = [30, 5, 0];   % mph
wind_stdev = [10, 10, 2]; % mph

rng(0)
wind_draws = wind_mean + randn(1000, 1)*wind_stdev;


% Plot winds
tiledlayout(3,1);

ax1 = nexttile;
histogram(wind_draws(:, 1))
xlabel('V North [mph]')

ax2 = nexttile;
histogram(wind_draws(:, 2))
xlabel('V East [mph]')

% Acceleration
ax3 = nexttile;
histogram(wind_draws(:, 3))
xlabel('V Down [mph]')

% Link axes
linkaxes([ax1, ax2, ax3], 'x')
