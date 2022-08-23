%  g=input('ingrese la funcion: ','s');
%  f=inline(g);
%  a=input('ingrese el extremo inferior de la integral: ');
%  b=input('ingrese el extremo superior de la integral: ');
%  e=input('ingrese el error de la aproximacion: ');
function Romberg=Romberg(g,a,b,e)
% f=inline(g);
f=g;
n=0;
S=0;
h=0;
iteraciones=1;
while 1
  ancho=2^n;
  h=(b-a)/ancho;
  aux=a;
  for i=1:ancho
       S=S+(h/2)*(f(aux)+f(aux+h));
       aux=aux+h; 
  end
  R(iteraciones,1)=S;
  if n>0
     aux=n;
     for k=2:iteraciones
         for j=1:aux
            R(j,k)=(4^(k-1)*R(j+1,k-1)-R(j,k-1))/(4^(k-1)-1);
         end
         aux=aux-1;
     end
     error=(abs(R(1,iteraciones)-R(2,iteraciones-1))/R(1,iteraciones));
     if error <=e
     break;
     end
   end
   S=0;
   n=n+1;
   iteraciones=iteraciones+1;

end
% x=linspace(a,b,2^n+1);
% y=f(x);
% plot(x,y);
% hold on

% for i=1:2^n
%  plot([x(i),x(i)],[0,y(i)]);
% end
% R
Romberg=R(1,iteraciones)
end