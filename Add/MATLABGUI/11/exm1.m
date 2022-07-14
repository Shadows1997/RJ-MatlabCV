>> h=figure;                                                     %创建了一个图形窗口
>> get(gcf,'DeleteFcn')
  >>str=get(gcf,'CloseRequestFcn')
 >> set(gcf,'CloseRequestFcn','')
>> close gcf
