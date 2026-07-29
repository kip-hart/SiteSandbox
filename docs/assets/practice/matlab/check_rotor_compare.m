% check_rotor_compare.m
%
% Practice problem checker for ENAE202 - User Functions.
% Save this file in the same folder as your disk_loading.m and
% rotor_compare.m files, then run "check_rotor_compare" (without the
% .m) in the Command Window.

clear; clc;

if exist('disk_loading.m', 'file') ~= 2
    error(['Could not find disk_loading.m in the current folder. ' ...
           'Save your function there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

if exist('rotor_compare.m', 'file') ~= 2
    error(['Could not find rotor_compare.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

rotor_compare;

fprintf('\n--- Checking your answers ---\n');

names    = {'DL_a',         'DL_b',          'DL_ratio'};
expected = [5.89462752,     12.15766926,     2.0625];
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
        fprintf('[FAIL] %s = %.4f (that doesn''t look right - check disk_loading.m and how you called it)\n', name, actual);
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
