% check_compressor_stages.m
%
% Practice problem checker for ENAE202 - For Loops.
% Save this file in the same folder as your compressor_stages.m script,
% then run "check_compressor_stages" (without the .m) in the Command Window.

clear; clc;

if exist('compressor_stages.m', 'file') ~= 2
    error(['Could not find compressor_stages.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

compressor_stages;

fprintf('\n--- Checking your answers ---\n');
all_correct = true;
tol = 1e-3;

expected_stages = [19.11, 24.4608, 30.576, 37.30272, 44.763264];
if ~exist('stage_pressures', 'var')
    fprintf('[MISSING] stage_pressures is not defined. Did you name your variable exactly "stage_pressures"?\n');
    all_correct = false;
elseif numel(stage_pressures) ~= numel(expected_stages) || max(abs(stage_pressures(:) - expected_stages(:))) > tol
    fprintf('[FAIL] stage_pressures = [%s] (that doesn''t look right - check your loop)\n', num2str(stage_pressures));
    all_correct = false;
else
    fprintf('[PASS] stage_pressures = [%s]\n', num2str(stage_pressures));
end

if ~exist('overall_ratio', 'var')
    fprintf('[MISSING] overall_ratio is not defined. Did you name your variable exactly "overall_ratio"?\n');
    all_correct = false;
else
    rel_err = abs(overall_ratio - 3.04512) / abs(3.04512);
    if rel_err < tol
        fprintf('[PASS] overall_ratio = %.4f\n', overall_ratio);
    else
        fprintf('[FAIL] overall_ratio = %.4f (that doesn''t look right - check your formula)\n', overall_ratio);
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
