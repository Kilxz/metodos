function GaussSeidel
  X(1) = 0;
  X(2) = 0;
  X(3) = 0;

n = input("Ingrese cantidad de filas de la matriz: ");
condition = 0;
while condition == 0
  A = pedirMatriz(n);
  condition = diagonalDominante(A, n);
  disp(condition)
  if condition == 0
    disp("ERROR, SU MATRIZ NO ES DIAGONAL DOMINANTE, REINGRESE")
  endif
endwhile

B = pedirVector(n);
tol = input("Ingrese tolerancia maxima: ");
iterMax = input("Ingrese maxima cantidad de iteraciones: ");

stop = 0;
iter = 0;
while stop == 0
  iter = iter + 1;
  Xv(1) = X(1);
  Xv(2) = X(2);
  Xv(3) = X(3);
  for i = 1: n
    sum = 0;
    for j = 1: n
      if (j != i)
        if j>i
          sum = sum + A(i, j) * Xv(j);
        else
          sum = sum + A(i, j) * X(j);
        endif
      endif
    endfor
  X(i) = (B(i) - sum) / A(i, i);
  endfor
  if i != 1
    for i = 1: 3
      error(i) = (abs(X(i) - Xv(i))) / abs(X(i));
    endfor
    e = error(i);
    for i = 2: 3
      if error(i) > e
        e = error(i);
      endif
    endfor
    if e < tol
      stop = 1;
    endif
  endif

  if iter > iterMax
    stop = 1;
  endif
endwhile

disp("El vector x resultante es igual a: ")
disp(X)
disp("Con una cantidad de iteraciones de: ")
disp(iter)
endfunction

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

function condition = diagonalDominante(A, n)
  condition = 1;
  for i = 1: n
    valor = abs(A(i, i));
    suma = 0;
    for j = 1: n
      if j != i
        suma = suma + abs(A(i, j));
      endif
    endfor
    if valor < suma
      condition = 0;
      return
    endif
  endfor
endfunction

