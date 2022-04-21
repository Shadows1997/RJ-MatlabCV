function u = EVOL_LBF_Multi(u0,Img,K,KI,KONE,nu,timestep,mu,lambda1,lambda2,epsilon,n,numIter)

u=u0;
for k1=1:numIter
    u=NeumannBoundCond(u);
    C=curvature_central(u);    % div()  
    HeavU=Heaviside(u,epsilon);
    DiracU=Dirac(u,epsilon);
    Temp = 0; 
    for iter = 1:n
        [f1,f2]=LBF_LocalBinaryFit(K{iter},Img,KI{iter},KONE{iter},HeavU);  
%         Temp = min(f1,f2); 
%         f1 = max(f1,f2); 
%         f2 = Temp; 
        LBF=LBF_dataForce(Img,K{iter},KONE{iter},f1,f2,lambda1,lambda2);
        Temp = Temp + (1/n)* LBF; 
    end 
    areaTerm=-DiracU.*Temp;
    penalizeTerm=mu*(4*del2(u)-C);
    lengthTerm=nu.*DiracU.*C;
    u=u+timestep*(lengthTerm+penalizeTerm+areaTerm);
end
