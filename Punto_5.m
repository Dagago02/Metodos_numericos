syms x a b c d

fx1 = 3 + x -9*x^3;
fx2 = a +b*(x-1)+c*(x-1)^2+d*(x-1)^3;
dfx1 = diff(fx1);
dfx2 = diff(fx2);
ddfx1 = diff(fx1,2);
ddfx2 = diff(fx2,2);

disp('Funcion del problema');
% image(imread('punto5_funcion.jpeg'))
disp('Igualamos y evaluamos en el punto x = 1')
fx1==fx2
a_ = double(solve(subs(fx1==fx2,x = 1),a))
disp('Igualamos y evaluamos la derivada de fx1 y fx2 en x = 1')
dfx1 == dfx2
b_ = double(solve(subs(dfx1==dfx2,x=1),b))
disp('Igualamos y evaluamos la segundo derivada de fx1 y fx2 en x = 1')
ddfx1 == ddfx2
c_ = double(solve(subs(ddfx1==ddfx2,x=1),c))
disp('Igualamos y evaluamos la segunda derivada de fx2 en el extremo que es x = 2')
d_ = double(solve(subs(ddfx2==0,[x,c],[2,c_]),d))

fx2_new = subs(fx2,[a,b,c,d],[a_,b_,c_,d_])