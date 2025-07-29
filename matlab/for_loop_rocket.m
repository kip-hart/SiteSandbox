% Givens
delta_v = 12000; % m/s
g0 = 9.81; % m/s^2

Isp = [380, 450];

% Propellant mass fraction
zeta = zeros(size(Isp));

for ii=1:length(Isp)
    m0_over_mf = exp(delta_v/(Isp(ii)*g_0));
    zeta(ii) = 1 - 1/m0_over_mf;
end

disp('Propellant mass fraction range:')
disp([min(zeta), max(zeta)])
