% check_airspeed_envelope.m
%
% Practice problem checker for ENAE202 - Arrays and Matrices.
% Save this file in the same folder as your airspeed_envelope.m script,
% then run "check_airspeed_envelope" (without the .m) in the Command Window.

clear; clc;

if exist('airspeed_envelope.m', 'file') ~= 2
    error(['Could not find airspeed_envelope.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

airspeed_envelope;

fprintf('\n--- Checking your answers ---\n');

all_correct = true;

% unsafe_mask: logical array
expected_mask = logical([0 1 0 0 1 0 0 1 0 1]);
if ~exist('unsafe_mask', 'var')
    fprintf('[MISSING] unsafe_mask is not defined. Did you name your variable exactly "unsafe_mask"?\n');
    all_correct = false;
elseif ~isequal(logical(unsafe_mask(:)), expected_mask(:))
    fprintf('[FAIL] unsafe_mask does not match (check your comparison and threshold)\n');
    all_correct = false;
else
    fprintf('[PASS] unsafe_mask is correct\n');
end

% unsafe_knots and unsafe_mph: numeric arrays, in the order they appear in airspeed_knots
expected_knots = [58, 55, 59, 57];
expected_mph = expected_knots * 1.15078;
tol = 1e-3;

names = {'unsafe_knots', 'unsafe_mph'};
expected_vals = {expected_knots, expected_mph};

for k = 1:numel(names)
    name = names{k};
    expected = expected_vals{k};
    if ~exist(name, 'var')
        fprintf('[MISSING] %s is not defined. Did you name your variable exactly "%s"?\n', name, name);
        all_correct = false;
        continue
    end
    actual = eval(name);
    if numel(actual) ~= numel(expected)
        fprintf('[FAIL] %s has %d element(s), expected %d\n', name, numel(actual), numel(expected));
        all_correct = false;
        continue
    end
    a = actual(:);
    e = expected(:);
    rel_err = max(abs(a - e) ./ abs(e));
    if rel_err < tol
        fprintf('[PASS] %s is correct\n', name);
    else
        fprintf('[FAIL] %s = [%s] (that doesn''t look right - check your formula)\n', name, num2str(actual));
        all_correct = false;
    end
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged variables above and try again.\n');
end
