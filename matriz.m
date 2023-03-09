function matriz
 
 disp("Matriz A")
 
  for i = 1 : 2
    for j = 1 : 2
      matrA(i, j) = input("Ingrese valor:");
    endfor
  endfor
  
  disp("Matriz B")
   for i = 1 : 2
    for j = 1 : 2
      matrB(i, j) = input("Ingrese valor:");
    endfor
  endfor
  
   for i = 1 : 2
    for j = 1 : 2
      matrC(i, j) = matrA(i, j) + matrB(i, j);
    endfor
  endfor
  
  disp("La matriz suma es: ")
  disp(matrC)
  
endfunction
