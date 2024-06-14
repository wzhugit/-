function multimiginfc
hold off
close all
format short
global uiCin uiD1 uiD2 uiD3 uil1 uik12 uil2 uil3 uik23 uiTh uiM uint ax1
figure('Name','多层无限食品迁移模型－浓度','Units','normalized','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1],'numbertitle','off');
axes('Units','normalized','Position',[0.25 0.9 0.4 0.1],'Visible','off');
text('Units','normalized','FontUnits','normalized','FontSize',0.65,'String','多层有限包装-无限食品迁移模型');
p21=uipanel('title','迁移参数设置','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.04,'titleposition','centertop','Units','normalized','Position',[0.01 0.05 0.2 0.88]);
ax1=axes('Units','normalized','visible','off','Position',[0.3 0.1 0.6 0.7],'FontSize',12,'FontName','Times New Roman');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.93 0.4 0.05],'String','初始浓度Cin','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiCin=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.93 0.25 0.05],'Tag','cinedit','String','5');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.86 0.4 0.05],'String','扩散系数D1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiD1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.86 0.25 0.05],'Tag','Dedit','String','1e-4');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.79 0.4 0.05],'String','扩散系数D2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiD2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.79 0.25 0.05],'Tag','Dedit','String','1e-6');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.72 0.4 0.05],'String','扩散系数D3','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiD3=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.72 0.25 0.05],'Tag','Dedit','String','1e-8');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.65 0.4 0.05],'String','再生层厚度l1','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil1=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.65 0.25 0.05],'Tag','l1edit','String','4.8e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.58 0.4 0.05],'String','分配系数k12','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uik12=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.58 0.25 0.05],'Tag','k12edit','String','0.2');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.51 0.4 0.05],'String','原生层厚度l2','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil2=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.51 0.25 0.05],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.44 0.4 0.05],'String','分配系数k23','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uik23=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.44 0.25 0.05],'Tag','k23edit','String','0.3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.37 0.4 0.05],'String','第三层厚度l3','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uil3=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.37 0.25 0.05],'Tag','l2edit','String','1.6e-3');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.3 0.4 0.05],'String','迁移时间Th','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiTh=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.3 0.25 0.05],'Tag','Thedit','String','10/3600');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.23 0.4 0.05],'String','空间步数M','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uiM=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.23 0.25 0.05],'Tag','Medit','String','100');
%%
uicontrol(p21,'Units','normalized','Style','text','Position',[0.15 0.16 0.4 0.05],'String','时间步数nt','BackgroundColor',[0.702 0.7804 1],'FontUnits','normalized','FontSize',0.55)
uint=uicontrol(p21,'Units','normalized','Style','edit','Position',[0.6 0.16 0.25 0.05],'Tag','ntedit','String','3600');
%%
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.01,0.08,0.4,0.05],'String','绘制图形','Callback',@plotbtnfunc);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.55,0.08,0.4,0.05],'String','清除图形','Callback',['global ax1;','cla;','set(ax1,''visible'',''off'');']);
uicontrol(p21,'Style','push','Units','normalized','FontUnits','normalized','FontSize',0.6,'position',[0.25,0.002,0.4,0.05],'String','返回主菜单','Callback','mainfig');
%%

end

%%
function plotbtnfunc(~,~)

global uiCin uiD1 uiD2 uiD3 uil1 uik12 uil2 uik23 uil3 uiTh uiM uint ax1

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
L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;

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
end



m1=floor(M*l1/l);
set(ax1,'visible','on','FontName','Times New Roman','FontSize',12);
plot(0:1:m1,C(1:1:m1+1,end),'r','LineWidth',1.5)
hold on
plot(m1:1:m1+m2,C(m1+2:1:m1+m2+2,end),'r','LineWidth',1.5)
plot(m1+m2:1:M,C(m1+m2+3:1:M+3,end),'r','LineWidth',1.5)

set(ax1,'Xlim',[0,M],'Ylim',[0,cin]);

DPxtick=0:((M-0)/10):M;DPytick=0:((cin-0)/10):cin;
set(ax1,'Xtick',DPxtick,'Ytick',DPytick);
set(ax1,'XTickLabelMode','manual','XTickLabel','0|1|2|3|4|5|6|7|8|9|10');

set(ax1,'YTickLabelMode','manual','YTickLabel',[0;cin/10;2*cin/10;3*cin/10;4*cin/10;...
    5*cin/10;6*cin/10;7*cin/10;8*cin/10;9*cin/10;cin]);

xlabelCT{1}='x/';xlabelCT{2}=num2str(l/10);xlabelCT{3}='cm';
xlabelCT1=[xlabelCT{1},xlabelCT{2},xlabelCT{3}];
set(get(ax1,'XLabel'),'String',xlabelCT1,'FontSize',12,'FontName','Times New Roman');
set(get(ax1,'YLabel'),'String','C/mg·cm^{-3}','FontSize',12,'FontName','Times New Roman');


end


