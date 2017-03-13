function R = Iterative(nume, d, eps)
  citire = fopen(nume,'r');
  %se citeste fisierul in bloc
  B=textscan(citire,'%s','delimiter','\n');
  %se extrage N-ul
  N=str2num(B{1}{1});
  %se formeaza matricea de adiacenta si
  %se retine numarul de legaturi al fiecarei componente
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
  %se construieste matricea M
  for i=1:N
    for j=1:N
      if A(j,i)==1
        M(i,j)=1/l(j);
      else
        M(i,j)=0;
      end
    end
  end
  %l
  %M
  R0=zeros(N,1);
  R0(:,:)=1/N;
  %R=zeros(N,1);
  col=ones(N,1);
  R=d*M*R0+(1-d)/N*col;
  %se formeaza R
  while norm(R-R0,2) >eps
    R0=R;
    R=d*M*R0+(1-d)/N*col;
  endwhile
endfunction
