% Adding polynomials
%
%     3x^3 + 1x^2 - 8x +  2
% +                 6x - 10
% --------------------------
%     3x^3 + 1x^2 - 2x -  8

p1 = [3 1 -8 2];
p2 = [6 -10];

padded_p2 = padarray(p2, 2, 0, 'pre')
p3 = p1 + padded_p2
