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
U_M = 1;
U_KM = 1e3 * U_M;
U_KG = 1;
U_S = 1;
U_RAD = 1;
U_DEG = pi*U_RAD/180;

U_N = U_KG * U_M/U_S^2;


% Air density
rho_0 = 4.615e-9 * U_KG/U_M^3;
H = 54 * U_KM;
h = 400 * U_KM;

% Speed
V_sat = 7 * U_KM/U_S;
omega = 7.2921e-5 * U_RAD/U_S;
R_e = 6371  * U_KM;
lambda = 38.98 * U_DEG;

% Drag coefficient
sigma_N = 1;
sigma_T = 1;
theta = 65 * U_DEG;

% Drag area
S_ref = 20 * U_M^2;

%% Calculations

% Air Density
rho = rho_0 * exp(-h/H)

% Wind-Relative Velocity
V_air = omega * R_e * cos(lambda)
V = V_sat - V_air

% Drag Coefficient
C_D = 2 * (2 - sigma_N) * sin(theta)^3 + 2*sigma_T*sin(theta)*cos(theta)^2

% Drag Force
D = 0.5 * rho * V^2 * C_D * S_ref

%% Solution
disp(['The drag force is: ' num2str(D/U_N) ' N'])
