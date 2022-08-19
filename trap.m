function [I]= trap(a,b,n,f,y1,ff,j)
h=(b-a)/(n-1);
x=linspace(a,b,n);
if ff~=0
    for i=1:n
    y(i)=f(x(i));
    end
    else 
        for i=0:n-1
        y(i+1)=y1(j-1+i);
        end
end
I=0;

for i=1:(n-1)
    I = I+ h*(y(i)+y(i+1))/2;
end
end