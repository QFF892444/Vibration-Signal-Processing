%����ƽ��������������
clear
clc
close all 
%fni=input('����ƽ����ƽ���������������ļ���','s');
%fid=fopen(fni,'r')
%sf=fscanf(fid,'%f',1);     %�������Ƶ��ֵ
%l=fscanf(fid,'%d',1);      %���뻬���״�
%m=fscanf(fid,'%d',1);      %����ƽ������
%fno=fscanf(fid,'%d',1);    %������������ļ���
%x=fscanf(fid,'%f',inf);    %����ʱ�����ݴ��������
sf=200;%����Ƶ��ֵ
l=30;%����������
m=300;
% fno='out4_3.mat';
load y
x=y(1:1000);
%status=fclose(fid);
n=length(x);%ȡ�ź����ݳ���
t=(0:1/sf:(n-1)/sf);% ������ɢʱ��������
b=ones(1,l);%����һ��Ԫ�� 1 ��������
a=[b*x(1),x,b*x(n)];%�ź����˷ֱ���������l������
b=a;

for k=1:m
    for j=l+1:n-1
        b(j)=mean(a(j-1:j+1));
    end
    a=b;
end
y=x(1:n)-a(l+1:n+l);

plot(t,x,'r',t,y,'g',t,a(l+1:n+l),'b-.');

xlabel('\fontsize{10}\fontname{Times New Roman}Time / s')
ylabel('\fontsize{10}\fontname{Times New Roman}Amplitude / mm')
set(gca,'FontSize', 10 ,'FontName', 'Times New Roman')
legend('\fontsize{10}\fontname{����}�˲�ǰ','\fontsize{10}\fontname{����}�˲���','\fontsize{10}\fontname{����}������');
legend boxoff
grid on;
set(gcf,'unit','centimeters','position',[28 5 13.53 9.03],'color','white');%��Ӧword��13.5,9��

% fid=fopen(fno,'w');
% for k=1:n
%    fprintf(fid,'%f%f\n',t(k),y(k));
% end
% status=fclose(fid);