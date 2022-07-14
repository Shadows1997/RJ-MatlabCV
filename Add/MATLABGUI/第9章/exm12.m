clear
clc
hf=figure('Position',[200 200 600 400] ,...
           'Name','Uicontrol1' ,...
           'NumberTitle','off');
ha=axes('Position',[0.4 0.1 0.5 0.7],...
            'Box','on');
hbSin=uicontrol(hf,...
                'Style','pushbutton',...                     %sin按钮
                'Position',[50,140,100,30],...
                'String','Plot sin(x)',...
                'CallBack',...
                ['subplot(ha);'...
                  'x=0:0.1:4*pi;'...
                  'plot(x,sin(x));'...                        %绘制sin
                  'axis([0 4*pi -1 1]);'...
                  'xlabel(''x'');'...
                 'ylabel(''y=sin(x)'');'...
                 'if get(hcGrid,''Value'')==1;'...       %判断是否选中
                  'Grid on;'...
                  'else;'...
                  'Grid off;'...
                  'end;'...   
                ]);  
hbCos=uicontrol(hf,...
                'Style','pushbutton',...
                'Position',[50,100,100,30],...
                'String','Plot cos(x)',...                  %cos按钮
                'CallBack',...
                ['subplot(ha);'...
                 'x=0:0.1:4*pi;'...
                  'plot(x,cos(x));'...                        %绘制cos
                  'axis([0 4*pi -1 1]);'...
                'xlabel(''x'');'...
                 'ylabel(''y=cos(x)'');'...
                 'if get(hcGrid,''Value'')==1;'...       %判断是否选中
                'Grid on;'...
                  'else;'...
                 'Grid off;'...
                 'end;'... 
                ]);             
hbClose=uicontrol(hf,...
                'Style','pushbutton',...                    %结束按钮
                'Position',[50,60,100,30],...
                'String','Exit',...
                'CallBack','close(hf)'); 
hrboxoff=uicontrol(hf,'Style','radio',...
               'Position',[50 180 100 20],...
               'String','Set box off',...                   %单选按钮off
               'Value',0,...
               'CallBack',[...
               'set(hrboxon,''Value'',0);'...
               'set(hrboxoff,''Value'',1);'...
               'set(gca,''Box'',''off'');']);
hrboxon=uicontrol(hf,'Style','radio',...                %单选按钮on
                'Position',[50 210 100 20],...
                'String','Set box on',...
                'Value',1,...
                'CallBack',[...
                                'set(hrboxon,''Value'',1);'...
                               'set(hrboxoff,''Value'',0);'...
                               'set(gca,''Box'',''on'');']);   
hcGrid=uicontrol(hf,'Style','check',...                 %复选框
               'Position',[50 240 100 20],...              %复选框位置
               'String','Grid on',...
               'Value',1,...
               'CallBack',[...
                             'if get(hcGrid,''Value'')==1;' ... %判断是否选中
                              'Grid on;'...
                              'else;'...
                             'Grid off;'...
                              'end;'...
                               ]);   
