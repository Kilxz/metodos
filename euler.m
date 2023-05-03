function euler

  ym(1) = 2;
  h = 0.1;
  x = 0:h:1;
  for i=2:length(x)
    ym(i) = ym(i-1) + f(ym(i-1), x(i-1)) * h;
  endfor
  for j = 1: length(x)
    y(j) = exp(2*x(j)) + x(j) + 1
  endfor
  plot(x, ym, x, y)
  disp(ym)

  
endfunction

function derivada = f(y, x)
  derivada = 2*y - 2*x - 1;
endfunction
