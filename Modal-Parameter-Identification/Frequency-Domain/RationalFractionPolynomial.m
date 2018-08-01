%%%%%%%%%%%%%%%%%%
%�����ʽ����ʽ��ģ̬����ʶ��%
%%%%%%%%%%%%%%%%%%
%Levy���� %
%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Copyright                        %
%     This code is developed by Jianhui Li    %
%%%%%%%%%%%%%%%%%%%%%%%%%
% 
clc
clear
close all

mn=3;       %ģ̬����

load H00   %����Ƶ������

b=H00';     %ת�� ĳ����ʵ�����鲿��ɵľ���

nm=mn*2;            %�����ݶ���ʽ�Ľ���; N��ģ̬��Ӧ2N���������ʽ
n=length(b(1,:));   %ȡƵ�캯���ĳ���
f=f_start:df:f_start+(n-1)*df;      %������ɢƵ������
w=2*pi*f;               %������ɢ��Ƶ������

wi=w/max(w);        %������һ����ɢʱ��Ƶ���������ں��潫��ԭ��

H=b(1,:)+1i*b(2,:);  %����ʵ��Ԥ�캯������������

[A,B]=invfreqs(H,wi,nm,nm,[],100); %�������Ƶ�캯���ķ��Ӻͷ�ĸϵ������
% ���� AΪ����ϵ��������BΪ��ĸϵ������
% �������ø�ʽΪ [b, a]=invfreqs(H, wi, nb, ba, wt, iter)
% ���ذ���������Ĵ��ݺ�����ĸϵ������a �ͷ���ϵ������b���˴�b2N=1
% HΪָ��ϵͳ�ĸ�Ƶ����Ӧ
% wiΪ��Ӧ��Ӧ������Ƶ��ֵ
% na��nbΪ���ݺ����ķ�ĸ�ͷ��ӵĽ״�
% wtΪȨ�������������ȫΪ1�ļ�Ȩ�����ÿ�����[]����
% iterΪ��������

P=roots(B);             %�ݶ���ʽ�����������㣩
% ������ϵ������B���ɵ��ݶ���ʽ�ĸ�������ϵ������B����������
% ��ʵP����ԭƵ�캯���ļ�������ɵ�����

F1=abs(P)*max(w)/(2*pi);    %����ģ̬Ƶ������
% ��Ϊǰ���һ�����������ﻹԭ
% �������乲��ĳ˻�������=abs(�ø���)
% ͨ������2*pi��Ϊ����Ƶ��

D1=-real(P)./(abs(P));          %�������������
% ��һ�ּ��㷽�����õ���������ȣ����������µ���������Ҫ�ٿ��ǹ�һ����ԭ

%��ʼ��
S1 =zeros(1,nm);

%��������ϵ������
for k=1:nm
    if k==1
        p(1:nm-1)=P(2:nm);
    else
        p(1:k-1)=P(1:k-1);
        p(k:nm-1)=P(k+1:nm);
    end
    y=poly(p);
    % ����p��ȷ������ʽ�ĸ�����������ֵΪ�ö���ʽ��ϵ��������
    S1(k)=polyval(A,P(k))/polyval(y,P(k));
end

%������ϵ�Ƶ�캯��
H1=freqs(A,B,wi);

%����Ƶ�캯���������
nn=1:n;

figure(1)
subplot(3,1,1);
plot(f,real(H(nn)),'b',f,real(H1(nn)),'r:');
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it Real\rm/ m��N^{-1}')
legend('\fontsize{10}\fontname{����}ʵ��','\fontsize{10}\fontname{����}���');
grid on;

subplot(3,1,2);
% plot(f,b(2,:),'b',f,imag(H1(nn)),'r:');
plot(f,imag(H(nn)),'b',f,imag(H1(nn)),'r:');
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it Image\rm/ m��N^{-1}')
legend('\fontsize{10}\fontname{����}ʵ��','\fontsize{10}\fontname{����}���');
grid on;

subplot(3,1,3);
plot(f,abs(H(nn)),'b',f,abs(H1(nn)),'r:');
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it Amplitude\rm/ m��N^{-1}')
legend('\fontsize{10}\fontname{����}ʵ��','\fontsize{10}\fontname{����}���');
grid on;
%��ģ̬Ƶ�ʴ�С��������
[F2,I]=sort(F1);

%�޳����̽��еķ�ģ̬��ǹ�������͹�����ظ��
m=0;

for k=1:nm-1
    
    if F2(k)~=F2(k+1)
        continue
    end
    
    %�����������Ƶ�� ���޳�
    l=I(k);    
    if F1(l)>f_end||F1(l)<f_start
        continue
    end    
    
    m=m+1;% ����ȫ��Ҫ����ӵ��������

    F(m)=F1(l); %ģ̬Ƶ��
    D(m)=D1(l);%�����
    S(m)=S1(l);%����ϵ��
end

OF=F;
OD=D;

% ͨ����ʽ����������������������Ƶ�ʹ�һ��
% Ϊ�˵õ�����ֻ��Ҫ��ԭƵ�ʼ���
ORe=max(w)*S;% ��������
