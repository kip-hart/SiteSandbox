% check_thrust_curve.m
%
% Practice problem checker for ENAE202 - Plotting.
% Save this file in the same folder as your thrust_curve.m script,
% then run "check_thrust_curve" (without the .m) in the Command Window.

clear; clc; close all;

if exist('thrust_curve.m', 'file') ~= 2
    error(['Could not find thrust_curve.m in the current folder. ' ...
           'Save your script there, and make sure that folder is set ' ...
           'as your Current Folder in MATLAB.']);
end

thrust_curve;

fprintf('\n--- Checking your answers ---\n');
all_correct = true;

expected_rpm = [4000, 6000, 8000, 10000, 12000, 14000];
expected_thrust = [1200, 2100, 3400, 5000, 6900, 9100];

ax = gca;
lines = findobj(ax, 'Type', 'Line');

if isempty(lines)
    fprintf('[FAIL] No plotted line found. Did you call plot(rpm, thrust)?\n');
    all_correct = false;
else
    xdata = get(lines(1), 'XData');
    ydata = get(lines(1), 'YData');
    x_ok = isequal(numel(xdata), numel(expected_rpm)) && max(abs(xdata(:) - expected_rpm(:))) < 1e-6;
    y_ok = isequal(numel(ydata), numel(expected_thrust)) && max(abs(ydata(:) - expected_thrust(:))) < 1e-6;
    if x_ok && y_ok
        fprintf('[PASS] Plotted line matches rpm and thrust\n');
    else
        fprintf('[FAIL] Plotted line does not match rpm and thrust (check what you passed to plot)\n');
        all_correct = false;
    end
end

xlbl = get(get(ax, 'XLabel'), 'String');
if isempty(xlbl)
    fprintf('[FAIL] x-axis label is missing. Did you call xlabel(...)?\n');
    all_correct = false;
else
    fprintf('[PASS] x-axis label is set ("%s")\n', xlbl);
end

ylbl = get(get(ax, 'YLabel'), 'String');
if isempty(ylbl)
    fprintf('[FAIL] y-axis label is missing. Did you call ylabel(...)?\n');
    all_correct = false;
else
    fprintf('[PASS] y-axis label is set ("%s")\n', ylbl);
end

ttl = get(get(ax, 'Title'), 'String');
if isempty(ttl)
    fprintf('[FAIL] Title is missing. Did you call title(...)?\n');
    all_correct = false;
else
    fprintf('[PASS] Title is set ("%s")\n', ttl);
end

if strcmp(get(ax, 'XGrid'), 'on')
    fprintf('[PASS] Grid is on\n');
else
    fprintf('[FAIL] Grid is not on. Did you call grid(''on'')?\n');
    all_correct = false;
end

if all_correct
    fprintf('\nAll checks passed! Nice work.\n');
else
    fprintf('\nSome checks did not pass yet. Review the flagged items above and try again.\n');
end
