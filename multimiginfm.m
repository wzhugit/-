function multimiginfm
hold off
close all
format short
global uiCin uiD1 uiD2 uiD3 uil1 uik12 uil2 uil3 uik23 uiTh uiM uint ax1 uiA
figure('Name','多层无限食品迁移模型－质量','Units','normalized','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1],'numbertitle','off');
axes('Units','normalized','Position',[0.25 0.9 0.4 0.1],'Visible','off');
text('Units','normalized','FontUnits','normalized','FontSize',0.65,'String','多层有限包装-无限食品迁移模型');
p21=uipanel('title','迁移参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.01 0.05 0.2 0.9]);
ax1=axes('Units','normalized','visible','off','Position',[0.3 0.1 0.6 0.7]);
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.93 0.4 0.048],'String','初始浓度Cin','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiCin=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.93 0.25 0.048],'Tag','cinedit','String','5');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.87 0.4 0.048],'String','扩散系数D1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiD1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.87 0.25 0.048],'Tag','Dedit','String','1e-4');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.81 0.4 0.048],'String','扩散系数D2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiD2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.81 0.25 0.048],'Tag','Dedit','String','1e-6');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.75 0.4 0.048],'String','扩散系数D3','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiD3=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.75 0.25 0.048],'Tag','Dedit','String','1e-8');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.69 0.4 0.048],'String','再生层厚度l1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.6)
uil1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.69 0.25 0.048],'Tag','l1edit','String','4.8e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.63 0.4 0.048],'String','分配系数k12','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uik12=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.63 0.25 0.048],'Tag','k12edit','String','0.2');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.57 0.4 0.048],'String','原生层厚度l2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uil2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.57 0.25 0.048],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.51 0.4 0.048],'String','分配系数k23','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uik23=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.51 0.25 0.048],'Tag','k23edit','String','0.3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.45 0.4 0.048],'String','第三层厚度l3','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.6)
uil3=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.45 0.25 0.048],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.39 0.4 0.048],'String','迁移时间Th','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiTh=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.39 0.25 0.048],'Tag','Thedit','String','10');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.33 0.4 0.048],'String','空间步数M','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiM=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.33 0.25 0.048],'Tag','Medit','String','100');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.27 0.4 0.048],'String','时间步数nt','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uint=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.27 0.25 0.048],'Tag','ntedit','String','3600');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.21 0.4 0.048],'String','横截面积A','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.65)
uiA=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.21 0.25 0.048],'Tag','ntedit','String','1');
%%
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.08,0.4,0.05],'String','绘制图形','Callback',@plotfunc);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.08,0.4,0.05],'String','清除图形','Callback',['global ax1;','cla;','set(ax1,''visible'',''off'');']);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.25,0.002,0.4,0.05],'String','返回主菜单','Callback','mainfig');

end






function plotfunc(~,~)
global uiCin uiD1 uiD2 uiD3 uil1 uik12 uil2 uik23 uil3 uiTh uiM uint uiA ax1
cin=str2num(get(uiCin,'string'));
D1=str2num(get(uiD1,'string'));
D2=str2num(get(uiD2,'string'));
D3=str2num(get(uiD3,'string'));
l1=str2num(get(uil1,'string'));
l2=str2num(get(uil2,'string'));
l3=str2num(get(uil3,'string'));
K12=str2num(get(uik12,'string'));
K23=str2num(get(uik23,'string'));
Th=str2num(get(uiTh,'string'));
M=str2num(get(uiM,'string'));
nt=str2num(get(uint,'string'));
Ar=str2num(get(uiA,'string'));

l=l1+l2+l3;

h=l/M;
m1=floor(M*l1/l);
m2=floor(M*l2/l);

T=Th*3600;
tao=T/nt;
r1=2*D1*tao/h/h;
r2=2*D2*tao/h/h;
r3=2*D3*tao/h/h;
%Matrix Definition
L=zeros(M+3,M+3);
R=zeros(M+3,M+3);
for i=2:1:m1
   L(i,i)=5/6+r1/2;
   L(i,i-1)=1/12-r1/4;
   L(i,i+1)=1/12-r1/4;
   
   R(i,i)=5/6-r1/2;
   R(i,i-1)=1/12+r1/4;
   R(i,i+1)=1/12+r1/4;
end
L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;
R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;

L(m1+1,m1)=1/12/tao-D1/h/h;L(m1+1,m1+1)=5/12/tao+D1/h/h;L(m1+1,m1+2)=5/12/tao+D2/h/h;L(m1+1,m1+3)=1/12/tao-D2/h/h;
R(m1+1,m1)=1/12/tao+D1/h/h;R(m1+1,m1+1)=5/12/tao-D1/h/h;R(m1+1,m1+2)=5/12/tao-D2/h/h;R(m1+1,m1+3)=1/12/tao+D2/h/h;

for i=m1+2+1:1:m1+m2+1
   L(i,i)=5/6+r2/2;
   L(i,i-1)=1/12-r2/4;
   L(i,i+1)=1/12-r2/4;
   
   R(i,i)=5/6-r2/2;
   R(i,i-1)=1/12+r2/4;
   R(i,i+1)=1/12+r2/4;
end
L(m1+2,m1+1)=K12;L(m1+2,m1+2)=-1;
L(m1+m2+2,m1+m2+1)=1/12/tao-D2/h/h;L(m1+m2+2,m1+m2+2)=5/12/tao+D2/h/h;L(m1+m2+2,m1+m2+3)=5/12/tao+D3/h/h;L(m1+m2+2,m1+m2+4)=1/12/tao-D3/h/h;
R(m1+m2+2,m1+m2+1)=1/12/tao+D2/h/h;R(m1+m2+2,m1+m2+2)=5/12/tao-D2/h/h;R(m1+m2+2,m1+m2+3)=5/12/tao-D3/h/h;R(m1+m2+2,m1+m2+4)=1/12/tao+D3/h/h;
for j=m1+m2+4:M+2
    L(j,j)=5/6+r3/2;
    L(j,j-1)=1/12-r3/4;
    L(j,j+1)=1/12-r3/4;
   
    R(j,j)=5/6-r3/2;
    R(j,j-1)=1/12+r3/4;
    R(j,j+1)=1/12+r3/4;  
end
L(m1+m2+3,m1+m2+2)=K23;L(m1+m2+3,m1+m2+3)=-1;
L(M+3,M+3)=-1;
R(M+3,M+3)=1;
%First Iteration
x=zeros(M+3,1);
MPT=zeros(1,nt);
MCT=zeros(1,nt);
MBT=zeros(1,nt);
MFT=zeros(1,nt);
for i=1:1:m1+1
    x(i,1)=cin;
end
for i=m1+2:1:M+3
    x(i,1)=0;
end
C=zeros(M+3,nt);

D=R*x;
E=L\D;
for i=1:1:M+3
    C(i,1)=E(i,1);
end
for ii=1:1:m1+1
    MPT(1,1)=MPT(1,1)+0.5*h*Ar*(C(ii,1)+C(ii+1,1));
end
for ij=m1+2:1:m1+m2+2
    MCT(1,1)=MCT(1,1)+0.5*h*Ar*(C(ij,1)+C(ij+1,1));
end
for ij=m1+m2+3:1:M+2
    MBT(1,1)=MBT(1,1)+0.5*h*Ar*(C(ij,1)+C(ij+1,1));
end
    MFT(1,1)=cin*Ar*l1-MPT(1,1)-MCT(1,1)-MBT(1,1);
%Interation
for i=1:1:nt-1
    C(m1+2,i)=K12*C(m1+1,i);
    C(m1+m2+3,1)=C(m1+m2+2,1)*K23;
    D=R*C(:,i);
    E=L\D;
    for j=1:1:M+2
       C(j,i+1)=E(j,1);
    end
    C(m1+2,i+1)=K12*C(m1+1,i+1);
    C(m1+m2+3,i+1)=K23*C(m1+m2+2,i+1);
    for ii=1:1:m1+1
    MPT(1,i+1)=MPT(1,i+1)+0.5*h*Ar*(C(ii,i+1)+C(ii+1,i+1));
    end
for ij=m1+2:1:m1+m2+2
    MCT(1,i+1)=MCT(1,i+1)+0.5*h*Ar*(C(ij,i+1)+C(ij+1,i+1));
end
for ij=m1+m2+3:1:M+2
    MBT(1,i+1)=MBT(1,i+1)+0.5*h*Ar*(C(ij,i+1)+C(ij+1,i+1));
end
    MFT(1,i+1)=cin*Ar*l1-MPT(1,i+1)-MCT(1,i+1)-MBT(1,i+1);
end
t=(0:1:nt)*Th/nt;
set(ax1,'visible','on','FontName','Times New Roman','FontSize',12);
hold on
plot(ax1,t,[0,MFT],'r','LineWidth',1.5);
hold on

set(get(ax1,'Xlabel'),'String','t/h','FontSize',12,'FontName','Times New Roman');
set(get(ax1,'Ylabel'),'String','M_{F}/mg','FontSize',12,'FontName','Times New Roman');
set(ax1,'ylim',[0,cin*Ar*l1+0.002])
end
