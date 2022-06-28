tic
%% 清空环境变量
clear all
clc
%%  导入数据
% load TZbochang.mat
load a61.mat
%% 随机产生训练集/测试集
%  a = randperm(20);
Train = a61(1:10,:);
Test = p1(1:end,:);
%% 训练数据
Ptrain = Train(:,1:end-1);
Ttrain = Train(:,end);
%% 测试数据
 P_test = Test(:,1:end-1);
 T_test = Test(:,end);
%% 创建决策树分类器
ctree = ClassificationTree.fit(Ptrain,Ttrain);
%% 查看决策树视图
view(ctree,'mode','graph');
%% IV. 仿真测试
T_pre = predict(ctree,P_test);
%% 结果分析
numberD = length(find(T_test == 1));
numberND = length(find(T_test == 0));
numberD_pre = length(find(T_pre == 1 & T_test == 1));
numberND_pre = length(find(T_pre == 0 & T_test == 0));

disp(['真）：' num2str(numberD_pre)...
      '误判个数：' num2str(numberD - numberD_pre)]);
disp(['假）：' num2str(numberND_pre)...
      '误判个数：' num2str(numberND - numberND_pre)]);
toc