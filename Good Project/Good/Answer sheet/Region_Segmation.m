function [bw1, bw2] = Region_Segmation(XY, bw, Img, flag)
%�ָ�����
% ���������
% XY������ǰͼ��ֱ����Ϣ(�Ѿ���ֱ�߳��Ƚ��н�������)
% bw������ǰ���⿨��ֵͼ��
% Img����ԭͼ��
% flag�����Ƿ���ʾͼ��
% ���������
% bw1������Ӧ������
% bw2������Ӧ������
if nargin < 4
    flag = 1; 
end
%�ָ�ֱ��
% ͼ������󣬽�ϴ��⿨ͼƬ��������ԣ�����׼��֤��������������м�����ֱ�߷ָ�
% ������������⿨β������ֱ�߷ָ�
% ����ʶ���ֱ�ߺ󣬸���ֱ�߳�������ȡ�������ֱ�ߣ��Ϳ��Եõ�
% ����ָ�λ��
for i = 1 : 2
    xy = XY{i}; %��i��ֱ��
    %ˮƽ��ֻ��עY���򼴿�
    XY{i} = [1 xy(1, 2); size(bw, 2) xy(2, 2)];%ֱ����Ϣ
    %Ϊ�˶�Ӧͼ�����أ�ȡ����
    ri(i) = round(mean([xy(1,2) xy(2,2)]));
end
%����ֱ�߷ֳ�����λ����
minr = min(ri);
maxr = max(ri);
bw1 = bw; bw2 = bw;
%�ָ�����
%bw1��Ӧ������
bw1(1:minr+5, :) = 0;
bw1(maxr-5:end, :) = 0;
%bw2��Ӧ������
bw2(minr-5:end, :) = 0;
bw2(1:round(minr*0.5), :) = 0;

if flag
    figure('units', 'normalized', 'position', [0 0 1 1]);
    subplot(2, 2, 1); imshow(Img, []); title('ԭͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(bw, []); title('ԭ��ֵͼ��', 'FontWeight', 'Bold');
    hold on;
    for i = 1 : 2
        xy = XY{i}; 
        plot(xy(:, 1), xy(:, 2), 'r-', 'LineWidth', 2);
    end
    hold off;
    subplot(2, 2, 3); imshow(bw1, []); title('������ͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(bw2, []); title('������ͼ��', 'FontWeight', 'Bold');
end