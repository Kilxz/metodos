function derivacion
  h = 0.1;
  x = 0:h:1;
  for i = 1: length(x)
    y(i) = cos(pi * x(i));
  endfor
  n = length(x);
  derivadaSegunda(1) = 1/(h^2) * (2 * y(1) - 5 * y(1 + 1) + 4 * y(1 + 2) - 1 * y(1 + 3));
  derivadaSegunda(n) = 1/(h^2) * (2 * y(n) - 5 * y(n - 1) + 4 * y(n - 2) - 1 * y(n - 3));
  for i = 2: (n -1)
    derivadaSegunda(i) = 1/(h^2) * (y(i-1) -2 * y(i) + y(i+1));
  endfor
  
  for i = 1: n
    disp(" La derivada en el punto x = "), disp(x(i)), disp("vale: "), disp(derivadaSegunda(i));
  endfor
endfunction
