clc, clear, close all
f = @(x) 0.2+25.*x-200.*x.^2+675.*x.^3-900.*x.^4+400.*x.^5;
a=0;b=0.8;
%n=4;

x=[0 0.12 0.22 0.32 0.36 0.4 0.44 0.54 0.64 0.7 0.8];
n=size(x,2);

%even(a,b,n,f);
uneven(n,f,x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]= uneven(n,f,x)
h=x(2)-x(1);
k=1;
I=0;

x(n+1)=2*x(n)-x(n-1)+1;

for j=2:n
hf=x(j+1)-x(j);
    if  abs(h-hf)< 1e-6
        if k==3
            I=I+Simpson13(x(j-3),x(j-1),3,f);
            k=k-1;
        else
            k=k+1;
        end
    else
        if k==1
            I=I+trap(x(j-1),x(j),2,f);
        else 
            if k==2
                I=I+Simpson13(x(j-2),x(j),3,f);
            else
                I=I+Simpson38(x(j-3),x(j),4,f);
            end
            k=1;
        end
    end
    h=hf;
end    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[I]= even(a,b,n,f)
I=0;
h=(b-a)/(n-1);
m=n;
if n==2
    I=trap(a,b,n,f);
else
       m=n;
    if mod(n,2)==0 && n>2
        I=Simpson38(a,b,n,f);
        m=n-3;
    end
    if m > 1
        I=Simpson13(a,b,m,f);
    end
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [I]= trap(a,b,n,f)
h=(b-a)/(n-1);
x=linspace(a,b,n);
y=f(x);
I=0;

for i=1:(n-1)
    I = I+ h*(y(i)+y(i+1))/2;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [I]= Simpson13(a,b,n,f)
h=(b-a)/(n-1);
x=linspace(a,b,n);
y=f(x);
I=0;

for i=1:2:(n-2)
    I = I+ (h/3)*(y(i)+4*y(i+1)+y(i+2));
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [I]= Simpson38(a,b,n,f)
h=(b-a)/(n-1);
x=linspace(a,b,n);
y=f(x);
I=0;

for i=1:3:(n-3)
    I = I+ 3*(h/8)*(y(i)+3*y(i+1)+3*y(i+2)+y(i+3));
end
end

