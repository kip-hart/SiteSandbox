% Uniform random numbers
rng(0)
disp('RNG seed = 0')
x = rand(1, 5)  % x ~ U[0, 1]
y = -10 + 20*x  % y ~ U[-10, 10]

% Draws with new seed
rng(1)
disp('RNG seed = 1')
x = rand(1, 5)

% Draws with first seed
rng(0)
disp('RNG seed = 0')
x = rand(1, 5)
