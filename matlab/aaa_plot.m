x = linspace(0, 2*pi);
y1 = cos(x);
y2 = sin(x);

plot(x, y1)
hold on
plot(x, y2)
hold off

legend('cos(x)', 'sin(x)')
xlabel('x [rad]')
ylabel('f(x)')
title('Trigonometric Functions')

% Set the bounds on x and y axes
xlim([0, 2*pi])
ylim([-1.1, 1.1])

% Set the x ticks every pi/4 radians
xticks(0:pi/4:2*pi)
xticklabels({'0', '\pi/4', '\pi/2', '3\pi/4', '\pi', '5\pi/4', '3\pi/2', '7\pi/4', '2\pi'})

% Set the y ticks every 0.25
yticks(-1:0.25:1)

% Turn the grid on
grid('on')
