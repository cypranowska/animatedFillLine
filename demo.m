figure(1), clf
x = linspace(0,2*pi);
y = sin(x);

randVal = rand(1,100);

upperY = randVal + y;
lowerY = y - randVal;

animatedFillLine(x,upperY,lowerY,y,'demo.avi','b',0.4);
%enter desired xlabel and ylabel (in this demo I use x and y)