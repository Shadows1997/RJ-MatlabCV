load p.mat
load a6.mat
load t.mat
Train=p;
Test=a6;
p_train=p';
t_train=t';
p_test=a6';
Spread=100;
net=newpnn(p_train,t_train,Spread);
Y2=sim(net,p_test);
[Y2c,ss]=vec2ind(Y2);
numberD = length(find(w<0.5));
