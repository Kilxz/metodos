function biseccion
  a = input("Ingrese primer número del invervalo: ");
  b = input("Ingrese segundo número del invervalo: ");
  
  stop = 0;
  iter = 0;
  while stop == 0
 %Cálculo de variables
  fA = a - 2^(-a);
  fB = b - 2^(-b);
  rk = (a + b) / 2;
  fRk = rk - 2^(-rk);
  iter = iter + 1;
 
 %Condiciones de parada
  if abs(fRk) <= 0.03
    stop = 1;
  endif
 
  if iter > 50
    stop = 1;
  endif
% Modificación de a o b 
  if stop == 0
    if fA * fRk < 0
      b = rk;
    else
      if fB * fRk < 0
        a = rk;
      endif
    endif
  endif
  endwhile

disp("La raíz de la función está en: ")
disp(rk)

endfunction
