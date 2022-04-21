    clc,clear,close all;                  % 清除缓存
    %%  形态学处理=数米粒
    g=imread('mili1.png');
imshow(g);
%     g= rgb2gray(g1);
    SE=strel('disk',4);  % 形态结构元素
    X1=imerode(g,SE);  % 二值图像腐蚀
    I=imdilate(X1,SE); % 二值图像膨胀
     figure,imshow(I);
    % I=imread('rice.png');
    BG=imopen(I,strel('disk',10));
     figure,imshow(BG);
    % 对图像实现开运算，开运算一般能平滑图像的轮廓，消弱狭窄的部分，去掉细的突出。
    % se=strel（'disk'，5）；用圆盘形结构元素通过开运算 移除小于5像素的雪花
    I2=imsubtract(I,BG);    % 减法运算 从一个图像中减去另一个图像或从图像中减去常量
     figure,imshow(I2);
    level=graythresh(I2);   % 灰谷 基于otsu方法的全局图像阈值
    bw2=imbinarize(I2,level);  % 基于阈值将图像转换为二值图像
     figure,imshow(bw2);
    [labeled,numObjects]=bwlabel(bw2,8);
    max(max(labeled))
    f=bw2;
    [L,n]= bwlabel(f);  
    % 函数find（见5.2.2节）在处理标记矩阵时非常有用。
    % 例如，以下对find的调用将返回属于第三个对象的所有像素的行索引和列索引：
    [r,c]=find(L==3);   % 然后，利用r和C作为输入的mean函数来计算该对象的质心。
    rbar = mean(r);
    cbar = mean(c);   
    % 可以使用一个循环来计算和显示图像中全部对象的质心。
    % 为了使质心叠置在图像上时可看到该质心，我们将使用中心为白色“*”符号的黑色圆标记来表示，如下所示：
    figure
    subplot(2,3,1),imshow(I);title('原图');
    subplot(2,3,2),imshow(BG);title('背景');
    subplot(2,3,3),imshow(I2);title('消除背景');
    subplot(2,3,4),imshow(bw2);title('二值化');
    subplot(2,3,5),imshow(f);title('标注');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkeRFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
    %     text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % 标注标号
    end
    subplot(2,3,6),imshow(f);title('标注标号');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % 标注标号
    end
    figure,imshow(f);title('标注标号');
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % 标注标号
    end