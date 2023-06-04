function diferenciaCentralSistemasRepaso
  clc
  clear
  y(:, 1) = [1; 2; 1];
  M = [1, 0, 0; 0, -1, 0; 0, 0, 2];
  C = [4, 0, 0; 0, -1, 0; 0, 0, 3];
  K = [0, 4, 1; 4, 2, 0; 1, 0, 1];
  h = 0.001;
  x = 0:h:2;
  Ginv = inv(C * (h/2) + M);
  D = Ginv * (-K * h^2 + 2 * M);
  H = Ginv * (C * (h/2) - M);
  derivadaI = [1; 4; 0];
  taylorAux = y(:, 1) - h * derivadaI + ((h^2) / 2) * (inv(M) * (R(0) - K * y(:, 1) - C * derivadaI));
  for i = 1: length(x) - 1
    if i == 1
      y(:, i + 1) = (h^2) * (Ginv * R(x(i))) + (D * y(:, i)) + (H * taylorAux);
    else
      y(:, i + 1) = (h^2) * (Ginv * R(x(i))) + (D * y(:, i)) + (H * y(:, i-1));
    endif
  endfor
  plot(x, y)
endfunction

function r = R(x)
   r = [(5 * exp(x) + 8 * exp(2 * x) + cos(x)); (-8 * exp(2*x) + 4 * exp(x)); (-cos(x) -3* sin(x) + exp(x))];
endfunction

