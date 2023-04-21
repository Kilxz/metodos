function Jacobi
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

inicio = 0;

stop = 0;
iter = 0;
while stop == 0
  iter = iter + 1;
  Xv(1) = X(1);
  Xv(2) = X(2);
  Xv(3) = X(3);
  X(1) = (B(1) - A(1,2) * Xv(2) - A(1,3) * Xv(3)) * (1/ A(1,1));
  X(2) = (B(2) - A(2,1) * Xv(1) - A(2,3) * Xv(3)) * (1/ A(2,2));
  X(3) = (B(3) - A(3,1) * Xv(1) - A(3,2) * Xv(2)) * (1/ A(3,3));

  if iter != 1
    for i = 1: 3
      error(i) = (X(i) - Xv(i));
    endfor
    e = max(error)
    if abs(e) < tol
      stop = 1;
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
