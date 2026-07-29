% check_fuel_reserve.m
%
% Practice problem checker for ENAE202 - Conditionals.
% Save this file in the same folder as your fuel_reserve.m script,
% then run "check_fuel_reserve" (without the .m) in the Command Window.

clear; clc;

if exist('fuel_reserve.m', 'file') ~= 2
    error(['Could not find fuel_reserve.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

fuel_reserve;

fprintf('\n--- Checking your answers ---\n');
all_correct = true;
tol = 1e-3;

if ~exist('endurance_hr', 'var')
    fprintf('[MISSING] endurance_hr is not defined. Did you name your variable exactly "endurance_hr"?\n');
    all_correct = false;
else
    rel_err = abs(endurance_hr - 1.285714) / abs(1.285714);
    if rel_err < tol
        fprintf('[PASS] endurance_hr = %.4f\n', endurance_hr);
    else
        fprintf('[FAIL] endurance_hr = %.4f (that doesn''t look right - check your formula)\n', endurance_hr);
        all_correct = false;
    end
end

if ~exist('status', 'var')
    fprintf('[MISSING] status is not defined. Did you name your variable exactly "status"?\n');
    all_correct = false;
elseif strcmp(status, 'Caution')
    fprintf('[PASS] status = ''%s''\n', status);
else
    fprintf('[FAIL] status = ''%s'' (that doesn''t look right - check your if/elseif thresholds)\n', status);
    all_correct = false;
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
