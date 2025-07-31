yield_strength = 300;   % MPa
density = 7800;         % kg/m^3

if yield_strength > 250 && density < 8000
    disp('Material is acceptable.')
elseif yield_strength <= 250
    disp('Yield strength is too low.')
else
    disp('Density is too high.')
end
