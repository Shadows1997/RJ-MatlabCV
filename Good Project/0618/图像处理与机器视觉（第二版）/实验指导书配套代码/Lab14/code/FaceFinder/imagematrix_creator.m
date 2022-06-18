function trainimage_matrix=imagematrix_creator(trainimages_path)
trianfiles = dir(trainimages_path);
Train_Number = 0;

for i = 1:size(trianfiles,1)
    if not(strcmp(trianfiles(i).name,'.')|strcmp(trianfiles(i).name,'..')|strcmp(trianfiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1;
    
    end
end
trainimage_matrix = [];
for i = 1 : Train_Number
    str = int2str(i);
    str = strcat('\',str,'.jpg');
    str = strcat(trainimages_path,str);
    try
    img = imread(str);
    catch
        delete(str);
    end
    try
    img = rgb2gray(img);
    catch 
    img=img(:,:,1);
    end
    [irow, icol] = size(img);
   
    temp = reshape(img',irow*icol,1);  
    trainimage_matrix = [trainimage_matrix temp];    
end
