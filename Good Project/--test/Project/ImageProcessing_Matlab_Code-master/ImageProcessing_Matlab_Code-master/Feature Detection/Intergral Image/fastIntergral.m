%������ȡ����ͼ
%(i,j-1)�Ļ���ͼ+��j�еĺ�
%��ϸԭ����;������
function output_Img=fastIntergral(input_Img,output_Img,W,H)
% calculate integral of the first line
columnSum=input_Img(1,:);%��j�е�i�������
output_Img(1,:)=input_Img(1,:);
for i=2:W
    output_Img(1,i) = output_Img(1,i)+output_Img(1,i-1);
end
for i=2:H
    %first column of each line
    columnSum(1)=columnSum(1)+input_Img(i,1);
    output_Img(i,1)=columnSum(1);
    %other columns
    for j=2:W
        columnSum(j)=columnSum(j)+input_Img(i,j);
        output_Img(i,j)=columnSum(j)+output_Img(i,j-1);
    end
end
end