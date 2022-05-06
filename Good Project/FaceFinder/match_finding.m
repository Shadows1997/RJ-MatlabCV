function Euc_dist = match_finding(test_image, m,A, Eigenfaces)
InputImage = imread(test_image);
%InputImage = test_image;
ProjectedImages = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); 
    ProjectedImages = [ProjectedImages temp]; 
end
temp = InputImage(:,:,1);
[irow, icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m; 
ProjectedTestImage = Eigenfaces'*Difference;
Euc_dist = [];
for i = 1 : Train_Number
    q = ProjectedImages(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    Euc_dist = [Euc_dist temp];
end


