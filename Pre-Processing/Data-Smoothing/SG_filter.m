% Savitzky-Golay filter
%�˲���Nȡ3��Fȡֵ��ҪΪ����
%���ø�ʽΪH = SG_filter(H(:), N_SG, F_SG);
function[SG] = SG_filter(FRF, N, F)
% 'N' is the order of polynomial fit ��϶���ʽ����
% 'F' is the window length ���ĳ���
[~,g] = sgolay(N,F);   % Calculate S-G coefficients ����S��Gϵ��

HalfWin  = ((F+1)/2) -1;
SG = zeros(size(FRF));
for n = (F+1)/2:length(FRF)-(F+1)/2
  % Zero-th derivative (smoothing only)�Ա����ݽ���ƽ�������漰��΢�ֵ��˲�
  SG(n) =   dot(g(:,1), FRF(n - HalfWin: n + HalfWin));
end