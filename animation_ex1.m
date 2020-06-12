%parameters:
N = 10; %number of iterations
p = 1/3; %retention probability

%generating the initial hexagon 
[xo,yo] = fractalhex(0,1);

fig = figure;

%saving video settings
save = true;
name = 'simulation';

for j = 1:N
    clf('reset');
    theta = 0:60:360;
    x = [];
    y = [];
    %remove repeated points first:
    Hraw = [transpose(xo),transpose(yo)];
    H = uniquetol(Hraw,'Byrows',true);
    %random selection:
    for i = 1:length(H)
        k = rand;
        if k<=p
            if (mod(j,2)==0)
                mx = H(i,1)+ cosd(theta)/(sqrt(3)^j);
                my = H(i,2)+ sind(theta)/(sqrt(3)^j);
            else
                mx = H(i,1)+sind(theta)/(sqrt(3)^j);
                my = H(i,2)+cosd(theta)/(sqrt(3)^j);
            end
            x = [x, mx, H(i,1)];
            y = [y, my, H(i,2)];
        end
    end 
    
    hold on;
    grid on;
    r = length(x)/8;
    for i=1:r
        hex = polyshape(x(1+(i-1)*8:8*i-1),y(1+(i-1)*8:8*i-1));
        poly = plot(hex);
        poly.FaceColor = [0 0 0];
    end
    xlim([-2.5 2.5]);
    ylim([-2.5 2.5]);
    
    title(['Model at time N = ' num2str(j) ' with retaining probability p = ' num2str(p, "%.2f")]);
    xo = x;
    yo = y;
    movieVector(j) = getframe(fig);
    
   
end

%saving the animation
if save     
    myWriter = VideoWriter(name);
    myWriter.FrameRate = 2;
    open(myWriter);
    writeVideo(myWriter, movieVector);
    close(myWriter);
end
