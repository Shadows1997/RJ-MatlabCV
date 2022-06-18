%PCA人脸识别
imgdata=[];%训练图像矩阵
for i=1:5
  for j=1:5
    a=imread(strcat('.\train\s',num2str(i),'\',num2str(j),'.bmp'));
%     name = strcat('.train\0',num2str(i),'-',num2str(j),'m.jpg');
%     b=a(1:112*92); % b是行矢量 1×N，其中N＝10304
    b=a(1:110*90); % b是行矢量 1×N，其中N＝10304
    b=double(b);
    imgdata=[imgdata; b]; % imgdata 是一个M * N 矩阵，imgdata中每一行数据一张图片，M＝200
  end;
end;
imgdata=imgdata'; %每一列为一张图片
imgmean=mean(imgdata,2); % 平均图片，N维列向量
for i=1:25
  minus(:,i) = imgdata(:,i)-imgmean; % minus是一个N*M矩阵，是训练图和平均图之间的差值
end;

covx=minus'* minus; % M * M 阶协方差矩阵
[COEFF, latent,explained] = pcacov(covx'); %PCA，用协方差矩阵的转置来计算以减小计算量

%选择构成95%的能量的特征值
i=1;
proportion=0;
while(proportion < 95)
  proportion=proportion+explained(i);
  i=i+1;
end;
p=i-1;

% 训练得到特征脸坐标系
i=1;
while (i<=p && latent(i)>0)
  base(:,i) = latent(i)^(-1/2)*minus * COEFF(:,i); % base是N×p阶矩阵，用来进行投影，除以latent(i)^(1/2)是对人脸图像的标准化
  i = i + 1;
end

% 将训练样本对坐标系上进行投影,得到一个 p*M 阶矩阵为参考
reference = base'*minus;


accu = 0; %计算准确度
% 测试过程
for i=1:5
    for j=1 %读入40 x 5 副测试图像
      a=imread(strcat('.\test\s',num2str(i),'\',num2str(j),'.bmp'));
      figure();
      imshow(a);
      b=a(1:9900);
      b=double(b);
      b=b';

      object = base'*(b-imgmean);
      distance=100000;

%最小距离法，寻找和待识别图片最为接近的训练图片
      for k=1:25
         temp= norm(object - reference(:,k));
         if (distance > temp)
           which = k;
           distance = temp;
         end;
      end;
      temp1 = which/5;
temp1 = ceil(temp1);
      if (temp1 == floor(temp1))
         left = (temp1-1)*5;
         right = temp1*5;
      else
         left = floor(temp1)*5;
         right = ceil(temp1)*5;
      end;

      if (((i-1)*5+j-5>left)&&((i-1)*5+j-5<=right)) %正确识别
         accu = accu+1;
      end;
   end;
end;

accuracy=accu/25 %输出识别率