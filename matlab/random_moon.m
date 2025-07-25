%% Givens
% MKS units + radians
h0 = 0;

theta_lower = deg2rad(0);
theta_upper = deg2rad(5);

v_mean = 300;
v_std  = 10;

x_base = 10000;

g = 1.62;

n_samples = 8000;
seed = 2;

%% Final Speed and Position

% Sample uncertain values
rng(seed);
theta_samples = theta_lower + (theta_upper - theta_lower) * rand(n_samples, 1);
v_samples = v_mean + v_std*randn(n_samples, 1);

% Calculate final speed
v_h = v_samples .* cos(theta_samples);
v_v0 = v_samples .* sin(theta_samples);
v_vf = -v_v0; % parabola, symmetric
speed_final = sqrt(v_h.^2 + v_vf.^2);

% Calculate final position
tf = (v_v0 - v_vf)/g;
dx = v_h .* tf;

%% Particles Striking the Base

% Fraction striking base
mask = dx >= x_base;
n_strike = sum(mask);
frac_strike = n_strike / n_samples;
percent_strike = 100*frac_strike

% Speed of particles striking base
speed_striking = speed_final(mask);
avg_speed = mean(speed_striking)
