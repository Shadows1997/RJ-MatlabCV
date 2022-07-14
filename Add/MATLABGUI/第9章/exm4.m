
figure
hmO=uimenu('label','Option','Position',4);
hmOsub1=uimenu(hmO,'label','grid on','callback','grid on');
hmOsub2=uimenu(hmO,'label','grid off','callback','grid off');
hmOsub3=uimenu(hmO,'label','box on','callback','box on',...
	'separator','on');															%<6>
hmOsub4=uimenu(hmO,'label','box off','callback','box off');
hmOsub5=uimenu(hmO,'label','Figure Color','Separator','on'); 			%<8>
hmOsub51=uimenu(hmOsub5,'label','Red','ForeGroundColor','r',...			%<9>
   'callback','set(gcf,''Color'',''r'')');
hmOsub52=uimenu(hmOsub5,'label','white',...
   'callback','set(gcf,''Color'',''w'')');


%%%%%%%%%%
Pos_O=get(hmO,'position'),					%查询Option菜单位置值
Pos_BoxOn=get(hmOsub3,'position')				%查询box ob子菜单位置值
Pos_Red=get(hmOsub51,'position')			%查询red子菜单的位置值 
