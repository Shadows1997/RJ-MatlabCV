t=(-2*pi:pi/60:2*pi)+eps;
y=sin(t)./t;
hline=plot(t,y);									%����Sa����
cm=uicontextmenu;									%�����ֳ��˵�
%��������˵��������Ӧ�Ļص�
uimenu(cm,'label','Red','callback','set(hline,''color'',''r''),')
uimenu(cm,'label','Blue','callback','set(hline,''color'',''b''),')
uimenu(cm,'label','Green','callback','set(hline,''color'',''g''),')
set(hline,'uicontextmenu',cm)  				%ʹcm�ֳ��˵���Sa��������ϵ
