clc,clear;
syms n integer;
syms A(n);
syms x real;
syms y(x);
syms x real;

y_coeffs = [1 0];
yp_coeffs = [-1];
ypp_coeffs = [0];

y_coeffs = fliplr(y_coeffs);
yp_coeffs = fliplr(yp_coeffs);
ypp_coeffs = fliplr(ypp_coeffs);

min_power = max([size(y_coeffs,2),size(yp_coeffs,2),size(y_coeffs,2)])-1;
fprintf("The minimum power in the summation will be x^%d\n\n\n\n\n",min_power);



leading = 0;
F = 0;

for i=1:length(y_coeffs)
    power = i - 1;
    coeff = y_coeffs(i);
    if coeff ~= 0
        [L,F2] = SumSimplifierFunction(y_coeffs(i)*A(n),0,power,0,min_power);
        leading = leading + L;
        F = F + F2;
        fprintf("For term (%dx^%d) y, L = %s, F = %s\n",y_coeffs(i),power,L,F2);
        pretty(coeff*x^power*y == L + symsum(F2,n,0,inf));
    end
end

for i=1:length(yp_coeffs)
    power = i - 1;
    coeff = yp_coeffs(i);
    if coeff ~= 0
        [L,F2] = SumSimplifierFunction(yp_coeffs(i)*A(n)*n,1,power-1,0,min_power);
        leading = leading + L;
        F = F + F2;
        fprintf("For term (%dx^%d) y', L = %s, F = %s\n",yp_coeffs(i),power,L,F2);
        pretty(coeff*x^power*diff(y,x) == L + symsum(F2,n,0,inf));
    end
end

for i=1:length(ypp_coeffs)
    power = i - 1;
    coeff = ypp_coeffs(i);
    if coeff ~= 0
        [L,F2] = SumSimplifierFunction(ypp_coeffs(i)*A(n)*n*(n-1),2,power-2,0,min_power);
        leading = leading + L;
        F = F + F2;
        fprintf("For term (%dx^%d) y', L = %s, F = %s\n",ypp_coeffs(i),power,L,F2);
        pretty(coeff*x^power*diff(y,x,x) == L + symsum(F2,n,0,inf));
    end
end


fprintf("Final form:\n\n");
pretty(leading + symsum(simplify(F),n,0,inf))
