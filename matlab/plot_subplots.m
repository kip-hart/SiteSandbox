t = linspace(0, 2*pi);
x = cos(x);
v = -sin(x);
a = -cos(x);

tiledlayout(3,1);

% Position
ax1 = nexttile;
plot(t, x)
ylabel('X [m]')

% Speed
ax2 = nexttile;
plot(t, v)
ylabel('V [m/s]')

% Acceleration
ax3 = nexttile;
plot(t, a)
xlabel('Time [s]')
ylabel('A [m/s^2]')

% Link axes
linkaxes([ax1, ax2, ax3], 'x')
