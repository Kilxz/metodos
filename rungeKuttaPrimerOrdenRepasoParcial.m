function rungeKuttaRepaso
  clc
  clear
  h = 0.1;
  x = 0:h:10;
  y(1) = 4;
  w = 1/2;
  for i = 2: length(x)
    k1 = h * f(x(i-1), y(i-1));
    xG = x(i-1) + h / (2 * w);
    yG = y(i-1) + k1 / (2 * w);
    k2 = h * f(xG, yG);
    y(i) = y(i-1) + (1 - w) * k1 + w * k2;
  endfor
  for i = 1 : length(x)
    yexacta(i) = exacta(x(i));
  endfor
  plot(x, y, x, yexacta)





endfunction

function exacta = exacta(t)
  exacta = 6 * exp(-t/2) -2 + t;
endfunction

function derivada = f(x, y)
  derivada = 0.5 * x - 0.5 * y;
endfunction
