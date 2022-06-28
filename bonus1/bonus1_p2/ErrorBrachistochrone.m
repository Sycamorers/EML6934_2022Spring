% known initial conditions sloved by TC: xf=2, yf=2, lvf=0, Hf=-1
function [E, t, p] = ErrorBrachistochrone(StatesGuess, x0, y0, v0, xf, yf, lvf, Hf, t0 ) 
    lx0 = StatesGuess(1);
    ly0 = StatesGuess(2);
    lv0 = StatesGuess(3);
    tf = StatesGuess(4);
    p0 = [x0; y0; v0; lx0; ly0; lv0];
    options = odeset('RelTol',1e-8); %create an options structure
    g = 10;
    tspan = [t0,tf];
    [t, p] = ode113(@myOdeBra,tspan,p0,options, g);
    ptf = p(end, :);
    xtf = ptf(1);
    ytf = ptf(2);
    vtf = ptf(3);
    lxtf = ptf(4);
    lytf = ptf(5);
    lvtf = ptf(6);
    % Htf = lx*v*sin(th)+(ly*v+lv*g)cos(th)
    thtfGuess = 0;
    %solve for the terminal theta to calculate Htf
    options1 = optimset('display','Off','TolX', 1e-8, 'TolFun', 1e-8);
    thtf = fsolve(@solveControl, thtfGuess, options1, lxtf, lytf, lvtf, vtf, g);
    Htf = lxtf*vtf*sin(thtf) + (lytf*vtf+lvtf*g)*cos(thtf);
    E = [xtf-xf; ytf-yf; lvtf-lvf; Htf-Hf];



