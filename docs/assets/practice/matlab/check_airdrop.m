% check_airdrop.m
%
% Practice problem checker for ENAE202 - Polynomials.
% Save this file in the same folder as your airdrop.m script,
% then run "check_airdrop" (without the .m) in the Command Window.

clear; clc;

if exist('airdrop.m', 'file') ~= 2
    error(['Could not find airdrop.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

airdrop;

fprintf('\n--- Checking your answers ---\n');
all_correct = true;
tol = 1e-3;

% p: polynomial coefficients array
expected_p = [-16.1, 0, 3000];
if ~exist('p', 'var')
    fprintf('[MISSING] p is not defined. Did you name your variable exactly "p"?\n');
    all_correct = false;
elseif numel(p) ~= numel(expected_p) || max(abs(p(:) - expected_p(:))) > tol
    fprintf('[FAIL] p = [%s] (that doesn''t look right - check your coefficients)\n', num2str(p));
    all_correct = false;
else
    fprintf('[PASS] p = [%s]\n', num2str(p));
end

names    = {'t_impact', 'h_5s',  'v_impact'};
expected = [13.650473,  2597.5,  -439.545220];

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
