function  newIm= light_use(im)
%im:ԭʼͼ��;w �˲������С;isShow �Ƿ���ʾ�м����
%
%
w = 3;
bk=double(im);
%��Сֵ�˲�
bk=ordfilt2(bk,1,ones(w,w),'symmetric');
%��ֵ�˲�
h=ones(w,w)/(w*w);
bk=imfilter(bk,h,'replicate');

%�������Ȳ����Ľ��
newIm=imsubtract(double(im),bk);
end