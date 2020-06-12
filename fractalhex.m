function [x, y] = fractalhex(n, p)
    % Every 8 points in the [x,y] arrays form a hexagon that remain in the model at time n, with retention probability p.
    % 1st-6th points: the x,y-coordinates of the 6 vertices of the hexagon.
    % 7th point = the 1st point (for plotting).
    % 8th point = the x,y-coordinates of the center of the hexagon.
    
    theta = 0:60:360;
    if n == 0
        xi = cosd(theta);
        yi = sind(theta);
        x = [xi,0];
        y =[yi,0];
    else
        [a,b] = fractalhex(n-1,p);
        x = [];
        y = [];
        %remove overlapped points first:
        Hraw = [transpose(a),transpose(b)];
        H = uniquetol(Hraw,'Byrows',true);
        %random selection:
        for i = 1:length(H)
            k = rand;
            if k<=p
                if (mod(n,2)==0)
                    mx = H(i,1)+ cosd(theta)/(sqrt(3)^n);
                    my = H(i,2)+ sind(theta)/(sqrt(3)^n);
                else
                    mx = H(i,1)+sind(theta)/(sqrt(3)^n);
                    my = H(i,2)+cosd(theta)/(sqrt(3)^n);
                end
                x = [x, mx, H(i,1)];
                y = [y, my, H(i,2)];
            end
        end
    end 
end
