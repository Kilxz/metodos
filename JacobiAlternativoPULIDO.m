function JacobiAlternativoPULIDO
  clc
  clear
  format long g
  A = [50, -25, 0, 0; -25, 50, -25, 0; 0, -25, 50, -25; 0, 0, -25, 50];
  b = [10; 20; 20; 10];

  for i = 1: length(A)
    for j = 1: length(A)
      if i == j
        D(i, i) = A(i, i);
        B(i, j) = 0;
      else
        D(i, j) = 0;
        B(i, j) = A(i, j);
      endif
    endfor
  endfor

  for i = 1: length(D)
    D(i, i) = 1 / D(i, i);
  endfor
  T = -D * B;
  c = D * b;
  tol = 0.01;
  iterMax = 50;
  stop = 0;
  xv = [0; 0; 0; 0];
  iter = 0;
  while stop != 1
    iter = iter + 1;
    xn = T * xv + c;

    for i = 1: length(xn)
      xdif(i) = abs(xn(i) - xv(i));
    endfor
    if max(xdif(i)) <= tol
      stop = 1;
    endif
    if iter >= iterMax
      stop = 1;
    endif
    xv = xn;
  endwhile
  disp("Solución real");
  rta = inv(A) * b
  disp("Vector resultado = ")
  disp(xn)
  iter
endfunction


