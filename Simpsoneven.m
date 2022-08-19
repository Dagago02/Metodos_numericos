function[I]= Simpsoneven(a,b,n,f,y1,ff,j)
I=0;
h=(b-a)/(n-1);
m=n;
if n==2
    I=trap(a,b,n,f,y1,ff,j);
else
       m=n;
    if mod(n,2)==0 && n>2
        I=Simpson38(a,b,n,f,y1,ff,j);
        m=n-3;
    end
    if m > 1
        I=Simpson13(a,b,m,f,y1,ff,j);
    end
end
end