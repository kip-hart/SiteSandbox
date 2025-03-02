%% Units Example
%
% This is a word problem with a mix of metric and Imperial units.
%
% *Author:* Kip Hart
% *Last Modified:* 02 MAR 2025

%% Givens
U = units('metric');

d = 5.1*U.M;
h = 129*U.IN;
m = 30e3*U.LBM;

%% Volume and Density
r = d/2;
V = (1/3)*pi*r^2*h;
rho = m/V;

%% Answer
answer = rho/(U.KG/U.M^3);  % divide by units you want the answer in
disp(['Density: ' num2str(answer) ' kg/m^3'])
