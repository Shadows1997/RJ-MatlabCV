 load p.mat
 load a6.mat
% p=TZbochang(1:12,:);
load t.mat
p=p';
t=t';
net = newgrnn(p,t,3);
Y = sim(net,p);
Y;
% a=TZbochang(13:end,:);
a6=a6';
Y1 = sim(net,a6);
Y1;
numberD = length(find(Y1<0.5));