%% Givens

R = 100;
L = 0.2;
C = 10e-6; % uF means 10^-6 Farad

%% Part 1
omega = 1000;

Z = R + j*omega*L - j/(omega*C)

mag = abs(Z)
phase = rad2deg(angle(Z))

%% Part 2

% same as Part 1 but for range of omega
omega = 10.^linspace(1, 5, 500);

Z = R + j*omega*L - j./(omega*C);

mag = abs(Z);
phase = rad2deg(angle(Z));

% create subplots
tiledlayout(2,1);
ax1 = nexttile;
loglog(omega, mag)
ylabel('Magnitude')
grid on

ax2 = nexttile;
semilogx(omega, phase)
xlabel('Frequency [rad/s]')
ylabel('Phase Angle [deg]')
ylim([-90, 90]) % cleaner result than the default
grid on
