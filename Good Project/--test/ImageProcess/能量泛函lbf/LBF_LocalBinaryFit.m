function [f1,f2] = LBF_LocalBinaryFit(K,Img,KI,KONE,H)
I=Img.*H;
c1=conv2(H,K,'same');
c2=conv2(I,K,'same');
f1=c2./(c1);
f2=(KI-c2)./(KONE-c1);