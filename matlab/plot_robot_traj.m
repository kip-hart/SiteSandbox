% Trajectory Planning with Obstacle Avoidance
% A simple script to visualize a robot navigating from start to goal
% while avoiding circular obstacles using basic repulsive potential fields.

% Environment Setup
start = [0, 0];
goal = [10, 10];

% Define circular obstacles: [x_center, y_center, radius]
obstacles = [3, 4, 1.5;
             6, 7, 1;
             8, 3, 1.2];

% Plot setup
figure;
axis equal;
xlim([-1 12]);
ylim([-1 12]);
hold on;
grid on;

% Plot start and goal
plot(start(1), start(2), 'go', 'MarkerSize', 10, 'LineWidth', 2);  % green start
plot(goal(1), goal(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);    % red goal

% Plot obstacles
theta = linspace(0, 2*pi, 100);
for i = 1:size(obstacles,1)
    xc = obstacles(i,1); yc = obstacles(i,2); r = obstacles(i,3);
    fill(xc + r*cos(theta), yc + r*sin(theta), [0.6 0.6 0.6]); % gray circles
end

% Initialize robot position
pos = start;
trajectory = pos;

% Simulation parameters
step_size = 0.2;
tolerance = 0.3;
max_iters = 1000;

for k = 1:max_iters
    % Attractive force toward goal
    to_goal = goal - pos;
    dist_to_goal = norm(to_goal);
    if dist_to_goal < tolerance
        break;
    end
    force = to_goal / dist_to_goal; % normalized

    % Repulsive force from obstacles
    for i = 1:size(obstacles,1)
        obs = obstacles(i,1:2);
        r = obstacles(i,3);
        to_obs = pos - obs;
        dist = norm(to_obs);
        safe_dist = r + 1.0;  % buffer zone
        if dist < safe_dist
            repulse = (safe_dist - dist) * to_obs / dist;
            force = force + repulse;
        end
    end

    % Normalize total force
    force = force / norm(force);

    % Take step
    pos = pos + step_size * force;
    trajectory = [trajectory; pos];
end

% Final trajectory plot
plot(trajectory(:,1), trajectory(:,2), 'b-', 'LineWidth', 1.5);
legend('Start', 'Goal', 'Obstacles', 'Trajectory');
title('Robot Path Planning with Circular Obstacle Avoidance');
