function Lgrange=Lgrange(x,y,n,xint) %%,xint
sum=0;
for i=1:n
    product=y(i);
    for j=1:n
        if(i~=j)
            product=product*(xint-x(j))/(x(i)-x(j));
        end
    end
    sum=sum+product;
end
Lgrange=sum;
end