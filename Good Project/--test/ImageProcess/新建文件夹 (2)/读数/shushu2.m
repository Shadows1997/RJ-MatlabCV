    clc,clear,close all;                  % �������
    %%  ��̬ѧ����=������
    g=imread('mili1.png');
imshow(g);
%     g= rgb2gray(g1);
    SE=strel('disk',4);  % ��̬�ṹԪ��
    X1=imerode(g,SE);  % ��ֵͼ��ʴ
    I=imdilate(X1,SE); % ��ֵͼ������
     figure,imshow(I);
    % I=imread('rice.png');
    BG=imopen(I,strel('disk',10));
     figure,imshow(BG);
    % ��ͼ��ʵ�ֿ����㣬������һ����ƽ��ͼ���������������խ�Ĳ��֣�ȥ��ϸ��ͻ����
    % se=strel��'disk'��5������Բ���νṹԪ��ͨ�������� �Ƴ�С��5���ص�ѩ��
    I2=imsubtract(I,BG);    % �������� ��һ��ͼ���м�ȥ��һ��ͼ����ͼ���м�ȥ����
     figure,imshow(I2);
    level=graythresh(I2);   % �ҹ� ����otsu������ȫ��ͼ����ֵ
    bw2=imbinarize(I2,level);  % ������ֵ��ͼ��ת��Ϊ��ֵͼ��
     figure,imshow(bw2);
    [labeled,numObjects]=bwlabel(bw2,8);
    max(max(labeled))
    f=bw2;
    [L,n]= bwlabel(f);  
    % ����find����5.2.2�ڣ��ڴ����Ǿ���ʱ�ǳ����á�
    % ���磬���¶�find�ĵ��ý��������ڵ�����������������ص�����������������
    [r,c]=find(L==3);   % Ȼ������r��C��Ϊ�����mean����������ö�������ġ�
    rbar = mean(r);
    cbar = mean(c);   
    % ����ʹ��һ��ѭ�����������ʾͼ����ȫ����������ġ�
    % Ϊ��ʹ���ĵ�����ͼ����ʱ�ɿ��������ģ����ǽ�ʹ������Ϊ��ɫ��*�����ŵĺ�ɫԲ�������ʾ��������ʾ��
    figure
    subplot(2,3,1),imshow(I);title('ԭͼ');
    subplot(2,3,2),imshow(BG);title('����');
    subplot(2,3,3),imshow(I2);title('��������');
    subplot(2,3,4),imshow(bw2);title('��ֵ��');
    subplot(2,3,5),imshow(f);title('��ע');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkeRFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
    %     text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % ��ע���
    end
    subplot(2,3,6),imshow(f);title('��ע���');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % ��ע���
    end
    figure,imshow(f);title('��ע���');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % ��ע���
    end