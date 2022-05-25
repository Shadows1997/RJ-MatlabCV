function g = splitmerge(f,mindim,fun)
%   ����splitmergeʵ������ָ�ϲ��㷨
%   ���б�Ҫ���ú����Ὣͼ�����Ϊ�����Σ��Ա�qtdecomp���������Ϊ1*1�ĵ�������
%   ͼ�������ɺ���qtdecomp�ֿ飬����split_test��predicateȷ��һ�������Ƿ�Ӧ�÷��롣
%   
%   ����mindim����ֽ����������С��ĳߴ�
%   funʹ��@predicate
%
%   function flag = predicate(region)
%   sd = std2(region);
%   m = mean2(region);
%   flag = (sd > 10) & (m > 0) & (n < 125);

%   ���ͼ��Ϊ������
Q = 2^nextpow2(max(size(f)));
[M,N] = size(f);
f = padarray(f,[Q - M,Q - N],'post');

%   ��ͼ��ֿ�,Ȼ��ִ�кϲ�
Z = qtdecomp(f,@split_test,mindim,fun)

%   ����ȡ�÷ֿ�������
Lmax = full(max(Z(:)));

%   Ȼ�����ͼ����0,MAKER�����Ժ�����ʵ�ֹ���
g = zeros(size(f));
MARKER = zeros(size(f));

%   ��ʼʵ�ֺϲ�
for K = 1:Lmax
    [vals,r,c] = qtgetblk(f,Z,K);
    if ~isempty(vals)
        for I = 1:length(r)
            xlow = r(I);ylow = c(I);
            xhigh = xlow + K - 1;yhigh = ylow + K - 1;
            region = f(xlow:xhigh,ylow:yhigh);
            flag = fun(region);
            if flag
                g(xlow:xhigh,ylow:yhigh) = 1;
                MARKER(xlow,ylow) = 1;
            end
        end
    end
end

%   ���ʹ�ú���bwlabel���ÿһ����������ͱ�ǩ
g = bwlabel(imreconstruct(MARKER,g));

g = g(1:M,1:N);

%------------------------------------------------------------------------%
function v = split_test(B,mindim,fun)
%   ����split_testȷ��һ�������Ƿ�Ӧ�ñ�����
%   logical 1s(TRUE) �������Ӧ�ñ�����
%   logical 0s(FALSE) ������

%   k��ȡ����B�е�����
k = size(B,3);

v(1:k) = false;
for I = 1:k
    quadregion = B(:,:,I);
    if size(quadregion,1) <= mindim
        v(I) = false;
        continue
    end
    flag = fun(quadregion);
    if flag
        v(I) =  true;
    end
end

