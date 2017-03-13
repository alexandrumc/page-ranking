function [R] = Power(nume,d,eps)
  citire = fopen(nume,'r');
  B=textscan(citire,'%s','delimiter','\n');
  N=str2num(B{1}{1});
  A=zeros(N,N);
  for i=2:(1+N)
    y=str2num(B{1}{i});
    l(end+1)=y(2);
    for j=3:length(y)
      if (y(1)!=y(j))
        A(y(1),y(j))=1;
      else
        l(end)=l(end)-1;
      end
    end
  end
  for i=1:N
    A(i,i)=0;
  end
  for i=1:N
    for j=1:N
      if A(j,i)==1
        M(i,j)=1/l(j);
      else
        M(i,j)=0;
      end
    end
  end
  E=ones(N,N);
  %se construieste matricea P
  P=d*M+((1-d)/N)*E;
  y=ones(N,1);
  %i se aplica metoda puterii directe pentru determinarea
  %vectorului propriu
  R=Putere(P,y,eps);
endfunction
