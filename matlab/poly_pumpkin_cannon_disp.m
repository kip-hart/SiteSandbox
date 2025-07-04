%% Units
% English
U.S = 1;
U.MIN = 60*U.S;
U.HR = 60*U.MIN;

U.FT = 1;
U.MILE = 5280*U.FT;

U.RAD = 1;
U.DEG = pi*U.RAD/180;

%% Givens
speed = 100*U.MILE/U.HR;
theta = 45*U.DEG;
h_0 = 15*U.FT;
dt = 2*U.S;

%% Constants
g = 32.2*U.FT/U.S^2;

%% Calculation

% Vertical speed
v_vert = speed * sin(theta);

% Height vs time, without air resistance
% h(t) = -1/2*g*t^2 + v_0*t + h_0
p = [-1/2*g, v_vert, h_0];

% Height at dt
h = polyval(p, dt);

%% Answer
disp(['Height at ' num2str(dt/U.S) ' s: ' num2str(h/U.FT) ' ft'])
