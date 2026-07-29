thrust = 5000; % N
mass = 0; % kg, invalid sensor reading
g = 9.81; % m/s^2

try
    if mass <= 0
        error('InvalidInput:mass', 'Mass must be positive, got %d kg.', mass)
    end
    weight = mass * g;
    TWR = thrust / weight;
    disp(TWR)
catch ME
    disp(ME.identifier)
    disp(ME.message)
end
