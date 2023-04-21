function GaussSeidel
  A(1,1) = -3;
  A(1,2) = 1;
  A(1,3) = -2;
  A(2,1) = 4;
  A(2,2) = -5;
  A(2,3) = 0;
  A(3,1) = 1;
  A(3,2) = -3;
  A(3,3) = 6;
  X(1) = 0;
  X(2) = 0;
  X(3) = 0;
  B(1) = -2;
  B(2) = 5;
  B(3) = 6;

tol = input("Ingrese tolerancia maxima: ");
iterMax = input("Ingrese maxima cantidad de iteraciones: ");
n = 3
inicio = 0;

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
      stop = 1;A(i, j) * Xv(j)
    endif
  endif

  if iter >= iterMax
    stop = 1;
  endif
endwhile

disp("El vector x resultante es igual a: ")
disp(X)
disp("Con una cantidad de iteraciones de: ")
disp(iter)
endfunction


