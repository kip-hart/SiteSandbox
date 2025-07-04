% Noisy data
data = [0            0.299;
    0.5712      -0.264;
    1.1424       0.809;
    1.7136       0.901;
    2.2848       0.105;
    2.8560      -0.815;
    3.4272      -1.192;
    3.9984      -0.684;
    4.5696       0.267;
    5.1408       0.980;
    5.7120       0.462;
    6.2832      -0.039];
x = data(:, 1);
y = data(:, 2);
plot(x, y, 'ko')
hold on

% Cubic fit
p_cubic = polyfit(x, y, 3);
plot(x, polyval(p_cubic, x))

% 11th order fit
p_11th = polyfit(x, y, 11);
plot(x, polyval(p_11th, x));

% Format plot
hold off
xlabel('X')
ylabel('Y')
legend('Data', '3rd order', '11th order')
title('Comparing polyfit Orders')
