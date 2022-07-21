function [stuNum,studentInfo] = WriteInExcel( Bn ,sum_scores,pass,fileNo)
%%将成绩分别写入Excel工作表中
% 学号Bn(2).result、试卷类型Bn(1).result、科目Bn(3).result
% 总成绩sum_scores、是否通过pass、文件数目fileNo
% 关键函数用法：
% xlswrite(filename,A,sheet,xlRange) 写入指定的工作表和范围。
filename = 'results\\grades.xls';
studentInfo = [];
%学号数组先转置，遍历单个转换输出到stuNum
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
    msgbox(sprintf('第%d张答题卡无考号',fileNo), '错误提示','error');
end
end

