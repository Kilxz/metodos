function RungeKutta
h = 0.1;
x = 0:h:10;
g = 9.8;
l = 1;
y(1,1) = 0;
y(2,1) = 2;
w = 1/2;
for i = 1 : (length(x) - 1)
  xm = x(i);
  ym = y(:, i);
  k1 = h * f(y, i);
  xg = xm + h / (2 * w);
  yg = ym + k1 / (2 * w);
  k2 = h * f(y, i);
  y(:, i + 1) = ym + (1 - w) * k1 + w * k2; 

endfor

plot(x, y)
endfunction

function f = f(y, i)
  g = 9.8;
  l = 1;
  matriz = [0, 1; -g/l , 0];
  f = matriz * y(:, i);
endfunction

