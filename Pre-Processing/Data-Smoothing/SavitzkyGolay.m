%����ƽ��������������
clear
clc
close all 

sf=200;%����Ƶ��ֵ

load y

x=y(1:100);
k=length(x);
noise = 0.03*randn(1,k);%������̬�ֲ��������ź�
x0=x+noise;%��������ź�
n=length(x0);%ȡ�ź����ݳ���
t=(0:1/sf:(n-1)/sf);% ������ɢʱ��������

x1=SG_filter(x0,3,7);% ʹ��SavitzkyGolay�˲�

plot(t,x0,'r',t,x1,'b');
xlabel('\fontsize{10}\fontname{Times New Roman}Time / s')
ylabel('\fontsize{10}\fontname{Times New Roman}Amplitude / mm')
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
legend('\fontsize{10}\fontname{����}�˲�ǰ','\fontsize{10}\fontname{����}�˲���');
legend boxoff
grid on;
title('\fontsize{10}\fontname{����}�˲�ǰ��Ա�')
set(gcf,'unit','centimeters','position',[28 5 13.53 9.03],'color','white');%��Ӧword��13.5,9��
