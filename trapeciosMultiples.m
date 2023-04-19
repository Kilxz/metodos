function trapeciosMultiples
  x = [0, 0.1, 0.2, 0.3, 0.4];
  y = [1, 7, 4, 3, 5];
  dx = x(2) - x(1);
  n = length(x);
  sum = 0;
  for i = 1: (n-1)
    sum = sum + (y(i) + y(i+1)) / 2;
  endfor
  sum = dx * sum;
  
  disp("La integral numerica es: ")
  disp(sum)
endfunction
