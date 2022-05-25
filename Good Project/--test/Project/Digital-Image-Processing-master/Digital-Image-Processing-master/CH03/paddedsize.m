function PQ = paddedsize(AB,CD,PARAM)
%   ����paddedsize��������С�������ڻ���FFT�Ĺ�����
%   PQ = paddedsize(AB),����PQ = 2*AB��AB������Ԫ�ش�С������
%   
%   PQ = paddedsize(AB,'PWR2') ���� PQ(1) = PQ(2) = 2^nextpow(2*m),m��MAX��AB��
%
%   PQ = ��AB,CD)����������Ԫ�ش�С��PQ,PQ = AB + CD - 1
%
%   PQ = ��AB,CD,'PWR2')��������PQ = PQ(1)=PQ(2)=2^nextpow2(2*m),m��MAX��[AB CD]��

if nargin == 1
    PQ = 2*AB;
elseif nargin == 2 && ~ischar(CD)
        PQ = AB + CD - 1;
        PQ = 2 * ceil(PQ / 2);
elseif nargin == 2
        m = max(AB);
        P = 2^nextpow(2*m);
        PQ = [P,P];
elseif (nargin == 3) && strctmpi(PARAM,'pwr2')
    m = max([AB CD]);
    P = 2^nextpow2(2*m);
    PQ = [P,P];
else
    erroe('Wrong number of inputs.')
end
        
        