function met_potencia
  
  A = [-10 4 
      -4 0 ];
  x = [2
      2];
  tol = 0.001;
  A = inv(A);
  max_it = 50;
  error = 0;
  k = 0;
  while error < 1 - tol && (k <= max_it)
    x_nor = x / normainfinito(x)
    xn = A * x_nor
    xn_nor = xn / normainfinito(xn)
    error = abs((transpose(xn_nor) * xn_nor)/(transpose(x_nor) * x_nor))
    alfa(1) = xn(1) / x_nor(1)
    k = k+1
    x = xn
  endwhile
    n = 1 / alfa(1)
endfunction

function norma = normainfinito(vector)
  
  bigger = abs(vector(1));
  for i = 1 : length(vector)
    if bigger < abs(vector(i))
      bigger = abs(vector(i));
    endif
  endfor
  norma = bigger;
  return
endfunction
