function [stuNum,studentInfo] = WriteInExcel( Bn ,sum_scores,pass,fileNo)
%%���ɼ��ֱ�д��Excel��������
% ѧ��Bn(2).result���Ծ�����Bn(1).result����ĿBn(3).result
% �ܳɼ�sum_scores���Ƿ�ͨ��pass���ļ���ĿfileNo
% �ؼ������÷���
% xlswrite(filename,A,sheet,xlRange) д��ָ���Ĺ�����ͷ�Χ��
filename = 'results\\grades.xls';
studentInfo = [];
%ѧ��������ת�ã���������ת�������stuNum
stuNum_1 = (Bn(2).result)';
if ~isempty(stuNum_1)
    for i = 1 : length(stuNum_1(1,:))
        stuNum(1,i) = num2str(stuNum_1(1,i));
    end
   for j = 1 : fileNo
        studentInfo{fileNo,1} = stuNum;
        studentInfo{fileNo,2} = Bn(1).result;
        studentInfo{fileNo,3} = Bn(3).result;
        studentInfo{fileNo,4} = sum_scores;
        studentInfo{fileNo,5} = pass;
   end
    xlswrite(filename,studentInfo);
else
    stuNum = num2str(fileNo);
    for j = 1 : fileNo
        studentInfo{fileNo,1} = stuNum;
    end
    xlswrite(filename,studentInfo);
    msgbox(sprintf('��%d�Ŵ��⿨�޿���',fileNo), '������ʾ','error');
end
end

