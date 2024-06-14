function dmiginfc
hold off
close all
format short
global uiCin uiD uil1 uil2 uiTh uiM uint ax1
figure('Name','无限食品－浓度','Units','normalized','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1],'numbertitle','off');
p21=uipanel('title','迁移参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.01 0.05 0.2 0.8]);
axes('Units','normalized','Position',[0.25 0.9 0.4 0.1],'Visible','off');
text('Units','normalized','FontUnits','normalized','FontSize',0.65,'String','双层有限包装-无限食品迁移反应模型-浓度');
ax1=axes('Units','normalized','Position',[0.3 0.1 0.6 0.75],'visible','off','FontSize',12,'FontName','Times New Roman');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.9 0.4 0.05],'String','初始浓度Cin','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiCin=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.9 0.25 0.05],'Tag','cinedit','String','5');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.8 0.4 0.05],'String','扩散系数D','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiD=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.8 0.25 0.05],'Tag','Dedit','String','1e-8');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.7 0.4 0.05],'String','再生层厚度l1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.7 0.25 0.05],'Tag','l1edit','String','4.8e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.6 0.4 0.05],'String','原生层厚度l2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.6 0.25 0.05],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.5 0.4 0.05],'String','迁移时间Th','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiTh=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.5 0.25 0.05],'Tag','Thedit','String','10/3600');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.4 0.4 0.05],'String','空间步数M','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiM=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.4 0.25 0.05],'Tag','Medit','String','100');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.3 0.4 0.05],'String','时间步数nt','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uint=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.3 0.25 0.05],'Tag','ntedit','String','3600');
%%
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.08,0.4,0.05],'String','绘制图形','Callback',@plotbtnfunc);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.08,0.4,0.05],'String','清除图形','Callback',['global ax1;','cla;','set(ax1,''visible'',''off'');']);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.25,0.002,0.4,0.05],'String','返回主菜单','Callback','mainfig');
%%

end

%%
function plotbtnfunc(~,~)

global uiCin uiD uil1 uil2 uiTh uiM uint ax1

cin=str2num(get(uiCin,'string'));
Dp=str2num(get(uiD,'string'));
Dc=str2num(get(uiD,'string'));
l1=str2num(get(uil1,'string'));
l2=str2num(get(uil2,'string'));
Kcp=1;
Th=str2num(get(uiTh,'string'));
M=str2num(get(uiM,'string'));
nt=str2num(get(uint,'string'));

l=l1+l2;

h=l/M;
m=floor(M*l1/l);
T=Th*3600;
tao=T/nt;
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

L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;
R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;

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

%Interation
for i=1:1:nt-1
    C(m+2,i)=Kcp*C(m+1,i);
    D=R*C(:,i);
    E=L\D;
    for j=1:1:M+2
       C(j,i+1)=E(j,1);
    end
    C(m+2,i+1)=Kcp*C(m+1,i+1);
end



m=floor(M*l1/l);
set(ax1,'visible','on')
plot(0:1:m,C(1:1:m+1,end),'r','LineWidth',1.5)
hold on
plot(m:1:M,C(m+2:1:M+2,end),'r','LineWidth',1.5)

set(ax1,'Xlim',[0,M],'Ylim',[0,cin]);

DPxtick=0:((M-0)/10):M;DPytick=0:((cin-0)/10):cin;
set(ax1,'FontSize',12,'FontName','Times New Roman');
set(ax1,'Xtick',DPxtick,'Ytick',DPytick);
set(ax1,'XTickLabelMode','manual','XTickLabel','0|1|2|3|4|5|6|7|8|9|10');

set(ax1,'YTickLabelMode','manual','YTickLabel',[0;cin/10;2*cin/10;3*cin/10;4*cin/10;...
    5*cin/10;6*cin/10;7*cin/10;8*cin/10;9*cin/10;cin]);

xlabelCT{1}='x/';xlabelCT{2}=num2str(l/10);xlabelCT{3}='cm';
xlabelCT1=[xlabelCT{1},xlabelCT{2},xlabelCT{3}];
set(get(ax1,'XLabel'),'String',xlabelCT1,'FontSize',12,'FontName','Times New Roman');
set(get(ax1,'YLabel'),'String','C/mg·cm^{-3}','FontSize',12,'FontName','Times New Roman');


end


