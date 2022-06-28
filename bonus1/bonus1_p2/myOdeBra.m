function [dp] = myOdeBra(t, p, g)
thGuess = 0;

% simplify notations of states
x = p(1);
y = p(2);
v = p(3);
lx = p(4);
ly = p(5);
lv = p(6);

options = optimset('display','Off','TolX', 1e-8, 'TolFun', 1e-8);
% solve theta using the optimal control condition (costate: take partial derrivative of H with respect to the control--- H & theta)
th = fsolve(@solveControl, thGuess, options, lx, ly, lv, v, g); %calculate all the time not just the initial condition

% state functions
dx = v * sin(th);
dy = v * cos(th);
dv = g *       cos(th);
dlx = 0;
dly = 0;
dlv = -lx*sin(th) - ly*cos(th);
dp = [dx; dy; dv; dlx; dly; dlv];
end