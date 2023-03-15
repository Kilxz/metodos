function NewtonRaphson
  rk = input("Ingrese el número: ");
  tol = input("Ingrese tolerancia deseada: ");
  stop = 0;
  iter = 0;
  while stop == 0
 %Cálculo de variables
  fRk = rk - 2^(-rk);
  m = 1 + (2^(-rk)) * log(2);
  rk1 = rk - (fRk / m);
  fRk1 = rk1 - 2^(-rk1);
  iter = iter + 1;
 
 %Condiciones de parada
  if abs(fRk) <= tol
    stop = 1;
  endif
 
  if iter > 50
    stop = 1;
  endif
  
% Actualización
  if stop == 0
    rk = rk1;
  endif
  endwhile

disp("La raíz de la función está en: ")
disp(rk)
disp("Con una cantidad de iteraciones de: ")
disp(iter)
endfunction