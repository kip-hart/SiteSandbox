% Noisy data
x = [-0.9286   -0.8049   -0.7460   -0.7162   -0.6848   -0.6576 -0.4430   -0.2155   -0.1565   -0.0292    0.0938    0.2647 0.3110    0.3115    0.3575    0.4863    0.5155    0.5844 0.6006    0.6294    0.6983    0.8116    0.8268    0.8315 0.8680    0.9143    0.9150    0.9190    0.9298    0.9412];
y = [-11.5406   -9.2003   -8.1662   -7.6621   -7.1439   -6.7078 -3.6122   -0.9667   -0.3781    0.7617    1.7070    2.7859 3.0342    3.0370    3.2665    3.8228    3.9322    4.1672 4.2177    4.3039    4.4887    4.7339    4.7615    4.7699 4.8308    4.8990    4.9000    4.9053    4.9196    4.9341];
plot(x, y, 'ko')
hold on

x_plt = linspace(min(x), max(x), 101); % higher resolution than x

% Quadratic fit
p_quad = polyfit(x, y, 2);
plot(x_plt, polyval(p_quad, x_plt))

% 20th order fit
p_20th = polyfit(x, y, 20);
plot(x_plt, polyval(p_20th, x_plt));

% Format plot
hold off
xlabel('X')
ylabel('Y')
legend('Data', '3rd order', '20th order')
title('Comparing polyfit Orders')
