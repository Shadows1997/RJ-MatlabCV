%该程序用来求解方程
%x^2*exp(x^2)=10
syms x%定义变量x
y=x^2*exp(x^2)-10;%方程表达式
x=solve(y,x)%用solve函数求解方程
x=vpa(x,20)%用vpa函数显示数值解