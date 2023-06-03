function RungeKuttaSistemasRepasoParcial
  g = 9.8;
  L = 1;
  h = 0.01;
  t = 0:h:10;
  y(:, 1) = [0; 2];
  A = [0, 1; -g/L , 0];
  w = 1/2;
  for i = 2: length(t)
    k1 = h * (A * y(:, i-1));
    xG = t(i-1) * (h / (2 * w));
    yG = y(i-1) * (k1 / (2*w));
    k2 = h * (A * yG);
    y(:, i) = y(:, i-1) + (1-w)*k1 + w * k2;
  endfor

  plot(t, y(1, :), t, y(2, :))

