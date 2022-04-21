function h = Heaviside(x,epsilon)     % function (11)
h=0.5*(1+(2/pi)*atan(x./epsilon));
