
function serie
  n = input("Ingrese valor de x: ");
  tol = input("Ingrese tolerancia: ");
  suma = 0;
  valor = 1;
  i = 1;

  while (valor > tol)
    valores(i) = valor;
    cantidades(i) = i;
    suma = suma + valor;
    factorial = 1;
    for j=1: i
      factorial = factorial * j;
    endfor
    valor = (n^i) / factorial;
    i = i + 1;
   
  endwhile
  i = i - 1;
  disp("La soluciòn es: "); suma
  disp("La cantidad de terminos considerados fue de: "); i
  plot(cantidades, valores)

  endfunction
