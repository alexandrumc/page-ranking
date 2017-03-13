function [R1 R2 R3] =PageRank(nume, d, eps)
  R1=Iterative(nume,d,eps);
  %sunt apelate functiile pentru obtirea R1,R2 si R3
  N=length(R1);
  citire = fopen(nume,'r');
  B=textscan(citire,'%s','delimiter','\n');
  %se extrag val1 si val2
  val1=str2num(B{1}{N+2});
  val2=str2num(B{1}{N+3});
  fclose(citire);

  nume1=strcat(nume,'.out');
  scriere=fopen(nume1,'wt');
  fprintf(scriere,'%d\n',N);
  fprintf(scriere,'\n');
  fprintf(scriere,'%d\n',R1);
  fprintf(scriere,'\n');
  R2=Algebraic(nume,d);
  R3=Power(nume,d,eps);
  fprintf(scriere,'%d\n',R2);
  fprintf(scriere,'\n');
  fprintf(scriere,'%d\n',R3);
  fprintf(scriere,'\n');
  %Este sortat vectorul R2 cu ajutorul alg. Bubble-Sort
  S=Sortare(R2);
  %Se scrie in fisier in formatul cerut
  for i=1:N
    k=1;
    while (S(i)!=R2(k))
      k++;
    end
    F=Apartenenta(S(i),val1,val2);
    fprintf(scriere,'%d %d %d\n',i,k,F);
  end
  fclose(scriere);
endfunction
