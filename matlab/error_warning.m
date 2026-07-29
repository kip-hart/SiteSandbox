warning('off', 'backtrace');

mass = 0; % kg, sensor returned zero unexpectedly
if mass == 0
    warning('Mass reading is zero, using default value instead.')
    mass = 1;
end

disp(mass)
