function [I]= SimpsonX13(a,b,n)
h=(b-a)/(n-1);
x=linspace(a,b,n);
syms xint;
y=[5 8 6 3 0 -3 -3 xint 5];
I=0;

for i=1:2:(n-2)
    I = I+ (h/3)*(y(i)+4*y(i+1)+y(i+2));
end
end

