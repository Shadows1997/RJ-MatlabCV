function f=LBF_dataForce(Img,K,KONE,f1,f2,lamda1,lamda2)
s1=lamda1.*f1.^2-lamda2.*f2.^2;
s2=lamda1.*f1-lamda2.*f2;
f=(lamda1-lamda2)*KONE.*Img.*Img+conv2(s1,K,'same')-2.*Img.*conv2(s2,K,'same');