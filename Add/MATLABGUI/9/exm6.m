clf
hmO=uimenu('label','Option');			%产生顶层菜单项Option
hmOsub1=uimenu(hmO,'label','Axis on');	%产生Axis on菜单项，由缺省设置而使能
hmOsub2=uimenu(hmO,'label','Axis off',...
   'enable','off');							%产生Axis off菜单项，但失能
hmOsub3=uimenu(hmO,'label','Grid on',...
   'separator','on','visible','off');		%产生与上分隔的Grid on菜单项，但不可见
hmOsub4=uimenu(hmO,'label','Grid off',...
   'visible','off');							%产生Grid off菜单项，但不可见
set(hmOsub1,'callback',[...					%选中Axis on菜单项后，产生回调操作
   'Axis on,',...									%画坐标
   'set(hmOsub1,''enable'',''off''),',...		%Axis on菜单项失能
   'set(hmOsub2,''enable'',''on''),',...		%Axis off菜单项使能
   'set(hmOsub3,''visible'',''on''),',...		%Grid on菜单项可见
   'set(hmOsub4,''visible'',''on''),']);		%Grid off菜单项可见
set(hmOsub2,'callback',[...					% %选中Axis off菜单项后，产生回调操作   
   'axis off,',...								%使坐标消失
   'set(hmOsub1,''enable'',''on''),',...		%Axis on菜单项使能
   'set(hmOsub2,''enable'',''off''),',...		%Axis off菜单项失能
   'set(hmOsub3,''visible'',''off''),',...		%Grid on菜单项不可见
   'set(hmOsub4,''visible'',''off''),']);		%Grid off菜单项不可见
set(hmOsub3,'callback',[...					%选中Grid on菜单项后，产生回调
	'grid on,',...								%画坐标分格线
	'set(hmOsub3,''enable'',''off''),',...		%Grid on菜单项失能
	'set(hmOsub4,''enable'',''on''),']);		%Grid off菜单项使能
set(hmOsub4,'callback',[...					%选中Grid off菜单项，产生回调
	'grid off,',...								%消除坐标分格线
	'set(hmOsub3,''enable'',''on''),',...		%Grid on菜单项使能
	'set(hmOsub4,''enable'',''off''),']);		%Grid off菜单项失能 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
