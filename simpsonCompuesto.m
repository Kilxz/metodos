function simpsonCompuesto
  x = [0, 0.1, 0.2, 0.3, 0.4];
  y = [1, 7, 4, 3, 5];
  dx = x(2) - x(1);
  n = length(x);
  sum = 0;
  fx0 = y(1);
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
  
  disp("La integral numerica es: ")
  disp(sum)
endfunction