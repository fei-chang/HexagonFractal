function [x, y] = fractalhex(n, p)
    grid on;
    %determine whether or not previous layers remain
    %hold on;
    theta = 0:60:360;
    if n == 0
        xi = cosd(theta);
        yi = sind(theta);
        x = [xi,0];
        y =[yi,0];
        %plot(polyshape(x,y));
    else
        [a,b] = fractalhex(n-1,p);
        x = [];
        y = [];
        
        for i = 1:length(a)
            k = rand;
            if k<=p
                if (mod(n,2)==0)
                    mx = a(i)+ cosd(theta)/(sqrt(3)^n);
                    my = b(i)+ sind(theta)/(sqrt(3)^n);
                else
                    mx = a(i)+sind(theta)/(sqrt(3)^n);
                    my = b(i)+cosd(theta)/(sqrt(3)^n);
                end
                %fprintf("The selected area are bounded by\n");
                %disp(mx);
                %disp(my);
                %fprintf("\n");
                %hold on
                %plot(polyshape(mx,my));
                x = [x, mx, a(i)];
                y = [y, my, b(i)];
            end
        end
    end 
end
