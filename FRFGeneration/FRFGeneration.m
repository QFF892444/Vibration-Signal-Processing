%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ƶ�캯�����ɣ�����ģ̬Ƶ�ʡ�ģ̬�նȡ������%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Copyright                        %
%     This code is developed by Jianhui Li    %
%%%%%%%%%%%%%%%%%%%%%%%%%

%FRF Generation
clc
close all
clear

% ����ģ̬����
k = [1.2e7 1.3e7 3.7e6];                     % N/m
zeta = [0.041 0.048 0.027];
wn = [1198 1389 1586]*2*pi;               % rad/s

f_start=0;
f_end=3000-0.5;
df=0.5;
w = (f_start:df:f_end)'*2*pi;   % frequency, rad/s
f=w/2/pi;


% �ϳ�Ƶ��
FRF = (wn(1)^2/k(1))./(wn(1)^2 - w.^2 + 1i*2*zeta(1)*wn(1).*w);
for cnt = 2:length(k)
    FRF = FRF + (wn(cnt)^2/k(cnt))./(wn(cnt)^2 - w.^2 + 1i*2*zeta(cnt)*wn(cnt).*w);
end

FRFMag=sqrt(real(FRF).^2+imag(FRF).^2);

% ����ϵͳƵ��
figure(1)
plot(f,FRFMag,'b-','linewidth',2)
hold on
xlim([200,2200])
grid on  
legend('\fontsize{10}\fontname{Times New Roman}\itFRF','location','northwest')
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
title('\fontsize{10}FRF')
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it FRF\rm/ m��N^{-1}')
hold on

h1=real(FRF);
h2=imag(FRF);

figure(2)
subplot(211)
plot(f,h1,'b-','linewidth',2)
hold on
xlim([200,2200])
grid on  
legend('\fontsize{10}\fontname{Times New Roman}\itRea;','location','northwest')
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
title('\fontsize{10}FRF')
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it FRF\rm/ m��N^{-1}')

subplot(212)
plot(f,h2,'b-','linewidth',2)
hold on
xlim([200,2200])
grid on  
legend('\fontsize{10}\fontname{Times New Roman}\itImag','location','northwest')
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
set(gcf,'unit','centimeters','position',[0 10 13.53 9.03],'color','white');%��Ӧword��13.5,9��
title('\fontsize{10}FRF')
xlabel('\fontsize{10}\fontname{Times New Roman}\it f\rm/ Hz')
ylabel('\fontsize{10}\fontname{Times New Roman}\it FRF\rm/ m��N^{-1}')

% �洢Ϊ.mat �ļ����ļ���ΪH00�����а�������H00��f_start��f_end��df
H00=[h1,h2];
save ('H00','H00','f_start','f_end','df')