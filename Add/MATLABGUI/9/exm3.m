 h_menu=uimenu(gcf,'Label','&Color');			%����ݼ�C���û��˵�Color	<2>
h_submenu1=uimenu(h_menu,'Label','&Blue',...	%����ݼ�B�ĵ������˵�Blue	<3>
	'Callback','set(gcf,''color'',''blue'')');
h_submenu2=uimenu(h_menu,'label','Red',...	%������һ�������˵�Red
	'Callback','set(gcf,''color'',''red'')',...
	'Accelerator','r');							%ΪRed�˵����ÿ�ݼ�R		<7>
