% Noisy data
x = [-0.92858 -0.80492 -0.74603 -0.71623 -0.68477 -0.65763 -0.443 -0.21555 -0.15648 -0.029249 0.093763 0.26472 0.31096 0.31148 0.35747 0.48626 0.51548 0.58441 0.60056 0.62945 0.69826 0.81158 0.82675 0.83147 0.86799 0.91433 0.91501 0.91898 0.92978 0.94119];
y = [-10.7164 -11.073 -9.0585 -9.4775 -8.7553 -5.414 -2.8329 -1.6983 1.4228 -1.1005 1.4619 2.3122 4.0963 4.2178 2.014 3.7819 3.7146 4.7525 5.0552 5.3227 3.5928 5.4527 5.3819 3.4203 3.3068 4.8925 6.7389 4.2669 5.2606 3.8293];
plot(x, y, 'o')
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
