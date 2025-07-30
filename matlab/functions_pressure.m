% Givens
F = 5000;  % N
A = 0.002; % m^2

% Calculate pressure
p = pressure(F, A);

% Display output
p_MPa = p*1e-6;
disp(['Pressure:' num2str(p_MPa)])
