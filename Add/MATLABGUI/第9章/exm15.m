clear
clc
PlotSin=['Num=get(hs,''Value'');'...                     %获取滑动条的数值'set(heNum,''String'',num2str(Num));'...
        'subplot(ha);'...
           'x=0:0.1:Num*pi;'...
         'plot(x,sin(x));'...                                 %绘制正弦
         'axis([0 Num*pi -1 1]);'...
         'xlabel(''x'');'...
         'ylabel(''y=sin(x)'');'...
         'if get(hcGrid,''Value'')==1;'...                %判断是否选中
         'grid on;'...
        'else;',...
        'grid off;'...
        'end;'...  
         ];
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
hbSin=uicontrol(hf,...
                'Style','pushbutton',...                     %sin按钮
                'Position',[50,140,100,30],...
                'String','Plot sin(x)',...
                'CallBack',PlotSin);  
hbClose=uicontrol(hf,...
                'Style','pushbutton',...                    %结束按钮
                'Position',[50,100,100,30],...
                'String','Exit',...
                'CallBack','close(hf)'); 
hrboxoff=uicontrol(hf,'Style','radio',...               %单选按钮off
               'Position',[50 180 100 20],...
               'String','Set box off',...
               'Value',0,...
               'CallBack',[...
                   'set(hrboxon,''Value'',0);'...
                   'set(hrboxoff,''Value'',1);'...
                   'set(gca,''Box'',''off'');']);
hrboxon=uicontrol(hf,'Style','radio',...               %单选按钮on
                'Position',[50 210 100 20],...
                'String','Set box on',...
                'Value',1,...
                'CallBack',[...
                               'set(hrboxon,''Value'',1);'...
                               'set(hrboxoff,''Value'',0);'...
                               'set(gca,''Box'',''on'');']);   
hcGrid=uicontrol(hf,'Style','check',...                %复选框
               'Position',[50 240 100 20],...
               'String','Grid on',...
               'Value',1,...
               'CallBack',[...
               'if get(hcGrid,''Value'')==1;'...         %判断是否选中
              'grid on;'...
               'else;'...
              'grid off;'...
              'end;'...
               ]);  
heNum=uicontrol(hf,'Style','edit',...                   %可编辑文本框
                  'Position',[50 270 100 20],...
                  'String','4',...
'CallBack','set(heNum,''String'',num2str(Num))');   %显示滑动条的数值
 htpi=uicontrol(hf,'Style','text',...
                  'Position',[150 270 20 20],...
                  'String','Pi'); 
 htminmax=uicontrol(hf,'Style','text',...              %静态文本框
                  'Position',[50 330 100 20],...
                  'String','1pi                 20pi'); 
 hs=uicontrol(hf,'Style','slider',...                    %滑动条
                  'Position',[50 310 100 20],...
                  'value',4,...
                   'Min',1,...
                   'Max',20,...
                   'CallBack',PlotSin);                       %调用PlotSin
