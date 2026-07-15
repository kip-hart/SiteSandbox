% check_sls_liftoff.m
%
% Practice problem checker for ENAE202 - User Scripts.
% Save this file in the same folder as your sls_liftoff.m script,
% then run "check_sls_liftoff" (without the .m) in the Command Window.

clear; clc;

if exist('sls_liftoff.m', 'file') ~= 2
    error(['Could not find sls_liftoff.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

sls_liftoff;

fprintf('\n--- Checking your answers ---\n');

names    = {'W',        'TWR',    'F_net',    'a'};
expected = [25506000,   1.53297,  13594000,   5.22846];
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
