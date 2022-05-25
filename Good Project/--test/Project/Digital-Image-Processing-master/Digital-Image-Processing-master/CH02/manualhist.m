function p = manualhist
%  ����p = manualhistʹ�ú���twomodegauss�������յĸ�˹����
%  �������ռ������õ�ֱ��ͼ

%  ��ʼ��
% x ����ֹͣ����
repeats = true;
quitnow = 'x'

% ����Ĭ�ϵ�ֱ��ͼ
p = twomodegauss(0.15,0.05,0.75,0.05,1,0.07,0.002);

% ѭ���������ֱ������ֹͣ��'x'
while repeats
    s = input('Enter m1, sig1,m2, sig2, A1, A2, k or x to quit','s');
    if strcmp(s, quitnow)
        break
    end
    
    % �������string ת��Ϊһ������������ֵ������֤���������
    v = str2num(s);
    if numel(v) ~= 7
        disp('Incorrect number of imputs.')
        continue
    end
    
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5),v(6),v(7));
    figure, plot(p)
    xlim([0 255])
end


