function mainfig
close all;
figure('Name','������','Units','normalized','Position',[0.1 0.1 0.85 0.75],'Color',[0.702 0.7804 1],'numbertitle','off');
axes('Units','normalized','Position',[0.25 0.75 0.6 0.2],'Visible','off');
text('Parent',gca,'FontUnits','normalized','FontSize',0.4,'String','˫���װ����Ǩ�Ʒ�ӦԤ��ģ��','Position',[0 0.3],'Color','b');
axes('Units','normalized','Position',[0.7 0.1 0.2 0.2],'Visible','off');
text('Parent',gca,'FontUnits','normalized','FontSize',0.2,'String','������������⿶','Position',[0 0.5],'Color','b');
text('Parent',gca,'FontUnits','normalized','FontSize',0.2,'String','ָ���������ḱ����','Position',[0 0.3],'Color','b');
text('Parent',gca,'FontUnits','normalized','FontSize',0.2,'String','�Ϻ���ѧ����ѧԺ','Position',[0 0.1],'Color','b');
p1=uipanel('title','���ް�װ-����ʳƷ','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.2,'titleposition','centertop','Units','normalized','Position',[0.1 0.48 0.3 0.2]);
btn1a=uicontrol('Units','normalized','Style','Pushbutton','String','Ct','Parent',p1,'Position',[0.15 0.3 0.25 0.3]);
btn1b=uicontrol('Units','normalized','Style','Pushbutton','String','Mt','Parent',p1,'Position',[0.6 0.3 0.25 0.3]);
%%
p2=uipanel('title','���ް�װ-����ʳƷ','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.2,'titleposition','centertop','Units','normalized','Position',[0.65 0.48 0.3 0.2]);
btn2a=uicontrol('Units','normalized','Style','Pushbutton','String','Ct','Parent',p2,'Position',[0.15 0.3 0.25 0.3]);
btn2b=uicontrol('Units','normalized','Style','Pushbutton','String','Mt','Parent',p2,'Position',[0.6 0.3 0.25 0.3]);
%%
p3=uipanel('title','��㸴�����ް�װ-����ʳƷ','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.2,'titleposition','centertop','Units','normalized','Position',[0.1 0.28 0.3 0.2]);
btn3a=uicontrol('Units','normalized','Style','Pushbutton','String','Ct','Parent',p3,'Position',[0.15 0.3 0.25 0.3]);
btn3b=uicontrol('Units','normalized','Style','Pushbutton','String','Mt','Parent',p3,'Position',[0.6 0.3 0.25 0.3]);
%%
p4=uipanel('title','��㸴�����ް�װ-����ʳƷ','ForegroundColor','r','BackgroundColor',[0.702 0.7804 1],'ShadowColor','g','FontUnits','normalized','FontSize',0.2,'titleposition','centertop','Units','normalized','Position',[0.65 0.28 0.3 0.2]);
btn4a=uicontrol('Units','normalized','Style','Pushbutton','String','Ct','Parent',p4,'Position',[0.15 0.3 0.25 0.3]);
btn4b=uicontrol('Units','normalized','Style','Pushbutton','String','Mt','Parent',p4,'Position',[0.6 0.3 0.25 0.3]);
%%
set(btn1a,'Callback','dmiginfc');
set(btn1b,'Callback','dmiginfwithlosttest');
set(btn2a,'Callback','dmigfinitec');
set(btn2b,'Callback','dmigfinitewithlosttest');
set(btn3a,'Callback','multimiginfc');
set(btn3b,'Callback','multimiginfm');
set(btn4a,'Callback','multimigfinitec');
set(btn4b,'Callback','multimigfinitem');