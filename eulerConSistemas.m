function eulerConSistemas
  g = 9.8;
  l = 1;
  h = 0.1;
  x = 0:h:10;
  matriz = [0, 1; -g/l , 0];
  y(1,1) = 0
  y(2,1) = 2
  for i = 2: length(x)
    ym = [y(1,i-1); y(2,i-1)];
    y(:,i) = ym + h * (matriz * ym);
  endfor
  plot(x, y(1,:), x, y(2,:))
endfunction
