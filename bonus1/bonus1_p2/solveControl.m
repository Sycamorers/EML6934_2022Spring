% function to calculate Hth
function Hth = solveControl(th, lx, ly, lv, v, g)
Hth = lx*v*cos(th)-(ly*v+lv*g)*sin(th);
end