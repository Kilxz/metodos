function aproximacion
  clc
  x = [0; 1; 1; 3; 4; 5; 6];
  y = [4; 7; 9; 10; 9; 12; 15];
  fi = hacerfi(x);
  fiT = transpose(fi);
  
  a = (fiT * fi) \ (fiT * y)
  funcion = a(1) * 1 + a(2) * x.+ a(3)*x.^2;
  plot(x,y,'o' , x,funcion)
  
endfunction


function fi = hacerfi(x)
  for i = 1: length(x)
    fi(i, 1) = 1;
    fi(i, 2) = x(i);
    fi(i, 3) = x(i)^2;
  endfor
  
endfunction
