function metodoPotencia
  n = input("Ingrese la cantidad de filas de la matriz: ");
  tol = input("Ingrese tolerancia deseada: ")
  A = pedirMatriz(n);
  X = pedirVector(n);

  stop = 0;
  iter = 0;
  while stop == 0
    iter = iter + 1;
    norma = normacuadratica(X, n);
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
    X = Xn;
    convergencia = normacuadratica(transpose(Xn) * Xn, n) / normacuadratica(transpose(Xn) * X, n);
    if iter >= 50
      stop = 1;
    endif
    if convergencia <= tol
      stop = 1;
    endif

  endwhile

  disp("El vector resultado es: ")
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

function vector = normalizar(vector, n)
  bigger = vector(1);
  for i = 1 : n
    if bigger < vector(i)
      bigger = vector(i);
    endif
  endfor

  for i = 1: n
    vector(i) = vector(i) / bigger;
  endfor
  return
endfunction

function normacuadratica = normacuadratica(X, n)
  normacuadratica = 0;
  for i = 1: n
    normacuadratica = normacuadratica + (X(i))^2 ;
  endfor
  normacuadratica = sqrt(normacuadratica);
endfunction
