function [leading,F] = SumSimplifierFunction(An,n2,k2,n1,k1)
    syms n integer;
    syms A(n);
    syms x real;

    syms F(n)
    F(n) = An;

    n2s = n2 -k1 + k2;
    F(n) = subs(F(n),n,n-k2+k1);
    leading = symsum(F(n)*x^(n+k1),n,n2s,n1-1);

    F = F(n)*x^(n+k1);
end

