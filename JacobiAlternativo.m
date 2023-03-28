function JacobiAlternativo

n = input("Ingrese filas y columnas de la matriz: ");
tol = input("Ingrese tolerancia: ");
iterMax = input("Ingrese maximas iteraciones deseadas: ");

for i = 1: n
  for j = 1: n
    disp("Elemento"), disp(i), disp("x"), disp(j);
    A(i, j) = input("Ingrese valor del elemento de A: ");
  endfor
endfor

for i = 1: n
    disp("Elemento"), disp(i);
    X(i) = input("Ingrese valor del elemento de x: ");
endfor

for i = 1: n
  disp("Elemento"), disp(i);
  b(i) = input("Ingrese valor del elemento de b: ");
endfor

for i = 1: n
  for j = 1: n
    if j == i
      D(i, i) = A(i, i);
      B(i, i) = 0;
    else
      D(i, j) = 0;
      B(i, j) = A(i, j);
    endif
  endfor
endfor

for i = 1: n
  D(i, i) = ( 1 / D(i, i));
endfor

for i = 1: n
  for j = 1: n
    B(i, j) = (-D(i, i)) * B(i, j);
  endfor
endfor

for i = 1: n
  c(i) = D(i, i) * b(i);
endfor

stop = 0;
iter = 0;
while stop == 0
  iter = iter + 1;
  for i = 1: n
    Xv(i) = X(i);
  endfor

  for i = 1: n
    X(i) = 0;
    for j = 1: n
      X(i) = X(i) + B(i, j) * Xv(j);
    endfor
    X(i) = X(i) + c(i);
    Xdif(i) = Xv(i) - X(i);
  endfor

  if (iter >= iterMax)
    stop = 1;
  endif

  norma = normaCuadratica(Xdif, n);
  if norma <= tol
    stop = 1;
  endif
endwhile
disp("El vector resultado es: ");
disp(X)
disp("Con una cantidad de iteraciones de: ")
disp(iter)
endfunction

function norma = normaCuadratica(vector, n)

norma = 0;
for i = 1: n
  norma = norma + (vector(i))^2;
endfor

norma = sqrt(norma);

endfunction
