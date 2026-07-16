forces = [30, 45, -10, 22]; % N, readings from a load cell

disp('Mean force (N):')
disp(mean(forces))

resultant = [30, 40, 0]; % N
disp('Magnitude of the resultant force (N):')
disp(norm(resultant))
