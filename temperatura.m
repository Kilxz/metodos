function temperatura
  %4 ya que 24/6 = 4. Es decir, 4 veces
  n = 4;
  for i=1 :4
    temp(i) = input("Ingrese temperatura: ");
  endfor
  mayor = temp(1);
  menor = temp(1);
  for i=2 : 4
    if (mayor < temp(i))
      mayor = temp(i);
    endif
    if (menor > temp(i))
      menor = temp(i);
    endif
  endfor
  
  disp("La mayor temperatura registrada es: "), mayor
  disp("La menor temperatura registrada es: "), menor
endfunction
