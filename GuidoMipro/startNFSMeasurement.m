function [ handles ] = startNFSMeasurement( handles )
global FSP;
global g_code;
global NFS;
d=size(g_code);
% send g_code(2)
% send g_code(3)
% stopaj vrijeme
tic;
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

%Measure first coordinate(0,0)
xp=num2str(xpos);
yp=num2str(ypos);
set(handles.current_x,'String',xp);
set(handles.current_y,'String',yp);
pause(1);
% fprintf(FSP, 'FORMAT ASCII');
% fprintf(FSP, 'TRAC1? TRACE1');
% rez=fscanf(FSP);
% a = [1, regexp(rez, ',')];
% for index = 1:length(a)-1
%     b(index) = str2double(rez(a(index):a(index+1)-1));
% end
% b(index+1) = str2double(rez(a(length(a)):length(rez)));
% for index = 1:length(b)
%     results(i,index)=b(index);
% end

% MEASURE
% Citaj od 4. retka nadalje po dva retka
for m = 4:2:(d(1)-1)
    % send g_code(m)
    % send g_code(m+1)
    k = strfind(g_code{m}, x_step_plus{1});
    if k==c
        % pošalji 3 naredbe - smjer, gornjih i donjih 8 bitova
        first = uint8(3);
        fwrite(NFS,first);
        %pause(1);
        second = uint8(bitsra(uint16(round(str2num(xstep{1})/0.015)),8));
        third = uint8(bitand(uint16(round(str2num(xstep{1})/0.015)),uint16(255)));
        %pause(1);
        fwrite(NFS,second);
        %pause(1);
        fwrite(NFS,third);
        
        xpos=xpos+str2double(xstep{1});
    end
    k = strfind(g_code{m}, x_step_minus{1});
    if k==c
        first = uint8(2);
        fwrite(NFS,first);
        %pause(1);
        second = uint8(bitsra(uint16(round(str2num(xstep{1})/0.015)),8));
        third = uint8(bitand(uint16(round(str2num(xstep{1})/0.015)),uint16(255)));
        %pause(1);
        fwrite(NFS,second);
        %pause(1);
        fwrite(NFS,third);
        
        xpos=xpos-str2double(xstep{1});
    end
    k = strfind(g_code{m}, y_step_plus{1});
    if k==v
        first = uint8(4);
        %pause(1);
        fwrite(NFS,first);
        second = uint8(bitsra(uint16(round(str2num(ystep{1})/0.015)),8));
        third = uint8(bitand(uint16(round(str2num(ystep{1})/0.015)),uint16(255)));
        %pause(1);
        fwrite(NFS,second);
        %pause(1);
        fwrite(NFS,third);
        
        ypos=ypos+str2double(ystep{1});
    end
    k = strfind(g_code{m}, y_step_minus{1});
    if k==v
        first = uint8(5);
        fwrite(NFS,first);
        %pause(1);
        second = uint8(bitsra(uint16(round(str2num(ystep{1})/0.015)),8));
        third = uint8(bitand(uint16(round(str2num(ystep{1})/0.015)),uint16(255)));
        %pause(1);
        fwrite(NFS,second);
        %pause(1);
        fwrite(NFS,third);
        
        ypos=ypos-str2double(ystep{1});
    end
    
%     if abs(xpos)>xmax
%         xmax=abs(xpos);
%     end
%     if abs(ypos)>ymax
%         ymax=abs(ypos);
%     end
    xp=num2str(xpos);
    yp=num2str(ypos);
    set(handles.current_x,'String',xp);
    set(handles.current_y,'String',yp);
    
    % TESTIRANJE ----
    pause(0.5);
%     fprintf(FSP, 'FORMAT ASCII');
%     fprintf(FSP, 'TRAC1? TRACE1');
%     rez=fscanf(FSP);
%     a = [1, regexp(rez, ',')];
%     for index = 1:length(a)-1
%         b(index) = str2double(rez(a(index):a(index+1)-1));
%     end
%     b(index+1) = str2double(rez(a(length(a)):length(rez)));
%     for index = 1:length(b)
%         results(i,index)=b(index);
%     end
end
end

