%RANDO MUÑOZ Tomás - 14004 - Licenciatura en Ciencias de la Computación 
clc
format long g

disp("Aproximación con mínimos cuadrados")
X = [-0.75, -0.25, 0.25, 0.75, 1.25];
Y = [1032, 824, 824, 1032, 1504];
yaprox = [1032; 824; 824; 1032; 1504];
for i = 1 : 2
  for j = 1 : 5
    if (i == 1)
      fi(j, i) = exp(X(j));
    else
      fi(j, i) = exp(-X(j));
    endif
  endfor
endfor
disp("fi")
disp(fi)
A = transpose(fi) * fi;
disp("A")
disp(A)
b = transpose(fi) * yaprox;
disp("b")
disp(b)
sol = inv(A) * b;
disp("Solución del sistema: ")
disp(sol)
n = 5;
h = 0.5;
suma = 0;
suma = Y(5) + Y(1);
for i = 2: n-1
  if mod(i, 2) == 0
    suma = suma + 4 * Y(i);
  else
    suma = suma + 2 * Y(i);
  endif
endfor

simpson = (h/3) * suma;
disp("Simpson multiple")
disp(simpson)

trapMult = (Y(1) / 2) + (Y(n) / 2);
for i = 2 : n-1
  trapMult = trapMult + Y(i);
endfor
trapMult = trapMult * h;

disp("Trapecios múltiples h = 0.5")
disp(trapMult)

X2 = [-0.75, 0.25, 1.25];
Y2 = [1032, 824, 1504];
h2 = 1;
n2 = 3;
trapMult2 = Y2(1)/2 + Y2(n2)/2;
trapMult2 = trapMult2 + Y2(2);
trapMult2 = h2 * trapMult2;
disp("Trapecios múltiples h = 1")
disp(trapMult2)

B = (h / h2) ^2;
richardson = (B * trapMult2 - trapMult) / (B - 1);
disp("Richardson")
disp(richardson)

