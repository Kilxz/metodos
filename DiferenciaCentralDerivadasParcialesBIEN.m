clc
clear
format long g

h = 0.001;
x = 0:0.25:1;
t = 0:h:2;
M = [0.25^2 , 0, 0; 0, 0.50^2, 0; 0, 0, 0.75^2];
K = (12 / (0.25^2)) * [2, -1, 0; -1, 2, -1; 0, -1, 2];
U = [sin( pi * x(2)); sin( pi * x(3) ); sin( pi * x(4) )];
Ut(:,1) = U;
Ut0 = Ut(:, 1) - h * 3 + (h^2/2) * (- inv(M) * K * Ut(:, 1));
for i = 1: length(t) -1
  if i == 1
    Ut(:, i + 1) = inv(M) * (2 * M - h^2 * K) * Ut(:, i) - Ut0;
  else
    Ut(:, i + 1) = inv(M) * (2 * M - h^2 * K) * Ut(:, i) - Ut(:, i - 1);
  endif
endfor

plot(t, Ut(1, :), t, Ut(2, :), t, Ut(3, :))
%plot(t, Ut(:, 2), t, Ut(:, 3), t, Ut(:, 4))