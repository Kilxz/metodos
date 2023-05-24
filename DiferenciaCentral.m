function diferenciaCentral
  clc
  h = 0.01;
  x = 0:h:10;
  g = 9.8;
  l = 1;
  derivadaInicial = 2;
  y(1) = 0;
  for i = 1: length(x) - 1;
    if i == 1
      aux1 = y(1) - h * (derivadaInicial) + ((h^2) / 2) * ((-g / l) * y(1));
      y(i + 1) = (2 - (g * h^2 / l)) * y(i) - aux1;
    else
      y(i + 1) = (2 - (g * h^2 / l)) * y(i) - y(i-1);
    endif
  endfor
  plot(x, y);
endfunction