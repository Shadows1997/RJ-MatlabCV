 h_menu=uimenu(gcf,'Label','&Color');			%带简捷键C的用户菜单Color	<2>
h_submenu1=uimenu(h_menu,'Label','&Blue',...	%带简捷键B的的下拉菜单Blue	<3>
	'Callback','set(gcf,''color'',''blue'')');
h_submenu2=uimenu(h_menu,'label','Red',...	%制作另一个下拉菜单Red
	'Callback','set(gcf,''color'',''red'')',...
	'Accelerator','r');							%为Red菜单设置快捷键R		<7>
