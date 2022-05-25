function [ xc,yc ] = findcenter( B,ab )
%��ÿ��'��������Ƥ'λ�õ����ļ���
%�������:
%B:��ֵͼ�ı߽������Ԫ������
%ab:�˲���Ҷ�ͼ
%�������:xc:���ĺ����꼯�ϣ�yc:���������꼯��
%author:Faust.Cao
%time:2018.11.1

[x,y]=size(B);
xi=zeros(x,1);
   yi=zeros(x,1);
   xx=zeros(x,1);
   yy=zeros(x,1);
   xc=zeros(x,1);
   yc=zeros(x,1);
   lll=zeros(x,1);
    for i=1:x
      lll(i)=length(B{i});
      ll=length(B{i});
      if ll>9%ȥ����С��������
        for ij=1:ll
          xi(i)=xi(i)+double(ab(B{i}(ij,1),B{i}(ij,2)));
          yi(i)=yi(i)+double(ab(B{i}(ij,1),B{i}(ij,2)));
          xx(i)=xx(i)+double(ab(B{i}(ij,1),B{i}(ij,2))).*B{i}(ij,1);
          yy(i)=yy(i)+double(ab(B{i}(ij,1),B{i}(ij,2))).*B{i}(ij,2);
        end
      end
   xc(i)=xx(i)./xi(i);
   yc(i)=yy(i)./yi(i);
    end
 xc=xc(~isnan(xc));
 yc=yc(~isnan(yc));

end

