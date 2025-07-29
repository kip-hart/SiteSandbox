x = linspace(-1, 1, 1e6); % one million elements

%% Vectorized sqrt
tic;
y = sqrt(x);

disp('Vectorized compute time: ')
disp(toc)

%% For loop sqrt
tic;
y = zeros(size(x));
for ii=1:length(x)
    y(ii) = sqrt(x(ii));
end

disp('For loop compute time: ')
disp(toc)
