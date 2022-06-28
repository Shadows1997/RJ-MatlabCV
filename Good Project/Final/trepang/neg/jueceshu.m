tic
%% ��ջ�������
clear all
clc
%%  ��������
% load TZbochang.mat
load a61.mat
%% �������ѵ����/���Լ�
%  a = randperm(20);
Train = a61(1:10,:);
Test = p1(1:end,:);
%% ѵ������
Ptrain = Train(:,1:end-1);
Ttrain = Train(:,end);
%% ��������
 P_test = Test(:,1:end-1);
 T_test = Test(:,end);
%% ����������������
ctree = ClassificationTree.fit(Ptrain,Ttrain);
%% �鿴��������ͼ
view(ctree,'mode','graph');
%% IV. �������
T_pre = predict(ctree,P_test);
%% �������
numberD = length(find(T_test == 1));
numberND = length(find(T_test == 0));
numberD_pre = length(find(T_pre == 1 & T_test == 1));
numberND_pre = length(find(T_pre == 0 & T_test == 0));

disp(['�棩��' num2str(numberD_pre)...
      '���и�����' num2str(numberD - numberD_pre)]);
disp(['�٣���' num2str(numberND_pre)...
      '���и�����' num2str(numberND - numberND_pre)]);
toc