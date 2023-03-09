function vector
  for j = 1 : 3
    v1(j) = input("Ingrese componente: ");
  endfor
  
  norma = 0;
  for j = 1 : 3
    norma = norma + (v1(j))^2;
  endfor
  norma = sqrtm(norma);
  
  disp("La norma cuadratica del vector es: "); norma
  
  for j = 1 : 3
    v1(j) = v1(j) / norma;
  endfor
  
  disp("El vector normalizado es: "); v1
endfunction
