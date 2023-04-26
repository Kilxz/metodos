function simpsonCompuesto
  dx = (pi/2)/6;
  dx2 = (pi/2) /10;
  x = 0:dx:(pi / 2);
  x2 = 0:dx2:(pi/2);
  for i = 1: length(x)
    y(i) = sin(2*x(i));
  endfor
  for i = 1: length(x2)
  y2(i) = sin(2*x2(i));
  endfor
  n = length(x);
  n2 = length(x2);
  sum = 0;
  sum2 = 0;
  fx0 = y(1);
  fx02 = y2(1);
  fxn2 = y2(n2);
  fxn = y(n);
  for i = 2: (n-1)
    if mod(i, 2) == 0
      sum = sum + 4*y(i);
    elseif
      sum = sum + 2*y(i);
    endif
  endfor
  sum = sum + fx0 + fxn;
  sum = (dx/3) * sum;
  
  for i = 2: (n2-1)
    if mod(i, 2) == 0
      sum2 = sum2 + 4*y2(i);
    elseif
      sum2 = sum2 + 2*y2(i);
    endif
  endfor
  sum2 = sum2 + fx02 + fxn2;
  sum2 = (dx2/3) * sum2;
  
 disp("Integral con paso 6:");
 disp(sum);
 disp("Integral con paso 10:");
 disp(sum2);
 richardson = richardson(sum, sum2, dx, dx2, 4);
 disp("El resultado de la extrapolacion de Richardson es: ")
 disp(richardson)
endfunction

function richardson = richardson(i1, i2, h1, h2, n)
  b = (h1 / h2)^n;
  resultado = ((b * i2) - i1) / (b -1);
  richardson = resultado;
endfunction
