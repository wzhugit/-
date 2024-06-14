function dmigfinitec
hold off
close all
format short
global uiCin uiD uil1 uil2 uiTh uiM uint uivf uihm uikpf ax1 uiA
figure('Name','有限食品－浓度','Units','normalized','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1],'numbertitle','off');
axes('Units','normalized','Position',[0.25 0.9 0.4 0.1],'Visible','off');
text('Units','normalized','FontUnits','normalized','FontSize',0.65,'String','双层有限包装-有限食品迁移反应模型-浓度');
p21=uipanel('title','迁移参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.01 0.05 0.2 0.9]);
ax1=axes('Units','normalized','Position',[0.3 0.1 0.6 0.7],'visible','off','FontSize',12,'FontName','Times New Roman');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.913 0.4 0.05],'String','初始浓度Cin','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiCin=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.913 0.25 0.05],'Tag','cinedit','String','5');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.85 0.4 0.05],'String','扩散系数D','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiD=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.85 0.25 0.05],'Tag','Dedit','String','1e-8');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.787 0.4 0.05],'String','界面分配系数kpf','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.48)
uikpf=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.787 0.25 0.05],'Tag','Dedit','String','5');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.724 0.4 0.05],'String','再生层厚度l1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.724 0.25 0.05],'Tag','l1edit','String','4.8e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.661 0.4 0.05],'String','原生层厚度l2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.661 0.25 0.05],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.598 0.4 0.05],'String','迁移时间Th','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiTh=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.598 0.25 0.05],'Tag','Thedit','String','10/3600');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.535 0.4 0.05],'String','空间步数M','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiM=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.535 0.25 0.05],'Tag','Medit','String','100');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.472 0.4 0.05],'String','时间步数nt','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uint=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.472 0.25 0.05],'Tag','ntedit','String','3600');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.409 0.4 0.05],'String','食品体积VF','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uivf=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.409 0.25 0.05],'Tag','vfedit','String','100');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.346 0.4 0.05],'String','传质系数hm','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uihm=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.346 0.25 0.05],'Tag','hmedit','String','1e-7');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.283 0.4 0.05],'String','接触面积A','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiA=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.283 0.25 0.05],'Tag','hmedit','String','1');
%%
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.12,0.4,0.05],'String','绘制图形','Callback',@plotbtnfunc);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.12,0.4,0.05],'String','清除图形','Callback',['global ax1;','cla;','set(ax1,''visible'',''off'');']);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.25,0.002,0.4,0.05],'String','返回主菜单','Callback','mainfig');
%%

end

%%
function plotbtnfunc(~,~)

global uiCin uiD uil1 uil2 uiTh uiM uint uivf uihm uikpf ax1 uiA

cin=str2num(get(uiCin,'string'));
Dp=str2num(get(uiD,'string'));
Dc=str2num(get(uiD,'string'));
l1=str2num(get(uil1,'string'));
l2=str2num(get(uil2,'string'));
Kcp=1;
VF=str2num(get(uivf,'string'));
hm=str2num(get(uihm,'string'));
Kpf=str2num(get(uikpf,'string'));
Th=str2num(get(uiTh,'string'));
M=str2num(get(uiM,'string'));
nt=str2num(get(uint,'string'));
Ar=str2num(get(uiA,'string'));

l=l1+l2;
% VP=Ar*l1;
h=l/M;
m=floor(M*l1/l);
T=Th*3600;tao=T/nt;
r1=2*Dp*tao/h/h;
r2=2*Dc*tao/h/h;
%Matrix Definition
L=zeros(M+3,M+3);R=zeros(M+3,M+3);
for i=2:1:m
   L(i,i)=5/6+r1/2;L(i,i-1)=1/12-r1/4;L(i,i+1)=1/12-r1/4;
   R(i,i)=5/6-r1/2;R(i,i-1)=1/12+r1/4;R(i,i+1)=1/12+r1/4;
end
L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;

L(m+1,m)=1/12/tao-Dp/h/h;L(m+1,m+1)=5/12/tao+Dp/h/h;L(m+1,m+2)=5/12/tao+Dc/h/h;L(m+1,m+3)=1/12/tao-Dc/h/h;
R(m+1,m)=1/12/tao+Dp/h/h;R(m+1,m+1)=5/12/tao-Dp/h/h;R(m+1,m+2)=5/12/tao-Dc/h/h;R(m+1,m+3)=1/12/tao+Dc/h/h;

for i=m+2+1:1:M+1
   L(i,i)=5/6+r2/2;L(i,i-1)=1/12-r2/4;L(i,i+1)=1/12-r2/4;
   R(i,i)=5/6-r2/2;R(i,i-1)=1/12+r2/4;R(i,i+1)=1/12+r2/4;
end
L(m+2,m+1)=Kcp;L(m+2,m+2)=-1;

L(M+1+1,M+1)=1/12-r2/2;L(M+1+1,M+1+1)=5/12+hm*tao/h+r2/2;L(M+1+1,M+1+1+1)=-hm*tao/h*Kpf;
R(M+1+1,M+1)=1/12+r2/2;R(M+1+1,M+1+1)=5/12-hm*tao/h-r2/2;R(M+1+1,M+1+1+1)=hm*tao/h*Kpf;
for i=2:1:M+1
    L(M+3,i)=0.5*Ar*h;
    R(M+3,i)=-0.5*Ar*h;
end
L(M+1+1+1,1)=0.25*Ar*h;L(M+1+1+1,m+1)=0.25*Ar*h;L(M+1+1+1,m+2)=0.25*Ar*h;L(M+1+1+1,M+2)=0.25*Ar*h;L(M+1+1+1,M+1+1+1)=0.5*VF;
R(M+1+1+1,1)=-0.25*Ar*h;R(M+1+1+1,m+1)=-0.25*Ar*h;R(M+1+1+1,m+2)=-0.25*Ar*h;R(M+1+1+1,M+2)=-0.25*Ar*h;R(M+1+1+1,M+1+1+1)=-0.5*VF;
%First Iteration
x=zeros(M+3,1);
% MFT=zeros(1,nt);
CinVP=zeros(M+3,1);
CinVP(M+3,1)=cin*Ar*l1;
for i=1:1:m+1
    x(i,1)=cin;
end
for i=m+2:1:M+3
    x(i,1)=0;
end
C=zeros(M+3,nt);

D=R*x;
D1=D+CinVP;
E=L\D1;
for i=1:1:M+3
    C(i,1)=E(i,1);
end

%Interation
for i=1:1:nt-1
    C(m+2,i)=Kcp*C(m+1,i);
    D=R*C(:,i);
    D1=D+CinVP;
    E=L\D1;
    for j=1:1:M+3
        C(j,i+1)=E(j,1);
    end
    C(m+2,i+1)=Kcp*C(m+1,i+1);
end


m=floor(M*l1/l);
set(ax1,'visible','on');
plot(0:1:m,C(1:1:m+1,end),'r','LineWidth',1.5);
hold on
plot(m:1:M,C(m+2:1:M+2,end),'r','LineWidth',1.5);


set(ax1,'Xlim',[0,M],'Ylim',[0,cin]);

DPxtick=0:((M-0)/10):M;DPytick=0:((cin-0)/10):cin;
set(ax1,'Xtick',DPxtick,'Ytick',DPytick);
set(ax1,'XTickLabelMode','manual','XTickLabel','0|1|2|3|4|5|6|7|8|9|10');

set(ax1,'YTickLabelMode','manual','YTickLabel',[0;cin/10;2*cin/10;3*cin/10;4*cin/10;...
    5*cin/10;6*cin/10;7*cin/10;8*cin/10;9*cin/10;cin]);

xlabelCT{1}='x/';xlabelCT{2}=num2str(l/10);xlabelCT{3}='cm';
xlabelCT=[xlabelCT{1},xlabelCT{2},xlabelCT{3}];
set(get(ax1,'XLabel'),'String',xlabelCT,'FontSize',12,'FontName','Times New Roman');
set(get(ax1,'YLabel'),'String','C/mg·cm^{-3}','FontSize',12,'FontName','Times New Roman');


end



