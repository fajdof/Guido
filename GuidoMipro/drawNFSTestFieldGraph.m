function [ ] = drawNFSTestFieldGraph( )
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
x_step = xstep.xstep;
ystep = load(filename,'ystep');
y_step = ystep.ystep;
freq = load(filename,'freq');
freq = freq.freq;
unit_y = load(filename,'unit_y');
unit_y = unit_y.unit_y;
% Graph by frequency
switch draw.frequency_search_unit
    case 1
        search_frequency=draw.frequency_search;
        jedinica='Hz';
    case 2
        search_frequency=draw.frequency_search*1000;
        jedinica='kHz';
    case 3
        search_frequency=draw.frequency_search*1000000;
        jedinica='MHz';
    case 4
        search_frequency=draw.frequency_search*1000000000;
        jedinica='GHz';
    otherwise
        msgbox('Select frequency unit ','Error','error');
end
tmp = abs(freq-search_frequency);
[idx idx] = min(tmp);
c=0;
for m = 1:x_for_size
    for n = 1:y_for_size
        matrix(m,n)=0;
    end
end
down=0;
for m = 1:x_for_size
    down=xor(down,1);
    for n = 1:y_for_size
        c=c+1;
        amplix(c)=saved_data_results(c,idx);
        if down==1
            matrix(m,n)=abs(amplix(c));
        end
        if down==0
            matrix(m,(y_for_size+1)-n)=abs(amplix(c));
        end
    end
end
t_matrix = transpose(matrix);
h = figure;
imagesc(t_matrix);
filename = sprintf('Field_graph_at_%d%s.pdf', draw.frequency_search, jedinica);
titlename = sprintf('Field graph at %d%s, colorbar in %s', draw.frequency_search, jedinica, unit_y);
title(titlename);
xlabel('X, mm');
ylabel('Y, mm');
% Ako je velik graf, ne radi prilagodbu
if ((x_for_size-1)<25)||((y_for_size-1)<25)
    set(gca, 'XTick', 0:((x_for_size-1)*str2double(x_step{1})));
    set(gca, 'XTickLabel', -str2double(x_step{1}):str2double(x_step{1}):double(((x_for_size-1)*str2double(x_step{1}))));
    set(gca, 'YTick', 0:((y_for_size-1)*str2double(y_step{1})));
    set(gca, 'YTickLabel', -str2double(y_step{1}):str2double(y_step{1}):double(((y_for_size-1)*str2double(y_step{1})))); 
end
colorbar;
print( h, '-append', '-dpdf', filename);
end

