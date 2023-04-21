function GaussSeidelAlternativoEspecifico

n = input("Ingrese filas y columnas de la matriz: ");
tol = input("Ingrese tolerancia: ");
iterMax = input("Ingrese maximas iteraciones deseadas: ");

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
  b(1) = -2;
  b(2) = 5;
  b(3) = 6;


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
  if D(i, i) != 0
    D(i, i) = ( 1 / D(i, i));
  else
    D(i, i) = 0;
  endif
endfor

%B es la matriz T
for i = 1: n
  for j = 1: n
    B(i, j) = (-D(i, i)) * B(i, j);
  endfor
endfor

%Defino Ti y Ts
for i = 1: n
  for j = 1: n
    if i > j
      Ti(i, j) = B(i, j);
      Ts(i, j) = 0;
    elseif j > i
      Ts(i, j) = B(i, j);
      Ti(i, j) = 0;
    else
      Ts(i, j) = 0;
      Ti(i, j) = 0;
    endif
  endfor
endfor

for i = 1: n
  c(i) = D(i, i) * b(i);
endfor

stop = 0;
iter = 0;

disp(Ts)
disp(Ti)
while stop == 0
  iter = iter + 1;
  Xv = X;

  for i = 1 : n
    if i == 1
      X(i) = 0;
      for j = 1: n
        X(i) = X(i) + Ts(i, j) * Xv(j);
      endfor
      X(i) = X(i) + c(i);
    else
      Xn = X;
      X(i) = 0;
      for j = 1: n
        X(i) = X(i) + Ti(i, j) * Xn(j) + Ts(i, j) * Xv(j);
      endfor
      X(i) = X(i) + c(i);
      Xv = Xn;
    endif
  endfor

  if (iter >= iterMax)
    stop = 1;
  endif
  for i= 1: n
    Xdif(i) = abs(X(i) - Xv(i));
  endfor
  norma = max(Xdif);
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
