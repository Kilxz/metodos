function secante
  a = input("Ingrese el primer número del invervalo: ");
  b = input("Ingrese el segundo número del invervalo: ");
  tol = input("Ingrese tolerancia deseada: ");

  stop = 0;
  iter = 0;

  while stop == 0
    %Cálculo de variables
    fA = 8.2000 + (-16.4000) * exp(-0.5000 * a);
    fB = 8.2000 + (-16.4000) * exp(-0.5000 * b);
    m = (fA - fB) / (a - b);
    rk = a - (fA / m);
    iter = iter + 1;
    fRk = 8.2000 + (-16.4000) * exp(-0.5000 * rk);
  %Condiciones de parada
  if abs(fRk) < tol
    stop = 1;
  endif

  if iter > 1
    stop = 1;
  endif
  %Actualización
  if stop == 0
    b = a;
    a = rk;
  endif

  endwhile
  disp("La raíz de la función está en: ")
  disp(rk)
  disp(fRk)
endfunction
