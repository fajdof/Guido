function [  ] = drawNFSTestGraph(  )
global draw;
filename = uigetfile;
% load data
saved_data_results = load(filename,'results');
saved_data_results = saved_data_results.results;
x_for_size = load(filename,'x_for_size');
x_for_size = x_for_size.x_for_size;
y_for_size = load(filename,'y_for_size');
y_for_size = y_for_size.y_for_size;
xstep = load(filename,'xstep');
xstep = xstep.xstep;
ystep = load(filename,'ystep');
ystep = ystep.ystep;
freq = load(filename,'freq');
freq = freq.freq;
unit_y = load(filename,'unit_y');
unit_y = unit_y.unit_y;
% Print graphs
switch draw.graph_print
    case 2
        % OPTIONAL: print graph from specific coordinate
        c=0;
        down=0;
        xpos=0;
        ypos=0;
        for m = 1:x_for_size
            down=xor(down,1);
            for n = 1:y_for_size
                c=c+1;
                if ((str2double(draw.x_coor)==xpos)&&(str2double(draw.y_coor)==ypos))
                    h = figure(c);
                    plot(freq,saved_data_results(c,:));
                    xlabel('frequency,Hz');
                    ampl=['amplitude,',unit_y];
                    ylabel(ampl);
                    str=strcat('Frequency-amplitude graph, coordinates : (',num2str(xpos),',',num2str(ypos),')');
                    title(str);
                    y_pos=num2str(ypos);
                    filename = sprintf('Figure(%d,%s).pdf', xpos,y_pos);
                    print( h, '-append', '-dpdf', filename );
                end
                if (down==0)
                    ypos=ypos+str2double(ystep);
                end
                if (down==1)
                    ypos=ypos-str2double(ystep);
                end
            end
            xpos=xpos+str2double(xstep);
        end
    case 3
        % OPTIONAL: print all graph figures to pdf
        c=0;
        down=0;
        xpos=0;
        ypos=0;
        for m = 1:x_for_size
            down=xor(down,1);
            for n = 1:y_for_size
                c=c+1;
                h = figure(c);
                plot(freq,saved_data_results(c,:));
                xlabel('frequency,Hz');
                ampl=['amplitude,',unit_y];
                ylabel(ampl);
                str=strcat('Frequency-amplitude graph, coordinates : (',num2str(xpos),',',num2str(ypos),')');
                title(str);
                y_pos=num2str(ypos);
                filename = sprintf('Figure(%d,%s).pdf', xpos,y_pos);
                print( h, '-append', '-dpdf', filename );
                if (down==0)
                    ypos=ypos+str2double(ystep);
                end
                if (down==1)
                    ypos=ypos-str2double(ystep);
                end
            end
            xpos=xpos+str2double(xstep);
        end
end

end

