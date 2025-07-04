% Dividing polynomials
%
%     3x^3 + 1x^2 - 8x +  2
% ÷                 6x - 10
% --------------------------
%            ???

p1 = [3 1 -8 2];
p2 = [6 -10];

[x, r] = deconv(p1, p2)
