% ---------------------------------------------------------------- %
%% Units Example
%
% This is a word problem with a mix of metric and Imperial units.
%
% **Question**
% If a conical space capsule has a diameter of 5.1 meters, a height
% of 129 in, and weighs 30,000 lbm, what is its density?
% Express your answer in kg/m^3.
%
% **Solution Process**
% This problem requires first converting the givens into a single
% unit system. Either will work, so I choose metric. Next, to
% calculate the density I need to find the volume of the capsule
% then divide the mass by volume. The volume of a cone is given by:
%
%        1          3
%   V = --- * pi * r  h
%        3
%
% Author: Kip Hart // 23 FEB 2025
% ---------------------------------------------------------------- %

U = units('metric');

%% Givens
d = 5.1*U.M;
h = 129*U.IN;
m = 30e3*U.LBM;

%% Volume
r = d/2;
V = (1/3)*pi*r^3*h;

%% Density
rho = m/V;
disp(['Density [kg/m^3]:' num2str(rho/(U.KG/U.M^3))])
