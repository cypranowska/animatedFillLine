# animatedFillLine
A Matlab function for animating your data. The function fills the area between two curves while plotting the average, and writes an avi of the area and line sweeping across a plot. 

The function takes the following arguments:

``` h = animatedFillLine(xdata,upperCurve,lowerCurve,avgCurve,filename,color,transparency) ```

* `xdata` is a vector of points along the x axis 
* `upperCurve` is a vector of y values that constitute the upper curve of the area to be filled
* `lowerCurve` is a vector of y values that constitute the lower curve of the area to be filled
* `avgCurve` is a vector of y values that will be plotted as a line between the filled area
* `filename` is the desired filename of the uncompressed avi written by the function
* `color` specifies the color of the area and accompanying line to be plotted (can be a string or RGB triplet)
* `transparency` is a value between 0 and 1 that sets the opacity of the filled area of the plot

`xdata`, `upperCurve`, `lowerCurve`, `avgCurve` all must be horizontal vectors. 

Try it out in `demo.m`

![alt text](https://github.com/cypranowska/animatedFillLine/blob/master/demo.png "demo.png")
