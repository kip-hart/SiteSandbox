% check_rotor_loads.m
%
% Practice problem checker for ENAE202 - Vector Math.
% Save this file in the same folder as your rotor_loads.m script,
% then run "check_rotor_loads" (without the .m) in the Command Window.

clear; clc;

if exist('rotor_loads.m', 'file') ~= 2
    error(['Could not find rotor_loads.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

rotor_loads;

fprintf('\n--- Checking your answers ---\n');

names    = {'mean_load', 'load_spread', 'load_std', 'climb_power'};
expected = [4975,        280,           120.138809, 360000];
tol      = 1e-3;

all_correct = true;
for k = 1:numel(names)
    name = names{k};
    if ~exist(name, 'var')
        fprintf('[MISSING] %s is not defined. Did you name your variable exactly "%s"?\n', name, name);
        all_correct = false;
        continue
    end
    actual = eval(name);
    rel_err = abs(actual - expected(k)) / abs(expected(k));
    if rel_err < tol
        fprintf('[PASS] %s = %.4f\n', name, actual);
    else
        fprintf('[FAIL] %s = %.4f (that doesn''t look right - check your formula)\n', name, actual);
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
