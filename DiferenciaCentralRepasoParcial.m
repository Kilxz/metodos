function diferenciaCentralRepaso
  clc
  clear
  y(1) = 0;
  h = 0.01;
  L = 1;
  g = 9.8;
  yant = y(1) - h * 2 + (h^2 / 2) * (-g / L) * (h^2);
  x = 0:h:10;
  for i = 1: length(x) - 1
    if i == 1
      y(i+1) = ((-g / L) * (h^2)) * y(i) + 2 * y(i) - yant;
    else
      y(i+1) = ((-g / L) * (h^2)) * y(i) + 2 * y(i) - y(i-1);
    endif
  endfor

  plot(x, y)

