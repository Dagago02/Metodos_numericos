function f = newton(x, y)
    B = get_bis(x,y);
    f = make_pol(x,B);
end

function f = make_pol(x, B)
    xx = x; 
    syms x
    f = B(1);
    for i = 2:length(B)
        part = 1;
        for xi = xx(1:i-1)
            part = part * (x - xi);
        end
        f = f + B(i)*part;
    end
    f = simplify(f);
end

function B = get_bis(x, y)
    B = [];
    for i = 1:length(x)
        B(i) = difdiv(x(1:i), y(1:i));
    end
end

function bi = difdiv(x, y)
    n = length(x);
    if n == 1
        bi = y;
    else
        bi = (difdiv(x(2:end), y(2:end)) - difdiv(x(1:end-1), y(1:end-1))) / (x(end) - x(1));
    end
end