# Series Solution Helper
This is a quick MATLAB script to help with the infinite series method for ordinary differential equations. The script uses the Symbolic Math Toolbox.
## Example
Consider the ODE:

<img src="https://render.githubusercontent.com/render/math?math=x^2 y''%2B x y' %2B (x^2 - 4)y = 0">

With a solution of the form &nbsp; <img src="https://render.githubusercontent.com/render/math?math=y(x) = \sum_{n=0}^{\infty}A_nx^n">

Plug the coefficients into the script like so:

    y_coeffs = [1 0 -4];
    yp_coeffs = [1 0];
    ypp_coeffs = [1 0 0];

The program outputs:


    For term (-4x^0) y, L = - 4*A(0) - 4*x*A(1), F = -4*x^(n + 2)*A(n + 2)
                                       /  Inf                 \
                                       |  ---                 |
                                       |  \    n + 2          |
    -4 y(x) == - 4 A(0) - 4 x A(1) - 4 |  /   x      A(n + 2) |
                                       |  ---                 |
                                       \ n = 0                /
    
    For term (1x^2) y, L = 0, F = x^(n + 2)*A(n)
                Inf
                ---
     2          \    n + 2
    x  y(x) ==  /   x      A(n)
                ---
               n = 0
    
    For term (1x^1) y', L = x*A(1), F = x^(n + 2)*A(n + 2)*(n + 2)
                          /  Inf                         \
                          |  ---                         |
       d                  |  \    n + 2                  |
    x -- y(x) == x A(1) + |  /   x      A(n + 2) (n + 2) |
      dx                  |  ---                         |
                          \ n = 0                        /
    
    For term (1x^2) y', L = 0, F = x^(n + 2)*A(n + 2)*(n + 1)*(n + 2)
                    Inf
         2          ---
     2  d           \    n + 2
    x  --- y(x) ==  /   x      A(n + 2) (n + 1) (n + 2)
         2          ---
       dx          n = 0
    
    Final form:
    
    /  Inf                                            \
    |  ---                                            |
    |  \    n + 2          2                          |
    |  /   x      (A(n) + n  A(n + 2) + 4 n A(n + 2)) | - 3 x A(1) - 4 A(0)
    |  ---                                            |
    \ n = 0                                           /


