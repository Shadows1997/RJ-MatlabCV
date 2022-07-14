t=(-2*pi:pi/60:2*pi)+eps;
y=sin(t)./t;
hline=plot(t,y);									%绘制Sa曲线
cm=uicontextmenu;									%创建现场菜单
%制作具体菜单项，定义相应的回调
uimenu(cm,'label','Red','callback','set(hline,''color'',''r''),')
uimenu(cm,'label','Blue','callback','set(hline,''color'',''b''),')
uimenu(cm,'label','Green','callback','set(hline,''color'',''g''),')
set(hline,'uicontextmenu',cm)  				%使cm现场菜单与Sa曲线相联系
