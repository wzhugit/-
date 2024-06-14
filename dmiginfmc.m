function dmiginfmc
global uiCin uiD uil1 uil2 uiA uiTh uiM uint uilostmodesel uiloststatica uilostedita uiloststaticb uilosteditb uiloststaticc uilosteditc ax1 uiradio1 uitext1
close all
figure('Name','双层包装材料迁移反应数值模拟--无限食品','Units','normalized','numbertitle','off','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1]);
axes('Units','normalized','Position',[0.25 0.9 0.4 0.1],'Visible','off');
text('Units','normalized','FontUnits','normalized','FontSize',0.65,'String','双层有限包装-无限食品迁移反应模型-质量');
ax1=axes('Units','normalized','position',[0.3 0.1 0.45 0.7],'Visible','off','FontSize',12,'FontName','Times New Roman');

%%
%迁移布局
p21=uipanel('title','迁移参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.01 0.05 0.2 0.8]);
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.3,'position',[0.01,0.86,0.4,0.1],'BackgroundColor',[0.702 0.7804 1],'String','再生层污染物初始浓度Cin');
uiCin=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.90,0.4,0.05],'String','5');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.76,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','扩散系数D');
uiD=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.76,0.4,0.05],'String','1e-8');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.66,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','外层厚度l1');
uil1=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.66,0.4,0.05],'String','4.8e-3');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.56,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','内层厚度l2');
uil2=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.56,0.4,0.05],'String','1.6e-3');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.46,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','接触面积A');
uiA=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.46,0.4,0.05],'String','1');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.36,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','迁移时间Th');
uiTh=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.36,0.4,0.05],'String','10');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.26,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','空间步数M');
uiM=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.26,0.4,0.05],'String','100');
uicontrol(p21,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.16,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'String','时间步数nt');
uint=uicontrol(p21,'Style','edit','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.16,0.4,0.05],'String','3600');
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.08,0.4,0.05],'String','绘制图形','Callback',@plotfunc);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.08,0.4,0.05],'String','清除图形','Callback',['global ax1;','cla;','set(ax1,''visible'',''off'');']);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.25,0.002,0.4,0.05],'String','返回主菜单','Callback','mainfig');


%%
%反应损耗函数布局
p22=uipanel('title','反应损耗参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.8 0.05 0.15 0.8]);
uicontrol(p22,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.18,'position',[0.01,0.76,0.2,0.2],'BackgroundColor',[0.702 0.7804 1],'String','损耗模式选择');
uilostmodesel=uicontrol(p22,'Style','popupmenu','Units','normalized','position',[0.5,0.4,0.4,0.5],'String','无反应|at|<html>ba<sup>ct</sup></html>','Callback',@selfunc);
uiloststatica=uicontrol(p22,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.25,'position',[0.01,0.44,0.2,0.2],'BackgroundColor',[0.702 0.7804 1],'String','a','Visible','off');
uilostedita=uicontrol(p22,'Style','edit','Units','normalized','position',[0.5,0.56,0.4,0.05],'Visible','off');
uiloststaticb=uicontrol(p22,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.25,'position',[0.01,0.24,0.2,0.2],'BackgroundColor',[0.702 0.7804 1],'String','b','Visible','off');
uilosteditb=uicontrol(p22,'Style','edit','Units','normalized','position',[0.5,0.36,0.4,0.05],'Visible','off');
uiloststaticc=uicontrol(p22,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.25,'position',[0.01,0.04,0.2,0.2],'BackgroundColor',[0.702 0.7804 1],'String','c','Visible','off');
uilosteditc=uicontrol(p22,'Style','edit','Units','normalized','position',[0.5,0.16,0.4,0.05],'Visible','off');

uiradio1=uicontrol(p22,'Style','radiobutton','Units','normalized','position',[0.5,0.08,0.4,0.05],'BackgroundColor',[0.702 0.7804 1],'Visible','off');
uitext1=uicontrol(p22,'Style','text','Units','normalized','FontUnits','normalized','FontSize',0.28,'position',[0.1,0.05,0.2,0.08],'BackgroundColor',[0.702 0.7804 1],'String','切换损耗加载方式','Visible','off');
end






function plotfunc(~,~)
global uiCin uiD uil1 uil2 uiA uiTh uiM uint ax1 uilostedita uilosteditb uilosteditc uilostmodesel a b c ab uiradio1;
cin=str2num(get(uiCin,'String'));
D=str2num(get(uiD,'String'));
l1=str2num(get(uil1,'String'));
l2=str2num(get(uil2,'String'));
Ar=str2num(get(uiA,'String'));
Th=str2num(get(uiTh,'String'));
M=str2num(get(uiM,'String'));
nt=str2num(get(uint,'String'));
a=str2num(get(uilostedita,'String'));
b=str2num(get(uilosteditb,'String'));
c=str2num(get(uilosteditc,'String'));

val=get(uilostmodesel,'Value');
switch val
    case 1
        a=0;
        b=0;
        c=0;
        ab=exp(1);
        set(uiradio1,'value',0);
    case 2
        a=str2num(get(uilostedita,'String'));
        b=0;
        c=0;
        ab=exp(1);
        set(uiradio1,'value',0);
    case 3
        a=0;
        ab=str2num(get(uilostedita,'String'));
        b=str2num(get(uilosteditb,'String'));
        c=str2num(get(uilosteditc,'String'));
end

MC=PUFMigMCcall(cin,D,D,l1,l2,Ar,1,Th,M,nt);
MC(MC<=0)=0;
t=(0:1:nt)*Th/nt;

hold on


set(ax1,'visible','on');
plot(ax1,t,MC,'r','LineWidth',1.5);
hold on

set(get(ax1,'Xlabel'),'String','t/h','FontSize',12,'FontName','Times New Roman');
set(get(ax1,'Ylabel'),'String','M_{C}/mg','FontSize',12,'FontName','Times New Roman');
set(ax1,'ylim',[0,cin*Ar*l1+0.002])
end

function MCT1=PUFMigMCcall(cin,Dp,Dc,l1,l2,Ar,Kcp,Th,M,nt)
l=l1+l2;
VP=Ar*l1;
h=l/M;
m=floor(M*l1/l);
T=Th*3600;tao=T/nt;
r1=2*Dp*tao/h/h;
r2=2*Dc*tao/h/h;
%Matrix Definition
L=zeros(M+2,M+2);
R=zeros(M+2,M+2);
for i=2:1:m
   L(i,i)=5/6+r1/2;
   L(i,i-1)=1/12-r1/4;
   L(i,i+1)=1/12-r1/4;
   
   R(i,i)=5/6-r1/2;
   R(i,i-1)=1/12+r1/4;
   R(i,i+1)=1/12+r1/4;
end
L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;
L(m+1,m)=1/12/tao-Dp/h/h;L(m+1,m+1)=5/12/tao+Dp/h/h;L(m+1,m+2)=5/12/tao+Dc/h/h;L(m+1,m+3)=1/12/tao-Dc/h/h;
R(m+1,m)=1/12/tao+Dp/h/h;R(m+1,m+1)=5/12/tao-Dp/h/h;R(m+1,m+2)=5/12/tao-Dc/h/h;R(m+1,m+3)=1/12/tao+Dc/h/h;

for i=m+2+1:1:M+1
   L(i,i)=5/6+r2/2;
   L(i,i-1)=1/12-r2/4;
   L(i,i+1)=1/12-r2/4;
   
   R(i,i)=5/6-r2/2;
   R(i,i-1)=1/12+r2/4;
   R(i,i+1)=1/12+r2/4;
end
L(m+2,m+1)=Kcp;L(m+2,m+2)=-1;
L(M+2,M+2)=-1;
R(M+2,M+2)=1;
%First Iteration
x=zeros(M+2,1);
MPT=zeros(1,nt);
MCT=zeros(1,nt);
MFT=zeros(1,nt);
for i=1:1:m+1
    x(i,1)=cin;
end
for i=m+2:1:M+2
    x(i,1)=0;
end
C=zeros(M+2,nt);
D=R*x;
E=L\D;
for i=1:1:M+2
    C(i,1)=E(i,1);
end
for ii=1:1:m
    MPT(1,1)=MPT(1,1)+0.5*h*Ar*(C(ii,1)+C(ii+1,1));
end
for ij=m+2:1:M+1
    MCT(1,1)=MCT(1,1)+0.5*h*Ar*(C(ij,1)+C(ij+1,1));
end
    MFT(1,1)=cin*VP-MPT(1,1)-MCT(1,1);
%Interation
for i=1:1:nt-1
    C(m+2,i)=Kcp*C(m+1,i);
    D=R*C(:,i);
    E=L\D;
    for j=1:1:M+2
       C(j,i+1)=E(j,1);
    end
    C(m+2,i+1)=Kcp*C(m+1,i+1);
    for ii=1:1:m
        MPT(1,i+1)=MPT(1,i+1)+0.5*h*Ar*(C(ii,i+1)+C(ii+1,i+1));
    end
    for ij=m+2:1:M+1
        MCT(1,i+1)=MCT(1,i+1)+0.5*h*Ar*(C(ij,i+1)+C(ij+1,i+1));
    end
    MFT(1,i+1)=cin*VP-MPT(1,i+1)-MCT(1,i+1);
end
MCT1=[0,MCT];
end




function selfunc(~,~)
global uilostmodesel uiloststatica uilostedita uiloststaticb uilosteditb uiloststaticc uilosteditc a b c ab uiradio1 uitext1
val=get(uilostmodesel,'Value');
switch val
    case 1
        set(uiloststatica,'Visible','off');
        set(uilostedita,'Visible','off');
        a=0;
        set(uiloststaticb,'Visible','off');
        set(uilosteditb,'Visible','off');
        b=0;
        set(uiloststaticc,'Visible','off');
        set(uilosteditc,'Visible','off');
        c=0;
        set(uiradio1,'Visible','off');
        set(uitext1,'Visible','off');
        set(uiradio1,'value',0);
    case 2
        set(uiloststatica,'Visible','on');
        set(uilostedita,'Visible','on');
        a=str2num(get(uilostedita,'String'));
        set(uiloststaticb,'Visible','off');
        set(uilosteditb,'Visible','off');
        b=0;
        set(uiloststaticc,'Visible','off');
        set(uilosteditc,'Visible','off');
        c=0;
        set(uiradio1,'Visible','off');
        set(uitext1,'Visible','off');
    case 3
        set(uiloststatica,'Visible','on');
        set(uilostedita,'Visible','on');
        ab=str2num(get(uilostedita,'String'));
        
        set(uiloststaticb,'Visible','on');
        set(uilosteditb,'Visible','on');
        b=str2num(get(uilosteditb,'String'));
        
        set(uiloststaticc,'Visible','on');
        set(uilosteditc,'Visible','on');
        c=str2num(get(uilosteditc,'String'));
        set(uiradio1,'Visible','on');
        set(uitext1,'Visible','on');
end
end
