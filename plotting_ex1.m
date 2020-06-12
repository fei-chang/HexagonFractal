%example code for generating multiple plots using the fractalhex function

%plot setting
plot_col = 1; %number of columns of plots
plot_row = 1; %number of rows of plots
total_plots = plot_col * plot_row;

t = tiledlayout(plot_row, plot_col); 
t.Padding = 'none';
t.TileSpacing = 'none';

%parameters:
N = 10; %number of iterations in each plot
p = 1/3; %retention probability

for j = 1:total_plots
    nexttile;
    [x,y] = fractalhex(N, p);
    hold on;
    grid on;
    r = length(x)/8;
    for i=1:r
        hex = polyshape(x(1+(i-1)*8:8*i-1),y(1+(i-1)*8:8*i-1));
        pl = plot(hex);
        %color of hexagons
        pl.FaceColor = [0 0 0];
        %transparancy of hexagons
        pl.FaceAlpha = 0.3;
    end
    xlim([-2.5 2.5]);
    ylim([-2.5 2.5]);
end
