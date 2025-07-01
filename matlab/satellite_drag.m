%% Satellite Aerodynamics
% Kip Hart
% 30 June 2025

%% Givens
%
% D = 1/2 rho V^2 C_D S_ref
%
% rho = rho_0 e^(-h/H)
%
% V = V_sat - V_air
% 
% C_D = 2 (2 - sigma_N) sin^3(t) + 2*sin(t)*cos^2(t)

% Convert Givens to MKS and radians
U.M = 1;
U.KM = 1e3 * U.M;
U.KG = 1;
U.S = 1;
U.RAD = 1;
U.DEG = pi*U.RAD/180;

U.N = U.KG * U.M/U.S^2;


% Air density
rho_0 = 4.615e-9 * U.KG/U.M^3;
H = 54 * U.KM;
h = 400 * U.KM;

% Speed
V_sat = 7 * U.KM/U.S;
omega = 7.2921e-5 * U.RAD/U.S;
R_e = 6371  * U.KM;
lambda = 38.98 * U.DEG;

% Drag coefficient
sigma_N = 1;
sigma_T = 1;
theta = 65 * U.DEG;

% Drag area
S_ref = 20 * U.M^2;

%% Calculations

% Air Density
rho = rho_0 * exp(-h/H)

% Wind-Relative Velocity
V_air = omega * R_e * cos(lambda)
V = V_sat - V_air

% Drag Coefficient
C_D = 2 * (2 - sigma_N) * sin(theta)^3 + 2*sin(theta)*cos(theta)^2

% Drag Force
D = 0.5 * rho * V^2 * C_D * S_ref

%% Solution
disp(['The drag force is: ' num2str(D/U.N) ' N'])
