x = linspace(0,2*pi);
y = cos(x);

disp('about to plot');
plot(x,y);
disp('about to save');
saveas(gcf,'sandbox_plot.png');
disp('saved');