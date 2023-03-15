function regulaFalsi
  a = input("Ingrese el primer número del invervalo: ");
  b = input("Ingrese el segundo número del invervalo: ");
  tol = input("Ingrese tolerancia deseada: ");
  
  stop = 0;
  iter = 0;
  
  while stop == 0
    fA = a - 2^(-a);
    fB = b - 2^(-b);
    m = (fA - fB) / (a - b);
    rk = a - (fA / m); 
    iter = iter + 1;
    fRk = rk - 2^(-rk);
  %Condiciones de parada     
  if abs(fRk) < tol
    stop = 1;
  endif
  if iter > 50
    stop = 1;    
  endif
  
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
