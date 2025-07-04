% Noisy data
x = [0.0000    0.3448    0.6897    1.0345    1.3793    1.7241    2.0689    2.4138    2.7586    3.1034    3.4483    3.7931    4.1379    4.4828    4.8276    5.1724    5.5172    5.8621    6.2069    6.5517    6.8966    7.2414    7.5862    7.9310    8.2759    8.6207    8.9655    9.3103    9.6552   10.0000];
y = [0.2483    5.0945   10.2609   20.3725   28.1093   39.7047   54.5860   73.1416   94.8425  117.8453  142.4575  173.8946  203.8814  239.8465  279.7625  323.4010  373.1026  426.5237  485.7521  548.3794  617.0488  689.0635  767.2502  848.7071  936.0218 1026.8744 1125.2101 1231.0143 1333.8923 1450.0235];
plot(x, y, 'ko')
hold on

x_plt = linspace(min(x), max(x)); % higher resolution than x

% Quadratic fit
p_quad = polyfit(x, y, 2);
plot(x_plt, polyval(p_quad, x_plt))

% 11th order fit
p_11th = polyfit(x, y, 11);
plot(x_plt, polyval(p_11th, x_plt));

% Format plot
hold off
xlabel('X')
ylabel('Y')
legend('Data', '3rd order', '11th order')
title('Comparing polyfit Orders')
