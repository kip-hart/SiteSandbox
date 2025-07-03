x = linspace(0, 2*pi);
y1 = cos(x);
y2 = sin(x);

plot(x, y1)
hold on   % "hold" the first plot - not overwrite
plot(x, y2)
hold off

legend('First Line', 'Second Line')
