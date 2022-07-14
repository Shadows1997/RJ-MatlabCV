function ydot=fun_12_10(t,x)
u=1-(t.^2)/(pi^2);
ydot=[0 1;-1,0]*x+[0 1]'*u;