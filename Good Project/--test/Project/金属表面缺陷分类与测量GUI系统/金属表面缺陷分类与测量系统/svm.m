%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��������ȱ��������ȡ(LBP)��SVM�ලѧϰ���ಢ�������ȷ��
%author:Faust.Cao
%2018.11.1

LBPHIST=zeros(600,18);
for i=1:300
    c2=num2str(i);
    c1='E:\�ҵ����´����\����ͼ����γ�\�γ����\NEU+surface+defect+database\NEU surface defect database\In_';
    c3='.bmp';
    c=[c1,c2,c3];
    inputimag=imread(c);
    MAPPING=getmapping(16,'riu2');
    LBPHIST(i,:)=lbp(inputimag,2,16,MAPPING,'hist');
end
for i=301:600
    c2=num2str(i-300);
    c1='E:\�ҵ����´����\����ͼ����γ�\�γ����\NEU+surface+defect+database\NEU surface defect database\Sc_';
    c3='.bmp';
    c=[c1,c2,c3];
    inputimag=imread(c);
    MAPPING=getmapping(16,'riu2');
    LBPHIST(i,:)=lbp(inputimag,2,16,MAPPING,'hist');
end
global svmModel;
label=ones(300,1);
label(301:600)=0;
tranData=LBPHIST(1:270,:);
tranData(271:540,:)=LBPHIST(301:570,:);
tranLabel=label(1:270);
tranLabel(271:540,:)=label(301:570);

testData=LBPHIST(271:300,:);
testData(31:60,:)=LBPHIST(571:600,:);
testLabel=label(271:300);
testLabel(31:60)=label(571:600);

svmModel = svmtrain(tranData, tranLabel);
predict_label = svmclassify(svmModel,testData); 
fprintf('ʹ��svmclassify����ȷ�ʣ�%f\n' ,sum(predict_label==testLabel)/size(testLabel,1));

