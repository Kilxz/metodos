function metodoPotencia

  n = input("Ingrese la cantidad de filas de la matriz: ");
  tol = input("Ingrese tolerancia deseada: ");
  iterMax = input("Ingrese cantidad maxima de iteraciones deseada: ");
  A = pedirMatriz(n);
  X = pedirVector(n);

  stop = 0;
  iter = 0;
  while stop == 0
    iter = iter + 1;
    norma = normainfinito(X, n);
    for i = 1: n
      X(i) = X(i) / norma;
    endfor

    for i = 1: n
      Xn(i) = 0;
      for j = 1: n
        Xn(i) = Xn(i) + A(i, j) * X(j);
      endfor
    endfor

    for i = 1: n
      a(i) = Xn(i) / X(i);
    endfor

    convergencia = abs((Xn * transpose(Xn)) / (X * transpose(X)));
    for i = 1: n
      Xdif(i) = Xn(i) - X(i);
    endfor
    norma = normacuadratica(Xdif, n);
    if norma <= tol
      stop = 1;
    endif
    X = Xn;
    if iter >= iterMax
      stop = 1;
    endif
    if convergencia == 1
      stop = 1;
    endif

  endwhile

  disp("El vector resultado es: ")
  disp(X)
  disp("Con una cantidad de iteraciones de: ")
  disp(iter)
  disp(a)
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

function norma = normainfinito(vector, n)
  bigger = abs(vector(1));
  for i = 1 : n
    if bigger < abs(vector(i))
      bigger = abs(vector(i));
    endif
  endfor
  norma = bigger;
  return
endfunction

function norma = normacuadratica(vector, n)

norma = 0;
for i = 1: n
  norma = norma + (vector(i))^2;
endfor

norma = sqrt(norma);

endfunction
