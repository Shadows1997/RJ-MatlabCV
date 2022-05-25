function [database_path,trainimages_path,data_path]= default_dir()
if exist('\facefinder','dir')==7
    database_path='\facefinder';
    trainimages_path='\facefinder\testimages';
    data_path='\facefinder\Data';
    fileattrib(database_path,'+h');
else
    mkdir('\facefinder');
    mkdir('\facefinder\testimages');
    mkdir('\facefinder\Data');
    database_path='\facefinder';
    trainimages_path='\facefinder\testimages';
    data_path='\facefinder\Data';
    fileattrib(database_path,'+h');
end
end