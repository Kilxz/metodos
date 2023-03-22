function PuntoFijo
  derivada = 0;
  while derivada == 0
  tol = input("Ingrese tolerancia: ");
  x = input("Ingrese primer valor de x: ");
  iterMax = input("Ingrese la maxima cantidad de iteraciones deseadas: ");
  a = input("Ingrese alpha deseado: ");
  stop = 0;
  i = 0;
  f = x^2 - 3;
  if a * (2*x + 1) < 1
    derivada = 1;
  endif
  endwhile
  
  
  while stop == 0
  i = i + 1;
  f = x^2 - 3;
  xk1 = a * (x^2 - 3) + x;
  fxk1 = xk1^2 - 3;
  
  %if fxk1 <= tol
  % stop = 1;
  %endif
  
  if i != 1
    if abs(x - xk1) <= tol
      stop = 1;
    endif
  endif
  
  if i > iterMax
    stop = 1;
  endif
  
  if stop != 1
    x = xk1;
  endif
endwhile

disp("La raíz está en x = ");
disp(xk1)
endfunction
