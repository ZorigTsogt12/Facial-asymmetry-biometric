% Takes in the x and y coordinates of two points and outputs distances
% between
function distance = distanceCalc(xcord1, xcord2, ycord1, ycord2)
%Calculates differences in the two coordinates
xdif = xcord1 - xcord2;
ydif = ycord1 - ycord2;

%Calculates the distance between the two differences
distance = hypot(xdif, ydif);
end

