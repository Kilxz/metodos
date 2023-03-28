function Jacobi
  A(1,1) = 3;
  A(1,2) = 1;
  A(1,3) = 2;
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

inicio = 0;

stop = 0;
i = 0;
while stop == 0
  i = i + 1;
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

  if i > iterMax
    stop = 1;
  endif
endwhile

disp("El vector x resultante es igual a: ")
disp(X)
endfunction
