function Paper_Inspection( filenames,Custom_pass_scores )
%�������ܣ��Զ��ľ�
%���������
%filenames����������Ҫ�ж��Ĵ��⿨�ļ���
%Custom_pass_scores�����û�ָ���ķ�����
%�����������ѧ�š���Ŀ����Ŀ��Ӧ�ɼ����Ƿ�ͨ��
%�����ӦͼƬ��result�ļ��У��ļ���ʽ��ѧ��.jpg

if nargin < 2
    Custom_pass_scores = 60;
end
for filenameNo = 1 : length(filenames)
    filename = filenames{filenameNo};
    imageFile = strcat('images\\',filename);
    %��ȡͼ��
    I = imread(imageFile);
    %Ԥ����
    I1 = Image_Normalize(I, 0);
    %ƽ������ģ��ߴ�[3 3]��sigma��0.5��ƽ����ʽ����˹�˲�
    hsize = [3 3];
    sigma = 0.5;
    I2 = Image_Smooth(I1, hsize, sigma, 0);
    %�ҶȻ�
    I3 = Gray_Convert(I2, 0);
    %��ֵ��
    bw2 = Image_Binary(I3, 0);
    %hough�任
    [~, ~, xy_long] = Hough_Process(bw2, I1, 0);
    %�任б��
    angle = Compute_Angle(xy_long);
    %ͼ����ת
    [I4, bw3] = Image_Rotate(I1, bw2, angle*1.8, 0);
    %��̬ѧ�˲�
    [bw4, Loc1] = Morph_Process(bw3, 0);
    %hough�������ֽ���
    [Len, XYn, xy_long] = Hough_Process(bw4, I4, 0);
    %����ָ�
    [bw5, bw6] = Region_Segmation(XYn, bw4, I4, 0);
    %������
    [stats1, stats2, Line] = Location_Label(bw5, bw6, I4, XYn, Loc1, 0);
    %�������
    [Dom, Aom, Answer, Bn] = Analysis(stats1, stats2, Line, I4);
    %�ɼ��ж�
    [pass,sum_scores,~] = contrastAnswers(Bn, Answer ,Custom_pass_scores);
    %������Excel�ļ�,����ѧ��
    stuNum = WriteInExcel( Bn ,sum_scores,pass,filenameNo);
    %������Ŵ��⿨
    Write_Results(I4,stuNum);
end
msgbox('���⿨��ȫ���ж���ϣ�����reslut�ļ�����grades.xls�в鿴','��ʾ');
end