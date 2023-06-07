%Tomás Rando - 14004 - LCC - Parcial 3 - Métodos Numéricos
function ParcialRandoTomas3
clc
clear

%Diferencia Central
b = [10; 5; 5; 5];
M = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
K = [2, -1, 0, 0; -1, 2, -1, 0; 0, -1, 2, -1; 0, 0, -1, 2];
h = 1/10;
t = 0:h:150;
Minv = inv(M);
G = Minv * (-(h^2) * K + 2 * M);
D = Minv * (-M);
y(:, 1) = [0; 0; 0; 0];
derivadaI = [0; 0; 0; 0];
yant = y(:, 1) - h * derivadaI + ((h^2)/2) * (Minv * (b * g(0) - K * y(:, 1)));
for i = 1: length(t) - 1
  if i == 1
    y(:, i + 1) = Minv * (b * g(t(i)) * (h^2)) + G * y(:, i) + D * yant;
  else
    y(:, i + 1) = Minv * (b * g(t(i)) * (h^2)) + G * y(:, i) + D * y(:, i - 1);
  endif
  if (t(i)) == 50
    disp("b. Solución z1(t) en t = t1:");
    disp(y(1, i))
  endif
endfor

plot(t, y(3, :), t, y(4, :))

%Derivada Z3 utilizando derivadas de orden de error 2
for i = 1 : length(t)
  if i == 1
    v3(i) = (1 / (2 * h)) * (-3 * y(3, i) + 4 * y(3, i + 1) -1 * y(3, i + 2));
  elseif i == length(t)
    v3(i) = (1 / (2 * h)) * (3 * y(3, i) -4 * y(3, i - 1) + 1 * y(3, i -2));
  else
    v3(i) = (1 / (2 * h)) * (y(3, i + 1) - y(3, i - 1));
  endif
endfor

%Integral utilizando Simpson Compuesto
I = (v3(1)^2) + v3(length(v3))^2;
for i = 2: length(v3) - 1
  if mod(i, 2) == 0
    I = I + 4 * (v3(i)^2);
  else
    I = I + 2 * (v3(i)^2);
  endif
endfor
I = (h / 3) * I;
disp("e. El valor de la integral es: ");
disp(I);
endfunction

function g = g(x)
  if x > 50
    g = 0;
  else
    g = (-1/50) * x + 1;
  endif
endfunction
