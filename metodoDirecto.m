function metodoDirecto
x = [0, 1, 2];
y = [0, 2, 0];
for i = 1: 3
  for j = 1: 3
    if i == 1
      matriz(j, i) = 1;
    endif
    if i == 2
      matriz(j, i) = x(j);
    endif
    if i == 3
      matriz(j, i) = x(j)^2;
    endif
  endfor
endfor
disp(matriz)
a = GaussSeidel(matriz, y);
disp("Los coeficientes son:")
disp(a)


endfunction

function X = GaussSeidel(A, B)
  X(1) = 0;
  X(2) = 0;
  X(3) = 0;

n = length(X);
condition = 0;
tol = 0.001;
iterMax = 50;

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
      if X(i) != 0
        error(i) = (abs(X(i) - Xv(i))) / abs(X(i));
      elseif
        error(i) = 0
      endif
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
endfunction
