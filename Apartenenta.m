function y = Apartenenta(x,val1,val2)
  %se calculeaza a si b a.i. functia sa fie cont.
  %se fac limitele la stanga si la dreapta si se 
  %rezolva sistemul de 2 ecuatii
  a=1/(val2-val1);
  b=-a*val1;
  %se dau valori in functie de ramura 
  if x>=0 && x<val1
    y=0;
  end
  if x>=val1 && x<=val2
    y=a*x+b;
  end
  if x>val2 && x<=1
    y=1;
  end
endfunction

