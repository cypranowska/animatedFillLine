function h = animatedFillLine(xdata,upperCurve,lowerCurve,avgCurve,filename,color,transparency)
%animatedFillLine function written by Caroline Cypranowska April 2016
%This function is built off of the jbfill function (John A.
%Brockstege Nov. 2006)
%
%This function takes horizontal vectors of xdata, upperCurve,
%lowerCurve, and avgCurve and plots them iteratively along the length of the xdata
%vector. The xdata, upperCurve, and lowerCurve variables are passed to the fillCurves function to plot the
%area between the upperCurve and lowerCurve while simultaneously plotting
%the avgCurve data. The color of the area and the avgCurve line are
%specified with the color variable, and the transparency of the filled area
%is specified in the transparency variable. 
%
%filename should be a string input with a .avi extension
%
%color can be a string specifier of the color or RGB triplet
%
%transparency is a value from 0 (transparent) to 1 (opaque)

prompt = 'What should the xlabel be?';
xlabelQ = input(prompt,'s'); %Label x axis here

prompt = 'What should the ylabel be?';
ylabelQ = input(prompt,'s'); %Label y axis here

clf

xmin = 0; 
xmax = max(xdata);
ymin = min(lowerCurve);
ymax = max(upperCurve); %calculates the bounds of the plot

h = figure(1);
F = struct('cdata',cell(1,length(xdata)),'colormap', cell(1,length(xdata))); %pre-allocation of space for the movie


for i=1:length(xdata);
    if length(upperCurve(1:i))==length(lowerCurve(1:i)) && length(lowerCurve(1:i))==length(xdata(1:i))
        msg='';
        filled=[upperCurve(1:i),fliplr(lowerCurve(1:i))]; %creating a polygon to be filled
        x=[xdata(1:i),fliplr(xdata(1:i))];
        fillhandle=fill(x,filled,color);%plot the data
        axis([xmin xmax ymin ymax]);%making sure the x and y axes limits stay the same throughout the animation
        xlabel(xlabelQ); 
        ylabel(ylabelQ)
        set(gca,'FontSize',18);
        set(fillhandle,'EdgeColor','none','FaceAlpha',transparency,'EdgeAlpha',transparency);%set edge color, and face and edge transparencies
    else
        msg='Error: Must use the same number of points in each vector';
    end
    hold on
    axis([xmin xmax ymin ymax]); %making sure the axes stay the same for the upcoming plot function
    xlabel(xlabelQ); 
    ylabel(ylabelQ);
    set(gca,'FontSize',18);
    plot(xdata(1:i),avgCurve(1:i),'Color',color,'LineWidth',1.5); %plotting the avgCurve on top of the filled area
    pause(0.08) %pause for animation
    F(i) = getframe(gcf); %adding next frame of movie. gcf can be changed to gca if axis labels in the final movie are not desired.
    hold off
    clf; %clears figure for replotting
end
movie2avi(F, filename,'compression','none'); %converting movie to an uncompressed .avi file