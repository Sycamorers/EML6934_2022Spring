% initial conditions 
clc
clear 
x0 = 1;
xf = 1;
t0 = 0;
tf = 20;
lambda0 = 0;
% if E(lambda0) > epsilon then loop back using the most recent lambda0 
options = optimset('display','Iter','TolX', 1e-8, 'TolFun', 1e-8);
% x = fsolve(fun,x0,options) solves the equations with the optimization options specified in options. Use optimoptions to set these options.

lambda0 = fsolve(@myError1, lambda0, options, x0, t0, xf, tf);  %solution of numarical method 
%lambda0a = fsolve(@myError2, lambda0Guess, options, x0, t0, xf, tf);
%%solution of analytical method
[E,t,p] = myError1(lambda0, x0, t0, xf, tf);

figure()
plot(t, p(:,1),'--mo')
xlabel('time','FontSize',16)
ylabel('x','FontSize',16)
title('Hyper Sensitive Numerical Trajectory','FontSize',18)
figure()
plot(t, -p(:,2),'--mo') %u
xlabel('time','FontSize',16)
ylabel('u','FontSize',16)
title('Hyper Sensitive Numerical Input','FontSize',18)
