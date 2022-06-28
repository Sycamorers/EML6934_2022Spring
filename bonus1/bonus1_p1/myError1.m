%using numerical method to solve the problem 
function [E,t,p] = myError1(lambda0, x0, t0, xf, tf)
    p0 = [x0; lambda0]; %initial conditions of p = [x; lambda]
    options = odeset('RelTol',1e-8); %create an options structure
    tspan = [t0,tf];
    %the differential equation: pdot = [-1 -1; -1 1]p
    myOde = @(t, p)[-p(1)-p(2);...  %x_dot = -x-lambda 
                    -p(1)+p(2)];    %lambda_dot = -x+lambda 
    
    [t, p] = ode113(myOde,tspan,p0,options); % solve the differential equations with ode113
    ptf = p(end, :);  %get the final state 
    xtf = ptf(1);     %get the final x
    E = xtf - xf;     %get the error {x(tf) in general doesn't equal to xf}
end
