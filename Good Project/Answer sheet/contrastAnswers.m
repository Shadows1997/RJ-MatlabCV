function [pass,sum_scores,tips] = contrastAnswers( Bn,Answer ,pass_scores)
%%�Աȴ˴��⿨�����׼�𰸶ԱȼƷ�
% ��ȷ�򷵻ء���ϲ�㣡������ͨ���򷵻ء�δͨ����
% ���������
% Answer������ǰ�Ծ��
% pass_scores����������
% ���������
% pass����ͨ�����
if nargin < 2
    pass_scores = 60;
end
filename = 'StanderAnswers.xls';
%��ȡ����׼�𰸵�excel�ļ�,��˳����ţ��𰸣���ֵ
[num,txt,raw] = xlsread(filename);
%��excel�ļ�����ת��Ϊ����
standerdAnswers = raw(2:length(raw),1:3);
%��ʼ��ѧ�����𰸾���
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
    pass = 'ͨ��';
else
    pass = '��ͨ��';
end 

stuNum_befor = Bn(2).result';
if ~isempty(stuNum_befor)
    for inum = 1 : length(stuNum_befor(1,:))
        tips(1,inum) = num2str(stuNum_befor(1,inum));
    end
else
    tips = 'ѧ��δ�ҵ���';
end
end

