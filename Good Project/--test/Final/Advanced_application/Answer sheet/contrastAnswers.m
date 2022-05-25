function [pass,sum_scores,tips] = contrastAnswers( Bn,Answer ,pass_scores)
%%对比此答题卡答案与标准答案对比计分
% 正确则返回‘恭喜你！’，不通过则返回‘未通过’
% 输入参数：
% Answer——当前试卷答案
% pass_scores——及格线
% 输出参数：
% pass——通过情况
if nargin < 2
    pass_scores = 60;
end
filename = 'StanderAnswers.xls';
%读取标有准答案的excel文件,列顺序：题号，答案，分值
[num,txt,raw] = xlsread(filename);
%将excel文件内容转化为矩阵
standerdAnswers = raw(2:length(raw),1:3);
%初始化学生卡答案矩阵
stuAnswer = cell(105,3);
for i = 1:length(Answer)
    stuAnswer{i,1} = Answer(i).no;
    stuAnswer{i,2} = Answer(i).aw;
    stuAnswer{i,3} = 0;
end
for i = 1:length(standerdAnswers)
    if stuAnswer{i,2} == standerdAnswers{i,2};
        stuAnswer{i,3} = standerdAnswers{i,3};
    else
        stuAnswer{i,3} = ~standerdAnswers{i,3};
    end
end
sum_scores = 0;
for i = 1:length(stuAnswer)
    sum_scores = sum_scores + stuAnswer{i,3};
end
if sum_scores >= pass_scores
    pass = '通过';
else
    pass = '不通过';
end 

stuNum_befor = Bn(2).result';
if ~isempty(stuNum_befor)
    for inum = 1 : length(stuNum_befor(1,:))
        tips(1,inum) = num2str(stuNum_befor(1,inum));
    end
else
    tips = '学号未找到！';
end
end

