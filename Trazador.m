x=[1 4 6 5 3 1.5 2.5 3.5];
y=[0 1.3862944 1.7917595 1.6094379 1.0986123 0.4054641 0.9162907 1.2527630];
n=length(x);
f= @(x) logx;
derivadas3(x,y,n,2)



function derivadas3=derivadas3(x,y,n,a)
for i=1:n-1
    h(i)=x(i+1)-x(i);
end
for i=1:n-2
    u(i)=2*(x(i+2)-x(i));
end
for i=2:n-1
    V(i-1)=(6/h(i))*(y(i+1)-y(i))+(6/h(i-1))*(y(i-1)-y(i));
end
for i=1:n-2
    A(i,i)=u(i);
end
for i=2:n-2
    A(i,i-1)=h(i);
end
for i=1:n-3
    A(i,i+1)=h(i+1);
end

Z=V/A;
Z(1)=0;
Z(n-1)=0;

derivadas3=(x(a)-x(a-1))*Z(a-1)+2*(x(a+1)-x(a-1))*Z(a)+(x(a+1)-x(a))*Z(a+1)


end
