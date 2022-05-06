function [m,A, Eigenfaces] = Eigenface(trainimage_matrix)
try
m = mean(trainimage_matrix,2); 
Train_Number=size(trainimage_matrix,2);
d=waitbar(0,'loading database');
A = [];  
for i = 1 : Train_Number
waitbar(2*Train_Number/i,d,sprintf('loading images%d of %d',i,Train_Number));
    temp = double(trainimage_matrix(:,i)) - m; 
    A = [A temp];
end
L = cov(A);
[v, D] = eig(L);
L_eig_vec = [];
for i = 1 : size(v,2) 
    %if( D(i,i)>1 )
        L_eig_vec = [L_eig_vec v(:,i)];
    %end
end
Eigenfaces = A * L_eig_vec; 
delete(d);
catch
    delete(d);
end
