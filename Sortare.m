function v = Sortare(v)
  n=length(v);
  while (n>0)
    k=0;
    for i=2:n
      if (v(i)>v(i-1))
        v=swap(v,i,i-1);
        k=i;
      end
    end
    n=k;
  end
endfunction
