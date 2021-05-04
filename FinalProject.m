function FinalProject
global gui
close all;
%defines all the different aspects on the graph made
gui.p = plot(0,0);
gui.p.Parent.Units = 'normalized';
gui.p.Parent.Position = [0.15 0.2 0.6 0.7];
gui.Title = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.35 0.95 0.2 0.05]);
gui.yax = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.0, 0.5 0.05 0.15]);
gui.xax = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.425 0.09 0.15 0.05]);
gui.buttonGroup = uibuttongroup('Visible','on','Position',[0.9 0 .2 1]);
gui.xin = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.1 0.0 0.1 0.05]);
gui.yin = uicontrol('style', 'edit', 'units', 'normalized', 'position',[0.25 0.0 0.1 0.05]);
gui.button = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[0.2 0.0 0.05 0.05], 'callback',@pushbutton);
%defines the color of the point on graph
gui.r1 = uicontrol(gui.buttonGroup,'Style','radiobutton','String','Blue','Position',[10 300 100 30],'HandleVisibility','off');              
gui.r2 = uicontrol(gui.buttonGroup,'Style','radiobutton','String','Green','Position',[10 200 100 30],'HandleVisibility','off');
gui.r3 = uicontrol(gui.buttonGroup,'Style','radiobutton', 'String','Red','Position',[10 100 100 30],'HandleVisibility','off');             
gui.buttontype = uibuttongroup('Visible','on','Position',[0.8 0 .1 1]);
%defines the shape of the point on graph
gui.r1 = uicontrol(gui.buttontype,'Style','radiobutton','String','*','Position',[10 300 100 30],'HandleVisibility','off');
gui.r2 = uicontrol(gui.buttontype,'Style','radiobutton','String','-','Position',[10 200 100 30],'HandleVisibility','off');
gui.r3 = uicontrol(gui.buttontype,'Style','radiobutton','String','o','Position',[10 100 100 30],'HandleVisibility','off');
gui.clearbutton = uicontrol('style', 'pushbutton', 'units', 'normalized', 'position',[0.0 0.0 0.05 0.05], 'callback',@allclear);              
end

function [] = pushbutton(~,~)
global gui;
    if  isempty(gui.xin.String) || isempty(gui.yin)
        return;
    end
    %checks if there is something to graph
    xvalue = str2num(gui.xin.String);
    yvalue = str2num(gui.yin.String);
    if length(xvalue) ~= length(yvalue) %causes function to not run if the lengths are not the same
        return;
    end
    lineType = [gui.buttonGroup.SelectedObject.String gui.buttontype.SelectedObject.String];
    gui.p = plot(xvalue,yvalue,lineType);%graphs items
end

function [] = allclear(~,~)
global gui;
    cla(gui.xin);
    cla(gui.yin);
    %clears graph
end