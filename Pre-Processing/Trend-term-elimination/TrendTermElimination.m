%��С���˷���������ʽ������

clc
clear
close all

%fni=input('��������ʽ��������������ļ���','s');
%fid=fopen(fni,'r')
%sf=fscanf(fid,'%f',1);     %�������Ƶ��ֵ
%m=fscanf(fid,'%d',1);      %������϶���ʽ����
%fno=fscanf(fid,'%d',1);    %������������ļ���
%x=fscanf(fid,'%f',inf);    %����ʱ�����ݴ��������

sf=200;     %����Ƶ��ֵ
m=1;        %��϶���ʽ������m=1Ϊ����������

load origin  %�����񶯵�ʱ���ź�

x0=origin'; %���벿���񶯵�ʱ���źų�������x0Ϊԭʼ����
%status=fclose(fid);
n=length(x0); %ȡ�ź����ݳ���
t=(0:1/sf:(n-1)/sf)'; % ������ɢʱ��������
a=polyfit(t,x0,m);    % ����������Ķ���ʽ����ϵ��������ʽϵ������������
x1=x0-polyval(a,t);  % ��ԭʼ���ݼ�ȥ�ö���ʽϵ��a���ɵ�������
% x1Ϊ����������

figure(1)
%����ǰ���ź�
subplot(2,1,1)
plot(t,x0,'r');
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
title('\fontsize{10}\fontname{����}�ź�������ȥ��ǰ��Ա�')
ylabel('\fontsize{10}\fontname{Times New Roman}Amplitude')
kk1=legend('\fontsize{10}\fontname{����}����ǰ�ź�');
set(kk1,'Position',[0.668362020824375 0.864949257331002 0.213223790338901 0.0562060900538531]);
legend boxoff
grid on;

%�������ź�
subplot(2,1,2);
plot(t,x1,'b');
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
xlabel('\fontsize{10}\fontname{Times New Roman}Time / s')
ylabel('\fontsize{10}\fontname{Times New Roman}Amplitude')
kk2=legend('\fontsize{10}\fontname{����}������ź�');
set(kk2,'Position',[0.668362020824375 0.394223262014843 0.213223790338901 0.0562060900538532]);
legend boxoff
grid on;
set(gcf,'unit','centimeters','position',[28 5 13.53 9.03],'color','white');%��Ӧword��13.5,9��

save x1;%�����������ݴ�Ϊ.mat�ļ�

% fid=fopen(fno,'w');
% for k=1:n
%    fprintf(fid,'%f%f\n',t(k),y1(k));
% end
% status=fclose(fid);