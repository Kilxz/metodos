function diferenciaCentralMatriz
  clc
  y(1, :) = [1; 2; 1]
  M = [1, 0, 0; 0, -1, 0; 0, 0, 2]
  C = [4, 0, 0; 0, -1, 0; 0, 0 , 3]
  h = 0.001;
  K = [0, 4, 1; 4, 2, 0; 1, 0, 1]
  G = inv(M + (h/2) * C)
  D = G * (2 * M - (h^2) * K)
  H = G * ((h/2) * C - M)

  x = 0:h:2;
  y(1, :) = [1; 2; 1]
  derivadaInicial = [1, 4, 0]

  for i = 1: length(x) - 1;
    if i == 1
      aux1 = y(1) - h * derivadaInicial + (h^2 / 2) * (inv(M) * (R(x(i)) - K * y(i) - C * derivadaInicial))
      y(i + 1, :) = h^2 * G * R(x(i)) + D * y(i) + H * aux1
    else
      y(i + 1, :) = h^2 * G * R(x(i)) + D * y(i) + H * y(i-1)
    endif
  endfor
  plot(x, y);
endfunction

function R = R(t)
  R(1) = 5 * exp(t) + 8 * exp(2 * t) + cos(t)
  R(2) = -8 * exp(2 * t) + 4 * exp(t)
  R(3) = -cos(t) - 3 * sin(t) + exp(t)
endfunction
