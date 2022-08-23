function LgrangeX=LgrangeX(x,y,n) %%,xint
sum=0;
syms z
for i=1:n
    product=y(i);
    for j=1:n
        if(i~=j)
            product=product*(z-x(j))/(x(i)-x(j));
        end
    end
    sum=sum+product;
end
LgrangeX=sum;
end