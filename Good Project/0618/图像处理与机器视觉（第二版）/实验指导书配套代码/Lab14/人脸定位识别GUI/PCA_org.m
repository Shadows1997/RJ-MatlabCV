%PCA����ʶ��
imgdata=[];%ѵ��ͼ�����
for i=1:5
  for j=1:5
    a=imread(strcat('.\train\s',num2str(i),'\',num2str(j),'.bmp'));
%     name = strcat('.train\0',num2str(i),'-',num2str(j),'m.jpg');
%     b=a(1:112*92); % b����ʸ�� 1��N������N��10304
    b=a(1:110*90); % b����ʸ�� 1��N������N��10304
    b=double(b);
    imgdata=[imgdata; b]; % imgdata ��һ��M * N ����imgdata��ÿһ������һ��ͼƬ��M��200
  end;
end;
imgdata=imgdata'; %ÿһ��Ϊһ��ͼƬ
imgmean=mean(imgdata,2); % ƽ��ͼƬ��Nά������
for i=1:25
  minus(:,i) = imgdata(:,i)-imgmean; % minus��һ��N*M������ѵ��ͼ��ƽ��ͼ֮��Ĳ�ֵ
end;

covx=minus'* minus; % M * M ��Э�������
[COEFF, latent,explained] = pcacov(covx'); %PCA����Э��������ת���������Լ�С������

%ѡ�񹹳�95%������������ֵ
i=1;
proportion=0;
while(proportion < 95)
  proportion=proportion+explained(i);
  i=i+1;
end;
p=i-1;

% ѵ���õ�����������ϵ
i=1;
while (i<=p && latent(i)>0)
  base(:,i) = latent(i)^(-1/2)*minus * COEFF(:,i); % base��N��p�׾�����������ͶӰ������latent(i)^(1/2)�Ƕ�����ͼ��ı�׼��
  i = i + 1;
end

% ��ѵ������������ϵ�Ͻ���ͶӰ,�õ�һ�� p*M �׾���Ϊ�ο�
reference = base'*minus;


accu = 0; %����׼ȷ��
% ���Թ���
for i=1:5
    for j=1 %����40 x 5 ������ͼ��
      a=imread(strcat('.\test\s',num2str(i),'\',num2str(j),'.bmp'));
      figure();
      imshow(a);
      b=a(1:9900);
      b=double(b);
      b=b';

      object = base'*(b-imgmean);
      distance=100000;

%��С���뷨��Ѱ�Һʹ�ʶ��ͼƬ��Ϊ�ӽ���ѵ��ͼƬ
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

      if (((i-1)*5+j-5>left)&&((i-1)*5+j-5<=right)) %��ȷʶ��
         accu = accu+1;
      end;
   end;
end;

accuracy=accu/25 %���ʶ����