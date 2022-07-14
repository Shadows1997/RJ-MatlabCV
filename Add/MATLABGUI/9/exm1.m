hmE=uimenu(gcf,'Label' ,'Example');
hmEsub1=uimenu(hmE,'Label','Grid','Callback','Grid');
hmEsub2=uimenu(hmE,'Label',' View');
hmEsub21=uimenu(hmEsub2,'Label','sin',...
                        'Callback','plot(sin([0:0.1:2*pi]),''r'')');
hmEsub22=uimenu(hmEsub2,'Label','cos',...
                       'Callback','plot(cos([0:0.1:2*pi]),''b:'')');
hmEsub3=uimenu(hmE,'Label','Hold','Callback','hold');
                   
hmC=uimenu(gcf,'Label','Close');
hhmCsub1=uimenu(hmC,'Label','Remove Example Menu',...
				              'Callback','delete(hmE);drawnow');
hmCsub2=uimenu(hmC,'Label','Close Figure','Callback','Close');                          
                   
