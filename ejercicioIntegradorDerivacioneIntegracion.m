function derivacion
  x = [0, 0.5, 1, 1.5, 2, 2.5, 3];
  y = [167, 176, 201, 241, 291, 347, 400];
  h = 0.5;
  n = length(x);
  derivadaPrimera(1) = 1 / (2*h) * (-3 * y(1) + 4 * y(1 + 1) - 1 * y(1 + 2));
  derivadaPrimera(n) = 1 / (2*h) * (3 * y(n) - 4 * y(n - 1) + 1 * y(n - 2));

  for i = 2: (n -1)
    derivadaPrimera(i) = 1/(2* h) * (y(i + 1) - y(i - 1));
  endfor
  
  for i = 1: n
  yNuevo(i) = x(i) * (derivadaPrimera(i))^2;
  endfor
  sum = 0;
  fx0 = yNuevo(1);
  fxn = yNuevo(n);
  for i = 2: (n-1)
    if mod(i, 2) == 0
      sum = sum + (4 * yNuevo(i));
    elseif
      sum = sum + (2 * yNuevo(i));
    endif
  endfor
  sum = sum + fx0 + fxn;
  sum = (h/3) * sum;
  
  disp("La integral numerica es: ")
  disp(2* pi * sum)
  disp("Las derivadas primeras son: ")
  disp(derivadaPrimera)
endfunction
