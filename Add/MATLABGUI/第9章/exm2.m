grid on,set(gca,'box','on') 
%%%%%
eval('grid on,set(gca,''box'',''on'')') 
%%%%%%%%5
uimenu('Label','Example','Callback','grid on,set(gca,''box'',''on'')')  
%%%%%%%%%%
uimenu('Label','Example', ...
		'Callback',['grid on,' , ...                   %”√...¡¨Ω”
					  'set(gca,''box'',''on'');'])  
%%%%%%
 MnE='Example';
GB=['grid on,','set(gca,''box'',''on''),'];
uimenu('Label', MnE, 'Callback' , GB) 

%%%%%%%
Mgui.Label='Example';
Mgui.Callback=['grid on;','set(gca,''box'',''on'');'];
uimenu(Mgui)
