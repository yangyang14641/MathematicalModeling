%常微分方程目标函数
function dP=xlsodefun(x,y)
global a
global const
global m 
global tw

A=-0.9375000000e-2 * tanh(a * x) + 0.3187500000e-1;
dA=(3*a*(tanh(a*x)^2 - 1))/320;
c=(m-1)/2*y^((m-1)/2);

dP=(const^2*dA*y-tw*y^2*A^2)/(-const^2*A+c^2*y^2*A^3);

