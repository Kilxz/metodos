function RungeKutta
h = 0.1;
x = 0:h:10;
y(1) = 4;
w = 1/2;
for i = 1 : (length(x) - 1)
  xm = x(i);
  ym = y(i);
  k1 = h * f(xm, ym);
  xg = xm + h / (2 * w);
  yg = ym + k1 / (2 * w);
  k2 = h * f(xg, yg);
  y(i+1) = ym + (1 - w) * k1 + w * k2; 

endfor
for i = 1 : length(x)
  yexacta(i) = exacta(x(i));
endfor
plot(x, y, x, yexacta)
disp(y)
endfunction

function f = f(t, y)
  f = 0.5 * t - 0.5 * y;
endfunction

function exacta = exacta(t)
  exacta = 6 * exp(-t/2) -2 + t;
endfunction
