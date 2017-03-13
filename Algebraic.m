function R = Algebraic(nume,d)
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
  %construirea inversei cu ajutorul alg. G-M
  %si a alg. SST
  % s-a evitat, astfel, folosirea de mai multe ori a G-M
  I=eye(N);
  H=I-d*M;
  [Q L]=Gram_Schmidt(H);
  K=zeros(N);
  for i=1:N
    e=zeros(N,1);
    e(i)=1;
    v=Q'*e;
    x=SST(L,v);
    K(:,i)=x;
  end
  col=ones(N,1);
  %se calculeaza R
  R=K*((1-d)/N)*col;
endfunction
