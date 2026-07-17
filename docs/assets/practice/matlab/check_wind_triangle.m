% check_wind_triangle.m
%
% Practice problem checker for ENAE202 - Complex Numbers.
% Save this file in the same folder as your wind_triangle.m script,
% then run "check_wind_triangle" (without the .m) in the Command Window.

clear; clc;

if exist('wind_triangle.m', 'file') ~= 2
    error(['Could not find wind_triangle.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

wind_triangle;

fprintf('\n--- Checking your answers ---\n');

names    = {'v_ground',              'groundspeed', 'track_deg'};
expected = [168.384573+68.349365i,   181.727818,    22.092837];
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
        fprintf('[PASS] %s = %s\n', name, num2str(actual));
    else
        fprintf('[FAIL] %s = %s (that doesn''t look right - check your formula)\n', name, num2str(actual));
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
