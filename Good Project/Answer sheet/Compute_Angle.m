function angle = Compute_Angle(xy_long)
%����ֱ�߽Ƕ�
% ���������
% xy_long�����ֱ�߶˵㼯��
% ���������
% angle�����Ƕȼ���

%�ֱ�ߵ������յ�����
x1 = xy_long(:, 1);
y1 = xy_long(:, 2);
%���߶�б��
K1 = -(y1(2)-y1(1))/(x1(2)-x1(1));
angle = atan(K1)*180/pi;