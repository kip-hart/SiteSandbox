% check_fuel_flow.m
%
% Practice problem checker for ENAE202 - Random Numbers.
% Save this file in the same folder as your fuel_flow.m script,
% then run "check_fuel_flow" (without the .m) in the Command Window.

clear; clc;

if exist('fuel_flow.m', 'file') ~= 2
    error(['Could not find fuel_flow.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

fuel_flow;

fprintf('\n--- Checking your answers ---\n');
all_correct = true;
tol = 1e-3;

if ~exist('flow_samples', 'var')
    fprintf('[MISSING] flow_samples is not defined. Did you name your variable exactly "flow_samples"?\n');
    all_correct = false;
elseif numel(flow_samples) ~= 5000
    fprintf('[FAIL] flow_samples has %d element(s), expected 5000\n', numel(flow_samples));
    all_correct = false;
elseif abs(flow_samples(1) - 1.796193) / abs(1.796193) > tol
    fprintf('[FAIL] flow_samples(1) = %.6f (that doesn''t look right - check rng(7) is called before randn, and your formula)\n', flow_samples(1));
    all_correct = false;
else
    fprintf('[PASS] flow_samples looks correct\n');
end

names    = {'percent_exceed', 'mean_exceed_flow'};
expected = [0.680000,          2.015851];

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
        fprintf('[PASS] %s = %.6f\n', name, actual);
    else
        fprintf('[FAIL] %s = %.6f (that doesn''t look right - check your formula)\n', name, actual);
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
