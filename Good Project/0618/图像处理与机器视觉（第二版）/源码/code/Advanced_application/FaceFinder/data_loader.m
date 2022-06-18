function [image_info,file]=data_loader(data_path)
file=strcat(data_path,'\data.mat');
if exist(file)==2
  image_info=  load (file,'image_info');
else
   image_info=struct;
   save(file,'image_info');
   image_info=load(file,'image_info');
end
end