function [ ] = signalGenNFSTest( )
global FSP;
global FSP2;
global settings;
global g_code;
d=size(g_code);
% send g_code(2)
% send g_code(3)
% stopaj vrijeme
tic;
% TESTIRANJE -------
    fprintf(FSP, 'DISP:WIND:TRAC:Y:RLEV 15dBm');
    fprintf(FSP, 'frequency:start?');
    startf=fscanf(FSP);
    fprintf(FSP, 'frequency:stop?');
    stopf=fscanf(FSP);
    width=int32(str2num(stopf))-int32(str2num(startf));
    f = str2num(startf) + width/2;
    f = f/1000000;
    ff=[num2str(f), 'MHz'];
    to_send=['FREQ ', ff];
    fprintf(FSP2, to_send);
    
% TESTIRANJE -------
% inicijaliziraj vrijednosti
i=1;
xpos=0;
ypos=0;
c=5;
v=8;

% Find X-step and Y-step, X-length and Y-length in first row of G-code
expression='[0-9]+\.?[0-9]*';
getregex=regexp(g_code{1},expression,'match');
xstep=getregex(1);
ystep=getregex(2);
xlength=getregex(3);
ylength=getregex(4);
x_step_minus = strcat('X-', xstep);
x_step_plus = strcat('X', xstep);
y_step_minus = strcat('Y-', ystep);
y_step_plus = strcat('Y', ystep);

% generirati meshgrid XO YO
prvi = (0:str2double(xstep):str2double(xlength));
drugi = (0:str2double(ystep):str2double(ylength));
[XO,YO] = meshgrid(prvi, drugi);
XO_pi2 = XO./(pi/2);
YO_pi2 = YO./(pi/2);
XYfound=0;

% TESTIRANJE ----
    % naci indekse od xp i yp u meshgrid polju
    % level(indeksa) = (sinc(sqrt((X(ind)/pi).^2+(Y(ind)/pi).^2)))*10;
    X = xpos/(pi/2);
    Y = -ypos/(pi/2);  
    Xfind = find(XO_pi2 == X);
    Yfind = find(YO_pi2 == Y);
    for l = 1:numel(Xfind)
        for u = 1:numel(Yfind)
            if (Xfind(l) == Yfind(u))
               XYfound = Xfind(l);
            end
        end
    end
    Xfound = mod(XYfound, ((str2double(ylength)/str2double(ystep))+1));
    if (Xfound == 0)
        Xfound=((str2double(ylength)/str2double(ystep))+1);
    end
    Yfound = ceil(XYfound/((str2double(ylength)/str2double(ystep))+1));
    level(Xfound, Yfound) = (sinc(sqrt((X/pi).^2+(Y/pi).^2)))*10;
    if (abs(level)<29)
        ll=[num2str(level(Xfound, Yfound)), 'dBm'];
        to_send=['POW ', ll];
        fprintf(FSP2, to_send);
        fprintf(FSP2, 'OUTP ON');
    end
        
% TESTIRANJE ----

%Measure first coordinate(0,0)
xp=num2str(xpos);
yp=num2str(ypos);
set(handles.current_x,'String',xp);
set(handles.current_y,'String',yp);
pause(1);
fprintf(FSP, 'FORMAT ASCII');
fprintf(FSP, 'TRAC1? TRACE1');
rez=fscanf(FSP);
a = [1, regexp(rez, ',')];
for index = 1:length(a)-1
    b(index) = str2double(rez(a(index):a(index+1)-1));
end
b(index+1) = str2double(rez(a(length(a)):length(rez)));
for index = 1:length(b)
    results(i,index)=b(index);
end

% GRAF OD MAXIMUMA

    maximum(Xfound, Yfound) = max(results(i,:));

% GRAF OD MAXIMUMA

i=i+1;
xmax=0;
ymax=0;

% MEASURE
% Citaj od 4. retka nadalje po dva retka
for m = 4:2:(d(1)-1)
    % send g_code(m)
    % send g_code(m+1)
    
    k = strfind(g_code{m}, x_step_plus{1});
    if k==c
        xpos=xpos+str2double(xstep);
    end
    k = strfind(g_code{m}, x_step_minus{1});
    if k==c
        xpos=xpos-str2double(xstep);
    end
    k = strfind(g_code{m}, y_step_plus{1});
    if k==v
        ypos=ypos+str2double(ystep);
    end
    k = strfind(g_code{m}, y_step_minus{1});
    if k==v
        ypos=ypos-str2double(ystep);
    end
    if abs(xpos)>xmax
        xmax=abs(xpos);
    end
    if abs(ypos)>ymax
        ymax=abs(ypos);
    end
    xp=num2str(xpos);
    yp=num2str(ypos);
    set(handles.current_x,'String',xp);
    set(handles.current_y,'String',yp);
    
    % TESTIRANJE ----
    % naci indekse od xp i yp u meshgrid polju
    % level(indeksa) = (sinc(sqrt((X(ind)/pi).^2+(Y(ind)/pi).^2)))*10;
    X = xpos/(pi/2);
    Y = -ypos/(pi/2);  
    Xfind = find(XO_pi2 == X);
    Yfind = find(YO_pi2 == Y);
    for l = 1:numel(Xfind)
        for u = 1:numel(Yfind)
            if (Xfind(l) == Yfind(u))
                XYfound = Xfind(l);
            end
        end
    end
    Xfound = mod(XYfound, ((str2double(ylength)/str2double(ystep))+1));
    if (Xfound == 0)
        Xfound=((str2double(ylength)/str2double(ystep))+1);
    end
    Yfound = ceil(XYfound/((str2double(ylength)/str2double(ystep))+1));
    level(Xfound, Yfound) = (sinc(sqrt((X/pi).^2+(Y/pi).^2)))*10;
    if (abs(level)<29)
       ll=[num2str(level(Xfound, Yfound)), 'dBm'];
       to_send=['POW ', ll];
       fprintf(FSP2, to_send);
    end
        
    % TESTIRANJE ----
    pause(1);
    fprintf(FSP, 'FORMAT ASCII');
    fprintf(FSP, 'TRAC1? TRACE1');
    rez=fscanf(FSP);
    a = [1, regexp(rez, ',')];
    for index = 1:length(a)-1
        b(index) = str2double(rez(a(index):a(index+1)-1));
    end
    b(index+1) = str2double(rez(a(length(a)):length(rez)));
    for index = 1:length(b)
        results(i,index)=b(index);
    end
    
    % GRAF OD MAXIMUMA

        maximum(Xfound, Yfound) = max(results(i,:));

    %GRAF OD MAXIMUMA

    i=i+1;
end
% send g_code(d(1))
% save steps
filename = uiputfile;
save(filename,'xstep');
save(filename,'ystep','-append');
% get sweep points
switch settings.sa.sweep_points
    case 1
        sweep_p=125;
    case 2
        sweep_p=251;
    case 3
        sweep_p=501;
    case 4
        sweep_p=1001;
    case 5
        sweep_p=2001;
    case 6
        sweep_p=4001;
    case 7
        sweep_p=8001;
    otherwise
         msgbox('Select number of sweep points ','Error','error'); 
end
% get for loop lengths
x_length=str2double(xlength)/str2double(xstep);
x_for_size=uint32(x_length)+1;
y_length=str2double(ylength)/str2double(ystep);
y_for_size=uint32(y_length)+1;
save(filename,'x_for_size','-append');
save(filename,'y_for_size','-append');
% create frequency array
fprintf(FSP, 'frequency:start?');
startf=fscanf(FSP);
fprintf(FSP, 'frequency:stop?');
stopf=fscanf(FSP);
width=int32(str2num(stopf))-int32(str2num(startf));
points=width/sweep_p;
freq=int32(str2num(startf)):points:int32(str2num(stopf));
if (sweep_p<2001)
    freq(sweep_p+1)=[];
end
save(filename,'freq','-append');
fprintf(FSP,'UNIT:POW?');
unit_y=fscanf(FSP);
save(filename,'unit_y','-append');
% save results
save(filename,'results','-append');
%TEST
    
    % graf poslanih podataka
    hf = figure(1);    
    surf(XO,YO,level);
    str=strcat('Frequency field graph, frequency : ', ff);
    title(str);
    xlabel('X, mm');
    ylabel('Y, mm');
    zlabel('Amplitude, dBm');
    filename = strcat('FFGraph_', ff,'.pdf');
    print( hf, '-dpdf', filename );
    
    % graf izmjerenih podataka
    hf = figure(2);
    fprintf(FSP, 'UNIT:POW?');
    unit_y_scale=fscanf(FSP);
    unit_y_scale=strcat(unit_y_scale,'');
    switch unit_y_scale
        case 'DBMV'
            maximum=maximum-46.9897;
        case 'DBUV'
            maximum=maximum-106.98;
        case 'DBUA'
            maximum=maximum-73.01;
        case 'DBPW'
            maximum=maximum-90;
        case 'V'
            maximum=(maximum.^2)/50;
            maximum=10*log10(maximum)+30;
        case 'A'
            maximum=(maximum.^2)*50;
            maximum=10*log10(maximum)+30;
        case 'W' 
            maximum=10*log10(maximum)+30;
    end
    surf(XO,YO,maximum);
    str=strcat('Frequency field graph(measured), frequency : ', ff );
    title(str);
    xlabel('X, mm');
    ylabel('Y, mm');
    zlabel('Amplitude, dBm');
    filename = strcat('FFGraph_measured_', ff, '.pdf');
    print( hf, '-dpdf', filename );
    
    % graf pogreske
    hf = figure(3);
    error = maximum - level;
    surf(XO,YO,error);
    str=strcat('Frequency field graph(error), frequency : ', ff );
    title(str);
    xlabel('X, mm');
    ylabel('Y, mm');
    zlabel('Amplitude, dBm');
    filename = strcat('FFGraph_error_', ff, '.pdf');
    print( hf, '-dpdf', filename );
    
    % spremi rezultate u file
    filename = uiputfile;
    save(filename, 'level');
    save(filename, 'maximum', '-append');
    save(filename, 'error', '-append');
    elapsed_time = toc;
    save(filename, 'elapsed_time', '-append');
    
%TEST
end

