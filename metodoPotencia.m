function metodoPotencia
  n = input("Ingrese la cantidad de filas de la matriz: ");
  A = pedirMatriz(n);
  X = pedirVector(n);
  
  stop = 0;
  iter = 0;
  while stop == 0
    iter = iter + 1;
    X = normalizar(X, n);
    Xn = A * X;
    
    for i = 1: n
      a(i) = Xn(i) / X(i);
    endfor
    
    convergencia = abs((transpose(Xn) * Xn) / transpose(Xn) * X)
    if iter >= 50
      stop = 1
    endif
    if convergencia < tol
      stop = 1
    endif
  endwhile
  
endfunction
disp("El vector resultado es: ")
disp(X)
disp("Con una cantidad de iteraciones de: ")
disp(iter)

function A = pedirMatriz(n)
  for i = 1: n
    for j = 1: n
      disp("Elemento"), disp(i), disp("x"), disp(j);
      A(i, j) = input("Ingrese valor del elemento de A: ");
    endfor
  endfor
endfunction

function B = pedirVector(n)
  for i = 1: n
    disp("Elemento"), disp(i);
    B(i) = input("Ingrese valor del elemento de b: ");
  endfor
endfunction

function vector = normalizar(vector, n)
  bigger = vector(1)
  for i = 1 : n
    if bigger < vector(i)
      bigger = vector(i)
    endif
  endfor
  
  for i = 1: n
    vector(i) = vector(i) / bigger
  endfor
  return
endfunction
