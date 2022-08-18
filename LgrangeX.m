function LgrangeX=LgrangeX(x,y,n) %%,xint
sum=0;
syms xint
for i=1:n
    product=y(i);
    for j=1:n
        if(i~=j)
            product=product*(xint-x(j))/(x(i)-x(j));
        end
    end
    sum=sum+product;
end
LgrangeX=sum;
end