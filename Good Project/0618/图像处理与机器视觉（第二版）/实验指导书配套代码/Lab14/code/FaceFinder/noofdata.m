function [Train_Number]=noofdata(trainimages_path)
trianfiles = dir(trainimages_path);
Train_Number = 0;
for i = 1:size(trianfiles,1)
    if not(strcmp(trianfiles(i).name,'.')|strcmp(trianfiles(i).name,'..')|strcmp(trianfiles(i).name,'Thumbs.db'))
        Train_Number = Train_Number + 1;
    end
end
end