% Torque from a wrench
r = [0.15, 0, 0]; % m, lever arm from bolt to hand
F = [0, 40, 0];   % N, applied force

torque = cross(r, F);
disp('Torque vector (N*m):')
disp(torque)

% Work done pushing a cart
force = [120, -40, 0]; % N
displacement = [5, 2, 0]; % m

work = dot(force, displacement);
disp('Work done (J):')
disp(work)
