function g = intrans(f,method,varargin)
%intrans�������Զ���ĻҶȱ任��������ʵ�֣���Ƭ�任�������任��٤��任���Ա�����
% g = intrans(f,'neg')ʵ��ͼ��f�ĸ�Ƭ�任
%
% g = intrans(f,'log',c,class) �����任������������c * log(1 + f) �� ���Ͻ����
% �������������Ϊд����cĬ����1. �����class�ͳ����һ��
%
% g = intrans(f,'gamma',gam)��ʹ�ò���gam������ͼ����ִ�в���gamma�ı任
% Ҳ��٤��任����gamma < 1,��ӳ�䱻��Ȩ���ϸߵ����ֵ����gamma > 1, ��ӳ��
% ����Ȩ���ϵ͵����ֵ����gamma = 1����Ϊ����ӳ��
% 
% g = intrans(f,'stretch',m,e)�Ա�����任��ʹ�ñ��ʽ1./(1 + m./f).^e)����
% �任.����m��Χ��[0,1],m��Ĭ��ֵ��mean2(tofloat(f)),e��Ĭ��ֵ��4.
%
% ��������Ĳ��������Ƿ���ȷ
narginchk(2,4)

if strcmp(method,'log')
    %�����任��Ҫ����һ�������任���ܵĺ������
    g = logTransform(f,varargin{:});
    return;
end

if isfloat(f) && (max(f(:)) > 1 || min(f(:)) < 0)
    %���f��float point,�ͼ���Ƿ���[0,1]�ڣ�������ʹ��mat2gray����
    f = mat2gray(f);
end
[f,revertclass] = tofloat(f); %�洢class f�Ա����ʹ�ã�revertclass�Ǻ������

switch method
    case 'neg'
        g = imcomplement(f);
    case 'gamma'
        g = gammaTransform(f,varargin{:});  %varargin�ǿɱ��������
    case 'stretch'
        g = stretchTransform(f,varargin{:});
    case 'specified'
        g = specifiedTransform(f,varargin{:});
    otherwise 
        error('Unknown enhancement method')
end

%ת��������ͼ��class
g = revertclass(g);



%-----------------------------------------------------%
%٤��任
function g = gammaTransform(f,gamma)
g = imadjust(f,[ ],[ ],gamma);
%-----------------------------------------------------%

%-----------------------------------------------------%
%�Ա�����任
function g = stretchTransform(f,varargin)
if isempty(varargin)
    m =mean2(f);
    E = 4.0;
elseif length(varargin) == 2
    m = varargin{1};
    E = varargin{2};
else
    error('Incorrect number of input the stretch method')
end
g = 1./(1 + (m./f).^E);
%-----------------------------------------------------%

%------------------------------------------------------%
function g = logTransform(f,varargin)
[f,revertclass] = tofloat(f);
if numel(varargin) >= 2
    if strcmp(varargin{2},'uint8')
        revertclass = @im2unit8;
    elseif strcmp(varargin{2},'uint16')
        revertclass = @im2uint16;
    else
        error('Unsupported CLASS option for log method')
    end
end
if numel(varargin) < 1
    C = 1;
else
    C = varargin{1};
end
g = C * (log(1 + f));
g = revertclass(g);



