function[I]= Simpsonuneven(n,f,x,y1,ff)
h=x(2)-x(1);
k=1;
I=0;

x(n+1)=2*x(n)-x(n-1)+1;

for j=2:n
hf=x(j+1)-x(j);
    if  abs(h-hf)< 1e-6
        if k==3
            I=I+Simpson13(x(j-3),x(j-1),3,f,y1,ff,j);
            k=k-1;
        else
            k=k+1;
        end
    else
        if k==1
            I=I+trap(x(j-1),x(j),2,f,y1,ff,j);
        else 
            if k==2
                I=I+Simpson13(x(j-2),x(j),3,f,y1,ff,j);
            else
                I=I+Simpson38(x(j-3),x(j),4,f,y1,ff,j);
            end
            k=1;
        end
    end
    h=hf;
end    
end





