function JacobiSegundaVersion

  A(1,1) = 8;
  A(1,2) = -2;
  A(1,3) = 0;
  A(1,4) = 0;
  A(2,1) = -2;
  A(2,2) = 10;
  A(2,3) = -4;
  A(2,4) = 0;
  A(3,1) = 0;
  A(3,2) = -4;
  A(3,3) = 10;
  A(3,4) = -2
  A(4,1) = 0;
  A(4,2) = 0;
  A(4,3) = -2;
  A(4,4) = 8;
  X(1) = 0;
  X(2) = 0;
  X(3) = 0;
  B(1) = -2;
  B(2) = 5;
  B(3) = 6;
tol = input("Ingrese tolerancia maxima: ");
iterMax = input("Ingrese maxima cantidad de iteraciones: ");

inicio = 0;

stop = 0;
iter = 0;
while stop == 0
  iter = iter + 1;
  Xv(1) = X(1);
  Xv(2) = X(2);
  Xv(3) = X(3);
  for i = 1: 3
    sum = 0;
    for j = 1:3
      if (j != i)
        sum = sum + A(i, j) * Xv(j);
      endif
    endfor
   X(i) = (B(i) - sum) / A(i, i);
  endfor

  for i = 1: 3
    Xdif(i) = abs(X(i) - Xv(i));
  endfor
  norma = max(Xdif);
  if norma < tol
    stop = 1;
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

function norma = normaCuadratica(vector, n)

norma = 0;
for i = 1: n
  norma = norma + (vector(i))^2;
endfor

norma = sqrt(norma);

endfunction
