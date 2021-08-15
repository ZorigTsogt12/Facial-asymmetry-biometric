% Takes in 6 points and outputs the angle at which the first two points
% connect

function angle = AngleCalc(midx, jawx, edgex, midy, jawy, edgey)
%Calculate the distances
mid2jawx = midx - jawx;
mid2jawy = midy - jawy;
mid2jaw = hypot(mid2jawx, mid2jawy);

mid2edgex = midx - edgex;
mid2edgey = midy - edgey;
mid2edge = hypot(mid2edgex, mid2edgey);

jaw2edgex = jawx - edgex;
jaw2edgey = jawy - edgey;
jaw2edge = hypot(jaw2edgex, jaw2edgey);

%Calculate the angle
anglerad = acos((mid2jaw.^2 + mid2edge.^2 - jaw2edge.^2)./2.*mid2jaw.*mid2edge);
angle = rad2deg(anglerad); %convert radians to degrees
end

