clf
hmO=uimenu('label','Option');			%��������˵���Option
hmOsub1=uimenu(hmO,'label','Axis on');	%����Axis on�˵����ȱʡ���ö�ʹ��
hmOsub2=uimenu(hmO,'label','Axis off',...
   'enable','off');							%����Axis off�˵����ʧ��
hmOsub3=uimenu(hmO,'label','Grid on',...
   'separator','on','visible','off');		%�������Ϸָ���Grid on�˵�������ɼ�
hmOsub4=uimenu(hmO,'label','Grid off',...
   'visible','off');							%����Grid off�˵�������ɼ�
set(hmOsub1,'callback',[...					%ѡ��Axis on�˵���󣬲����ص�����
   'Axis on,',...									%������
   'set(hmOsub1,''enable'',''off''),',...		%Axis on�˵���ʧ��
   'set(hmOsub2,''enable'',''on''),',...		%Axis off�˵���ʹ��
   'set(hmOsub3,''visible'',''on''),',...		%Grid on�˵���ɼ�
   'set(hmOsub4,''visible'',''on''),']);		%Grid off�˵���ɼ�
set(hmOsub2,'callback',[...					% %ѡ��Axis off�˵���󣬲����ص�����   
   'axis off,',...								%ʹ������ʧ
   'set(hmOsub1,''enable'',''on''),',...		%Axis on�˵���ʹ��
   'set(hmOsub2,''enable'',''off''),',...		%Axis off�˵���ʧ��
   'set(hmOsub3,''visible'',''off''),',...		%Grid on�˵���ɼ�
   'set(hmOsub4,''visible'',''off''),']);		%Grid off�˵���ɼ�
set(hmOsub3,'callback',[...					%ѡ��Grid on�˵���󣬲����ص�
	'grid on,',...								%������ָ���
	'set(hmOsub3,''enable'',''off''),',...		%Grid on�˵���ʧ��
	'set(hmOsub4,''enable'',''on''),']);		%Grid off�˵���ʹ��
set(hmOsub4,'callback',[...					%ѡ��Grid off�˵�������ص�
	'grid off,',...								%��������ָ���
	'set(hmOsub3,''enable'',''on''),',...		%Grid on�˵���ʹ��
	'set(hmOsub4,''enable'',''off''),']);		%Grid off�˵���ʧ�� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
