function varargout = Guido(varargin)
% VERS1 MATLAB code for vers1.fig
%      VERS1, by itself, creates a new VERS1 or raises the existing
%      singleton*.
%
%      H = VERS1 returns the handle to a new VERS1 or the handle to
%      the existing singleton*.
%
%      VERS1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VERS1.M with the given input arguments.
%
%      VERS1('Property','Value',...) creates a new VERS1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vers1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vers1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vers1

% Last Modified by GUIDE v2.5 21-May-2015 13:50:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vers1_OpeningFcn, ...
                   'gui_OutputFcn',  @vers1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before vers1 is made visible.
function vers1_OpeningFcn(hObject, eventdata, handles, varargin)
global FSP;
global settings;
global g_positions;
global connections;
global settings_rf;
global draw;
global calibrations;
global pmeters;
global dpi_values;
global fmulti;
global ag_oscilloscope;
% FLUKE adress 23!
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guido (see VARARGIN)

% Choose default command line output for vers1
handles.output = hObject;
% disable buttons
set(handles.center_freq_num,'Enable','off');
set(handles.span_freq_num,'Enable','off');
set(handles.center_freq_unit,'Enable','off');
set(handles.center_freq_set,'Enable','off');
set(handles.start_freq_num,'Enable','off');
set(handles.stop_freq_num,'Enable','off');
set(handles.start_freq_unit,'Enable','off');
set(handles.start_freq_set,'Enable','off');
set(handles.start_stop_frequency,'Enable','off');
set(handles.center_span_frequency,'Enable','off');
set(handles.ref_level,'Enable','off');
set(handles.ref_level_unit,'Enable','off');
set(handles.sweep_time,'Enable','off');
set(handles.sweep_points,'Enable','off');
set(handles.sweep_unit,'Enable','off');
set(handles.rbw_unit,'Enable','off');
set(handles.vbw_unit,'Enable','off');
set(handles.unit_y_scale,'Enable','off');
set(handles.cont_sweep,'Enable','off');
set(handles.single_sweep,'Enable','off');
set(handles.peak_button,'Enable','off');
set(handles.disconnect_sa,'Enable','off');
set(handles.execute_settings,'Enable','off');
set(handles.connect_sa,'Enable','on');
set(handles.getdata_button,'Enable','off');
set(handles.connect_rfdc,'Enable','on');
set(handles.level_rfdc,'Enable','off');
set(handles.level_unit_rfdc,'Enable','off');
set(handles.freq_rfdc,'Enable','off');
set(handles.frequency_unit_rfdc,'Enable','off');
set(handles.Execute_rfdc_settings,'Enable','off');
set(handles.disconnect_rfdc,'Enable','off');
set(handles.get_fluke_v,'Enable','off');
set(handles.connect_fluke,'Enable','on');
set(handles.disconnect_fluke,'Enable','off');
set(handles.disconnect_oscilloscope,'Enable','off');
set(handles.get_button_forward,'Enable','off');
set(handles.get_button_reflected,'Enable','off');
% Set opening panel
set(handles.sa_panel,'Visible','on');
set(handles.rfdc,'Visible','off');
set(handles.uipanel12,'Visible','off');
set(handles.uipanel14,'Visible','off');
set(handles.uipanel15,'Visible','off');
set(handles.power_meters,'Visible','off');
set(handles.emc_test,'Visible','off');
set(handles.fluke_multimeter,'Visible','off');
set(handles.oscilloscope,'Visible','off');
% Set default values
connections.sa_connected=0;
connections.rfdc_connected=0;
connections.pm_forward=0;
connections.pm_reflected=0;
connections.fluke_connected=0;
connections.osc_connected=0;
set(handles.visa_address,'String','USB0::0x0957::0x173D::MY50340261::0::INSTR');
ag_oscilloscope.visa_address = 'USB0::0x0957::0x173D::MY50340261::0::INSTR';
set(handles.gpib_fluke,'String','23');
fmulti.gpib_fluke='23';
set(handles.fluke_voltage,'String','?');
fmulti.fluke_voltage='?';
set(handles.set_fspace,'Value',2);
dpi_values.fspace=2;
set(handles.set_fmin,'String','10');
dpi_values.fmin='10';
set(handles.set_fmax,'String','1000');
dpi_values.fmax='1000';
set(handles.set_fstep,'String','20');
dpi_values.nstep='20';
set(handles.dpi_funit,'Value',3);
dpi_values.dpi_funit=3;
set(handles.set_pmin,'String','-30');
dpi_values.pmin='-30';
set(handles.set_pmax,'String','0');
dpi_values.pmax='0';
set(handles.set_pstep,'String','3');
dpi_values.pstep='3';
set(handles.dpi_low,'String','4.9');
dpi_values.dpi_low='4.9';
set(handles.dpi_high,'String','5.1');
dpi_values.dpi_high='5.1';
set(handles.get_forward_power,'String','?');
pmeters.forward_power='?';
set(handles.get_reflected_power,'String','?');
pmeters.reflected_power='?';
set(handles.com_forward,'String','COM4');
pmeters.com_forward='COM4';
set(handles.com_reflected,'String','COM3');
pmeters.com_reflected='COM3';
set(handles.baud_forward,'String','115200');
pmeters.baud_forward='115200';
set(handles.baud_reflected,'String','115200');
pmeters.baud_reflected='115200';
set(handles.filter_forward,'Value',8);
pmeters.filter_forward=8;
set(handles.filter_reflected,'Value',8);
pmeters.filter_reflected=8;
set(handles.x_position,'String','5');
g_positions.x_position='5';
set(handles.y_position,'String','5');
g_positions.y_position='5';
set(handles.x_step,'String','1');
g_positions.x_step='1';
set(handles.y_step,'String','1');
g_positions.y_step='1';
set(handles.z_position,'String','1');
set(handles.level_rfdc,'String','15');
settings_rf.rfdc.level_value='15';
set(handles.level_unit_rfdc,'Value',1);
settings_rf.rfdc.level_unit=1;
set(handles.freq_rfdc,'String','5');
settings_rf.rfdc.freq_value='5';
set(handles.frequency_unit_rfdc,'Value',3);
settings_rf.rfdc.freq_unit=3;
draw.frequency_search=5;
set(handles.set_frequency,'String','5');
draw.frequency_search_unit=3;
set(handles.popup_set_frequency,'Value',3);
draw.x_coor='0';
draw.y_coor='0';
set(handles.graph_pop,'Value',2);
draw.graph_print=2;
set(handles.ref_point_coor,'String','0,0');
calibrations.x=0;
calibrations.y=0;
set(handles.center_span_frequency,'Value',1);
set(handles.start_stop_frequency,'Value',0);
settings.sa.cs_button=1;
set(handles.center_freq_num, 'String', '5');
settings.sa.freq_center='5';
set(handles.span_freq_num,'String','2');
settings.sa.freq_span='2';
set(handles.center_freq_unit,'Value',3);
settings.sa.freq_cs_unit=3;
set(handles.ref_level,'String','15');
settings.sa.ref_level='15';
set(handles.ref_level_unit,'Value',1);
settings.sa.ref_level_unit=1;
set(handles.sweep_time,'String','300');
settings.sa.sweep_time_num='300';
set(handles.sweep_points,'Value',2);
settings.sa.sweep_points=2;
set(handles.sweep_unit,'Value',1);
settings.sa.sweep_time_unit=1;
set(handles.rbw_unit,'Value',9);
settings.sa.rbw=9;
set(handles.vbw_unit,'Value',12);
settings.sa.vbw=12;
set(handles.unit_y_scale,'Value',1);
settings.sa.y_scale=1;
set(handles.peak_button,'Value',1);
settings.sa.peak=1;
settings.rfdc_gpib=28;
settings.sa_gpib=18;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vers1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = vers1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --------------------------------------------------------------------
function G_code_Callback(hObject, eventdata, handles)
global g_positions;
global settings;
global FSP;
% hObject    handle to G_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ime_datoteke=uiputfile;
% napravi datoteku za g-kod
g_dat=fopen(ime_datoteke,'w');
x_length=str2double(g_positions.x_position)/str2double(g_positions.x_step);
x_len=uint32(x_length)+1;
y_length=str2double(g_positions.y_position)/str2double(g_positions.y_step);
y_len=uint32(y_length)+1;
% zapisi korake i duljinu u datoteku
fprintf(g_dat, '%s', '%Generated g-code, x_step ',g_positions.x_step,' mm, y_step ',g_positions.y_step,' mm, x_length ',g_positions.x_position,' mm, y_length ',g_positions.y_position,' mm');
fprintf(g_dat,'\n');
fprintf(g_dat, '%s\n', 'G21');
fprintf(g_dat, '%s\n', 'G91');
down=0;
% generiraj g-kod
for m = 1:x_len
    down=xor(down,1);
    for n = 1:y_len
       if (n~=y_len)&&(down==1)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X0 ');
           fprintf(g_dat, '%s', 'Y-',g_positions.y_step,' ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n~=y_len)&&(down==0)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X0 ');
           fprintf(g_dat, '%s', 'Y',g_positions.y_step,' ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n==y_len)&&(down==1)&&(m~=x_len)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X',g_positions.x_step,' ');
           fprintf(g_dat, '%s', 'Y0 ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
       if (n==y_len)&&(down==0)&&(m~=x_len)
           fprintf(g_dat, '%s', 'G00 ');
           fprintf(g_dat, '%s', 'X',g_positions.x_step,' ');
           fprintf(g_dat, '%s', 'Y0 ');
           fprintf(g_dat, '%s\n', 'Z0');
           fprintf(g_dat, '%s\n', 'M50');
       end
    end
end
fprintf(g_dat, '%s', 'M00');
save('g_dat');
guidata(hObject, handles);



% --------------------------------------------------------------------
function spec_Callback(hObject, eventdata, handles)
% hObject    handle to spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.sa_panel,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','on');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end

% --------------------------------------------------------------------
function dcrf_Callback(hObject, eventdata, handles)
% hObject    handle to dcrf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.rfdc,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','on');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end


% --------------------------------------------------------------------
function define_dut_Callback(hObject, eventdata, handles)
% hObject    handle to define_dut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.uipanel12,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','on');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end

% --------------------------------------------------------------------
function ord_Callback(hObject, eventdata, handles)
% hObject    handle to ord (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.uipanel14,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','on');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end


% --------------------------------------------------------------------
function read_spec_Callback(hObject, eventdata, handles)
% hObject    handle to read_spec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.uipanel15,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','on');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end


% --------------------------------------------------------------------
function spek_an_Callback(hObject, eventdata, handles)
% hObject    handle to spek_an (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.uipanel15,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','on');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end


% --------------------------------------------------------------------
function pow_met_Callback(hObject, eventdata, handles)
% hObject    handle to pow_met (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.power_meters,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','on');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end

% --------------------------------------------------------------------
function emc_start_Callback(hObject, eventdata, handles)
% hObject    handle to emc_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.emc_test,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','on');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
end

% --------------------------------------------------------------------
function fluke_multi_Callback(hObject, eventdata, handles)
% hObject    handle to fluke_multi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.fluke_multimeter,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','on');
    set(handles.oscilloscope,'Visible','off');
end

% --------------------------------------------------------------------
function oscil_agilent_Callback(hObject, eventdata, handles)
% hObject    handle to oscil_agilent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.oscilloscope,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','on');
end

% --- Executes on button press in getdata_button.
function getdata_button_Callback(hObject, eventdata, handles)
global FSP;
global FSP2;
global settings;
global g_code;
% hObject    handle to getdata_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
guidata(hObject, handles);


function z_position_Callback(hObject, eventdata, handles)
global settings;
global g_positions;
global FSP;
% hObject    handle to z_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_position as text
%        str2double(get(hObject,'String')) returns contents of z_position as a double
z_pos = get(handles.z_position,'String');
g_positions.z_position = z_pos;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function z_position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_step_Callback(hObject, eventdata, handles)
global settings;
global g_positions;
global FSP;
% hObject    handle to x_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_step as text
%        str2double(get(hObject,'String')) returns contents of x_step as a double
x_pos_step = get(handles.x_step,'String');
g_positions.x_step = x_pos_step;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function x_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_step_Callback(hObject, eventdata, handles)
global settings;
global g_positions;
global FSP;
% hObject    handle to y_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_step as text
%        str2double(get(hObject,'String')) returns contents of y_step as a double
y_pos_step = get(handles.y_step,'String');
g_positions.y_step = y_pos_step;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function y_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_position_Callback(hObject, eventdata, handles)
global settings;
global g_positions;
global FSP;
% hObject    handle to x_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_position as text
%        str2double(get(hObject,'String')) returns contents of x_position as a double
x_pos = get(handles.x_position,'String');
g_positions.x_position = x_pos;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function x_position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_position_Callback(hObject, eventdata, handles)
global settings;
global g_positions;
global FSP;
% hObject    handle to y_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_position as text
%        str2double(get(hObject,'String')) returns contents of y_position as a double
y_pos = get(handles.y_position,'String');
g_positions.y_position = y_pos;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function y_position_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_position (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in start_stop_frequency.
function start_stop_frequency_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to start_stop_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of start_stop_frequency
ss_button_value=get(handles.start_stop_frequency,'Value');

if ss_button_value == 1
    settings.sa.ss_button = 1;
    settings.sa.cs_button = 0;
    set(handles.start_freq_num,'Enable','on');
    set(handles.stop_freq_num,'Enable','on');
    set(handles.start_freq_unit,'Enable','on');
    set(handles.start_freq_set,'Enable','on');
    set(handles.center_freq_num,'Enable','off');
    set(handles.span_freq_num,'Enable','off');
    set(handles.center_freq_unit,'Enable','off');
    set(handles.center_freq_set,'Enable','off');
    set(handles.center_span_frequency,'Value',0);
elseif ss_button_value == 0
    settings.sa.ss_button = 0;
    settings.sa.cs_button = 1;
    set(handles.start_freq_num,'Enable','off');
    set(handles.stop_freq_num,'Enable','off');
    set(handles.start_freq_unit,'Enable','off');
    set(handles.start_freq_set,'Enable','off');
end


% --- Executes on button press in center_span_frequency.
function center_span_frequency_Callback(hObject, eventdata, handles)
global settings;
% hObject    handle to center_span_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of center_span_frequency
cs_button_value=get(handles.center_span_frequency,'Value');
if cs_button_value == 1
    settings.sa.cs_button = 1;
    settings.sa.ss_button = 0;
    set(handles.center_freq_num,'Enable','on');
    set(handles.span_freq_num,'Enable','on');
    set(handles.center_freq_unit,'Enable','on');
    set(handles.center_freq_set,'Enable','on');
    set(handles.start_freq_num,'Enable','off');
    set(handles.stop_freq_num,'Enable','off');
    set(handles.start_freq_unit,'Enable','off');
    set(handles.start_freq_set,'Enable','off');
    set(handles.start_stop_frequency,'Value',0);
elseif cs_button_value == 0
    settings.sa.cs_button = 0;
    settings.sa.ss_button = 1;
    set(handles.center_freq_num,'Enable','off');
    set(handles.span_freq_num,'Enable','off');
    set(handles.center_freq_unit,'Enable','off');
    set(handles.center_freq_set,'Enable','off');
end


function center_freq_num_Callback(hObject, eventdata, handles)
% hObject    handle to center_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of center_freq_num as text
%        str2double(get(hObject,'String')) returns contents of center_freq_num as a double

% --- Executes during object creation, after setting all properties.
function center_freq_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to center_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function span_freq_num_Callback(hObject, eventdata, handles)
% hObject    handle to span_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of span_freq_num as text
%        str2double(get(hObject,'String')) returns contents of span_freq_num as a double


% --- Executes during object creation, after setting all properties.
function span_freq_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to span_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function start_freq_num_Callback(hObject, eventdata, handles)
% hObject    handle to start_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of start_freq_num as text
%        str2double(get(hObject,'String')) returns contents of start_freq_num as a double


% --- Executes during object creation, after setting all properties.
function start_freq_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function stop_freq_num_Callback(hObject, eventdata, handles)
% hObject    handle to stop_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of stop_freq_num as text
%        str2double(get(hObject,'String')) returns contents of stop_freq_num as a double


% --- Executes during object creation, after setting all properties.
function stop_freq_num_CreateFcn(hObject, eventdata, handles)
% hObject    handle to stop_freq_num (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on selection change in peak_button.
function peak_button_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to peak_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns peak_button contents as cell array
%        contents{get(hObject,'Value')} returns selected item from peak_button
val = get(hObject,'Value');
settings.sa.peak=val;
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function peak_button_CreateFcn(hObject, eventdata, handles)
% hObject    handle to peak_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in center_freq_unit.
function center_freq_unit_Callback(hObject, eventdata, handles)
% hObject    handle to center_freq_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns center_freq_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from center_freq_unit

% --- Executes during object creation, after setting all properties.
function center_freq_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to center_freq_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in start_freq_unit.
function start_freq_unit_Callback(hObject, eventdata, handles)
% hObject    handle to start_freq_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns start_freq_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from start_freq_unit


% --- Executes during object creation, after setting all properties.
function start_freq_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to start_freq_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in rbw_unit.
function rbw_unit_Callback(hObject, eventdata, handles)
global FSP;
global settings;
global counter;
% hObject    handle to rbw_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns rbw_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from rbw_unit
rbw = get(handles.rbw_unit,'Value');
settings.sa.rbw = rbw;
counter=counter+1;
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function rbw_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rbw_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in vbw_unit.
function vbw_unit_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to vbw_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns vbw_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from vbw_unit
vbw = get(handles.vbw_unit,'Value');
settings.sa.vbw = vbw;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function vbw_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vbw_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in unit_y_scale.
function unit_y_scale_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to unit_y_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns unit_y_scale contents as cell array
%        contents{get(hObject,'Value')} returns selected item from unit_y_scale
unit_unit = get(handles.unit_y_scale,'Value');
settings.sa.y_scale = unit_unit;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function unit_y_scale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to unit_y_scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sweep_points.
function sweep_points_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to sweep_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sweep_points contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sweep_points
sweep_point = get(handles.sweep_points,'Value');
settings.sa.sweep_points = sweep_point;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sweep_points_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweep_points (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sweep_time_Callback(hObject, eventdata, handles)
% hObject    handle to sweep_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sweep_time as text
%        str2double(get(hObject,'String')) returns contents of sweep_time as a double


% --- Executes during object creation, after setting all properties.
function sweep_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweep_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in sweep_unit.
function sweep_unit_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to sweep_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns sweep_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from sweep_unit
swepp_time_number = get(handles.sweep_time,'String');
swepp_time_unit = get(handles.sweep_unit,'Value');
settings.sa.sweep_time_num = swepp_time_number;
settings.sa.sweep_time_unit = swepp_time_unit;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sweep_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sweep_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in start_freq_set.
function start_freq_set_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to start_freq_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
freq_num = get(handles.start_freq_num,'String');
freq_unit = get(handles.start_freq_unit,'Value');
freq_num1 = get(handles.stop_freq_num,'String');
settings.sa.freq_start = freq_num;
settings.sa.freq_stop = freq_num1;
settings.sa.freq_ss_unit = freq_unit;
guidata(hObject, handles);


% --- Executes on button press in center_freq_set.
function center_freq_set_Callback(hObject, eventdata, handles)
global FSP;
global settings;
% hObject    handle to center_freq_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
freq_num = get(handles.center_freq_num,'String');
freq_unit = get(handles.center_freq_unit,'Value');
freq_num1 = get(handles.span_freq_num,'String');
settings.sa.freq_center = freq_num;
settings.sa.freq_span = freq_num1;
settings.sa.freq_cs_unit = freq_unit;
guidata(hObject, handles);


% --- Executes on button press in cont_sweep.
function cont_sweep_Callback(hObject, eventdata, handles)
global FSP;
% hObject    handle to cont_sweep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf(FSP, 'INIT:CONT?');
on_off=fscanf(FSP);
on_off_string=cellstr(on_off);
on_off_num=str2num(on_off_string{1});
if on_off_num == 1
    fprintf(FSP, 'INIT:CONT OFF');
    set(handles.contsweep_text,'String','ContSweep: off');
    guidata(hObject, handles);
else
    fprintf(FSP, 'INIT:CONT ON');
    set(handles.contsweep_text,'String','ContSweep: on');
end
guidata(hObject, handles);


% --- Executes on button press in single_sweep.
function single_sweep_Callback(hObject, eventdata, handles)
global FSP;
% hObject    handle to single_sweep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf(FSP, 'INIT:IMM;*WAI');
guidata(hObject, handles);


% --- Executes on button press in connect_sa.
function connect_sa_Callback(hObject, eventdata, handles)
global FSP;
global settings;
global connections;
% hObject    handle to connect_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FSP = gpib('ni',0,settings.sa_gpib);    
FSP.InputBufferSize = 1044480;

guidata(hObject, handles);

if strcmp('open', FSP.status)  
    msgbox('Spectrum analyzer is connected ','Error','error');     
else
     fopen(FSP);
     if strcmp('closed', FSP.status)
         delete(FSP);
         clear FSP;
     end
     %Reset instrument
     fprintf(FSP, '*RST');
     %Reset status registers
     fprintf(FSP, '*CLS');
     set(handles.connection_status,'String','SA Connection: on');
     connections.sa_connected=1;
     set(handles.center_freq_num,'Enable','on');
    set(handles.span_freq_num,'Enable','on');
    set(handles.center_freq_unit,'Enable','on');
    set(handles.center_freq_set,'Enable','on');
    set(handles.start_stop_frequency,'Enable','on');
    set(handles.center_span_frequency,'Enable','on');
    set(handles.ref_level,'Enable','on');
    set(handles.ref_level_unit,'Enable','on');
    set(handles.sweep_time,'Enable','on');
    set(handles.sweep_points,'Enable','on');
    set(handles.sweep_unit,'Enable','on');
    set(handles.rbw_unit,'Enable','on');
    set(handles.vbw_unit,'Enable','on');
    set(handles.unit_y_scale,'Enable','on');
    set(handles.cont_sweep,'Enable','on');
    set(handles.single_sweep,'Enable','on');
    set(handles.peak_button,'Enable','on');
    set(handles.disconnect_sa,'Enable','on');
    set(handles.execute_settings, 'Enable', 'on');
end



guidata(hObject, handles);


% --- Executes on button press in disconnect_sa.
function disconnect_sa_Callback(hObject, eventdata, handles)
global FSP;
global settings;
global connections;
% hObject    handle to disconnect_sa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', FSP.status)  
    msgbox('Spectrum analyzer is disconnected ','Error','error');     
else
     fclose(FSP);
     set(handles.connection_status,'String','SA Connection: off');
end
guidata(hObject, handles);
if strcmp('open', FSP.status)  
    msgbox('Disconnect before deleting the SA object ','Error','error'); 
else
    % Odspoji SA
    delete(FSP);
    clear FSP;
    connections.sa_connected=0;
end


% --------------------------------------------------------------------
function save_to_file_Callback(hObject, eventdata, handles)
global settings;
global FSP;
% hObject    handle to save_to_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uiputfile;
save(filename,'settings');


% --------------------------------------------------------------------
function load_settings_Callback(hObject, eventdata, handles)
global settings;
global FSP;
% hObject    handle to load_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uigetfile;
settings = load(filename);
settings = settings.settings;
% Postavi sve vrijednosti koje su ucitane
set(handles.center_freq_num,'String',settings.sa.freq_center);
set(handles.span_freq_num,'String',settings.sa.freq_span);
set(handles.center_freq_unit,'Value',settings.sa.freq_cs_unit);
set(handles.start_freq_num,'String',settings.sa.freq_start);
set(handles.stop_freq_num,'String',settings.sa.freq_stop);
set(handles.start_freq_unit,'Value',settings.sa.freq_ss_unit);
set(handles.peak_button,'Value',settings.sa.peak);
set(handles.unit_y_scale,'Value',settings.sa.y_scale);
set(handles.vbw_unit,'Value',settings.sa.vbw);
set(handles.sweep_points,'Value',settings.sa.sweep_points);
set(handles.sweep_time,'String',settings.sa.sweep_time_num);
set(handles.rbw_unit,'Value',settings.sa.rbw);
set(handles.enter_gpib_adress,'String',settings.gpib);
set(handles.sweep_unit,'Value',settings.sa.sweep_time_unit);
set(handles.start_stop_frequency,'Value',settings.sa.ss_button);
set(handles.center_span_frequency,'Value',settings.sa.cs_button);
set(handles.ref_level_unit,'Value',settings.sa.ref_level_unit);
set(handles.ref_level,'String',settings.sa.ref_level);
set(handles.execute_settings,'Enable','on');

ss_button_value=get(handles.start_stop_frequency,'Value');
if ss_button_value == 1
    settings.sa.ss_button = 1;
    settings.sa.cs_button = 0;
    set(handles.start_freq_num,'Enable','on');
    set(handles.stop_freq_num,'Enable','on');
    set(handles.start_freq_unit,'Enable','on');
    set(handles.start_freq_set,'Enable','on');
    set(handles.center_freq_num,'Enable','off');
    set(handles.span_freq_num,'Enable','off');
    set(handles.center_freq_unit,'Enable','off');
    set(handles.center_freq_set,'Enable','off');
    set(handles.center_span_frequency,'Value',0);
elseif ss_button_value == 0
    settings.sa.ss_button = 0;
    settings.sa.cs_button = 1;
    set(handles.start_freq_num,'Enable','off');
    set(handles.stop_freq_num,'Enable','off');
    set(handles.start_freq_unit,'Enable','off');
    set(handles.start_freq_set,'Enable','off');
end

cs_button_value=get(handles.center_span_frequency,'Value');
if cs_button_value == 1
    settings.sa.cs_button = 1;
    settings.sa.ss_button = 0;
    set(handles.center_freq_num,'Enable','on');
    set(handles.span_freq_num,'Enable','on');
    set(handles.center_freq_unit,'Enable','on');
    set(handles.center_freq_set,'Enable','on');
    set(handles.start_freq_num,'Enable','off');
    set(handles.stop_freq_num,'Enable','off');
    set(handles.start_freq_unit,'Enable','off');
    set(handles.start_freq_set,'Enable','off');
    set(handles.start_stop_frequency,'Value',0);
elseif cs_button_value == 0
    settings.sa.cs_button = 0;
    settings.sa.ss_button = 1;
    set(handles.center_freq_num,'Enable','off');
    set(handles.span_freq_num,'Enable','off');
    set(handles.center_freq_unit,'Enable','off');
    set(handles.center_freq_set,'Enable','off');
end


% --- Executes on button press in execute_settings.
function execute_settings_Callback(hObject, eventdata, handles)
global settings;
global FSP;
% hObject    handle to execute_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch settings.sa.peak
    case 1
        fprintf(FSP, 'DET APE');
        guidata(hObject, handles);
    case 2 
        fprintf(FSP, 'DET QPE');
        guidata(hObject, handles);
    case 3
        fprintf(FSP, 'DET AVER');
        guidata(hObject, handles);
    otherwise
        fprintf(FSP, 'DET AVER');
        guidata(hObject, handles);
     
end

% Cekaj izmedu slanja
pause(0.3);

%RBW
switch settings.sa.rbw
    case 1
        rbw_string='10Hz';
        rbw_string_disp='10 Hz';
    case 2
        rbw_string='30Hz';
        rbw_string_disp='30 Hz';
    case 3
        rbw_string='100Hz';
        rbw_string_disp='100 Hz';
    case 4
        rbw_string='300Hz';
        rbw_string_disp='300 Hz';
    case 5
        rbw_string='1kHz';
        rbw_string_disp='1 kHz';
    case 6
        rbw_string='3kHz';
        rbw_string_disp='3 kHz';
    case 7
        rbw_string='10kHz';
        rbw_string_disp='10 kHz';
    case 8
        rbw_string='30kHz';
        rbw_string_disp='30 kHz';
    case 9
        rbw_string='100kHz';
        rbw_string_disp='100 kHz';
    case 10
        rbw_string='300kHz';
        rbw_string_disp='300 kHz';
    case 11
        rbw_string='1MHz';
        rbw_string_disp='1 MHz';
    case 12
        rbw_string='3MHz';
        rbw_string_disp='3 MHz';
    case 13
        rbw_string='10MHz';
        rbw_string_disp='10 MHz';
    otherwise
         msgbox('Select the frequency for resolution bandwidth ','Error','error'); 
end

rbw_send = ['BAND:RES ',rbw_string];
fprintf(FSP, rbw_send);
rbw_disp=['Rbw: ',rbw_string_disp];
guidata(hObject, handles);

pause(0.3);

%VBW
switch settings.sa.vbw
    case 1
        vbw_string='1Hz';
        vbw_string_disp='1 Hz';
    case 2
        vbw_string='3Hz';
        vbw_string_disp='3 Hz';
    case 3
        vbw_string='10Hz';
        vbw_string_disp='10 Hz';
    case 4
        vbw_string='30Hz';
        vbw_string_disp='30 Hz';
    case 5
        vbw_string='100Hz';
        vbw_string_disp='100 Hz';
    case 6
        vbw_string='300Hz';
        vbw_string_disp='300 Hz';
    case 7
        vbw_string='1kHz';
        vbw_string_disp='1 kHz';
    case 8
        vbw_string='3kHz';
        vbw_string_disp='3 kHz';
    case 9
        vbw_string='10kHz';
        vbw_string_disp='10 kHz';
    case 10
        vbw_string='30kHz';
        vbw_string_disp='30 kHz';
    case 11
        vbw_string='100kHz';
        vbw_string_disp='100 kHz';
    case 12
        vbw_string='300kHz';
        vbw_string_disp='300 kHz';
    case 13
        vbw_string='1MHz';
        vbw_string_disp='1 MHz';
    case 14
        vbw_string='3MHz';
        vbw_string_disp='3 MHz';
    case 15
        vbw_string='10MHz';
        vbw_string_disp='10 MHz';
    otherwise
         msgbox('Select the frequency for video  bandwidth ','Error','error'); 
end

vbw_send = ['BAND:VID ',vbw_string];
fprintf(FSP, vbw_send);
vbw_disp=['Vbw: ',vbw_string_disp];
guidata(hObject, handles);

pause(0.3);

%Y-SCALE
switch settings.sa.y_scale
    case 1
        unit_string='DBM';
        unit_string_disp='Unit: dBm';
    case 2
        unit_string='DBMV';
         unit_string_disp='Unit: dBmV';
    case 3
        unit_string='DBUV';
         unit_string_disp='Unit: dBuV';
    case 4
        unit_string='DBUA';
         unit_string_disp='Unit: dBuA';
    case 5
        unit_string='DBPW';
         unit_string_disp='Unit: dBpW';
    case 6
        unit_string='V';
         unit_string_disp='Unit: V';
    case 7
        unit_string='A';
         unit_string_disp='Unit: A';
    case 8
        unit_string='W';
         unit_string_disp='Unit: W';
    otherwise
         msgbox('Select the unit on y scale ','Error','error'); 
end

unit = ['UNIT:POW ',unit_string];
fprintf(FSP, unit);
unit_disp=['Y-axis unit: ',regexprep(unit_string_disp, 'Unit:', '')];
guidata(hObject, handles);

pause(0.3);

%SWEEP POINTS
switch settings.sa.sweep_points
    case 1
        sweep_points_string='125';
    case 2
        sweep_points_string='251';
    case 3
        sweep_points_string='501';
    case 4
       sweep_points_string='1001';
    case 5
        sweep_points_string='2001';
    case 6
        sweep_points_string='4001';
    case 7
        sweep_points_string='8001';
    otherwise
         msgbox('Select number of sweep points ','Error','error'); 
end

sweep_points_send = ['SWE:POIN ',sweep_points_string];
fprintf(FSP, sweep_points_send);
guidata(hObject, handles);

pause(0.3);

%SWEEP TIME
switch settings.sa.sweep_time_unit
    case 1
        swepp_time_unit_string='ms';
    case 2
        swepp_time_unit_string='s';
    case 3
        swepp_time_unit_string='AUTO ON';
    otherwise
         msgbox('Select the unit for start frequency ','Error','error'); 
end

if strcmp('ms', swepp_time_unit_string) || strcmp('s', swepp_time_unit_string)
    
    swepp_time_send=[settings.sa.sweep_time_num,swepp_time_unit_string];
    swepp_time = ['SWE:TIME ',swepp_time_send];
    fprintf(FSP, swepp_time);
    
elseif strcmp('AUTO ON', swepp_time_unit_string)
    swepp_time = ['SWE:TIME:',swepp_time_unit_string];
    fprintf(FSP, swepp_time);
    fprintf(FSP,'SWE:TIME?');
    auto=fscanf(FSP);
end

guidata(hObject, handles);

pause(0.3);

switch settings.sa.cs_button
    case 0
    %START/STOP
    switch settings.sa.freq_ss_unit
        case 1
            freq_unit_string='Hz';
        case 2
            freq_unit_string='kHz';
        case 3
            freq_unit_string='MHz';
        case 4
            freq_unit_string='GHz';
        otherwise
            msgbox('Select the unit for start frequency ','Error','error'); 
    end

    switch settings.sa.freq_ss_unit
        case 1
            freq_unit_string1='Hz';
        case 2
            freq_unit_string1='kHz';
        case 3
            freq_unit_string1='MHz';
        case 4
            freq_unit_string1='GHz';
        otherwise
            msgbox('Select the unit for stop frequency ','Error','error'); 
    end

    freq = ['frequency:start ',settings.sa.freq_start,freq_unit_string];
    fprintf(FSP, freq);
    freq1 = ['frequency:stop ',settings.sa.freq_stop,freq_unit_string1];
    fprintf(FSP, freq1);
    guidata(hObject, handles);

    case 1
    %CENTER/SPAN
    switch settings.sa.freq_cs_unit
        case 1
            freq_unit_string='Hz';
        case 2
            freq_unit_string='kHz';
        case 3
            freq_unit_string='MHz';
        case 4
            freq_unit_string='GHz';
        otherwise
            msgbox('Select the unit for center frequency ','Error','error'); 
    end

    switch settings.sa.freq_cs_unit
        case 1
            freq_unit_string1='Hz';
        case 2
            freq_unit_string1='kHz';
        case 3
            freq_unit_string1='MHz';
        case 4
            freq_unit_string1='GHz';
        otherwise
            msgbox('Select the unit for span frequency ','Error','error'); 
    end
    freq = ['frequency:cent ',settings.sa.freq_center,freq_unit_string];
    fprintf(FSP, freq);
    freq1 = ['frequency:span ',settings.sa.freq_span,freq_unit_string1];
    fprintf(FSP, freq1);
end

pause(0.3);

% REF. LEVEL
switch settings.sa.ref_level_unit
    case 1
        unit_string='DBM';
    case 2
        unit_string='DBMV';
    case 3
        unit_string='DBUV';
    case 4
        unit_string='DBUA';
    case 5
        unit_string='DBPW';
    case 6
        unit_string='V';
    case 7
        unit_string='A';
    case 8
        unit_string='W';
end
ref_lev=[settings.sa.ref_level,unit_string];
to_send=['DISP:WIND:TRAC:Y:RLEV ',ref_lev];
fprintf(FSP, to_send);
guidata(hObject, handles);



function enter_gpib_adress_Callback(hObject, eventdata, handles)
global settings;
global FSP;
% hObject    handle to enter_gpib_adress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of enter_gpib_adress as text
%        str2double(get(hObject,'String')) returns contents of enter_gpib_adress as a double
val = get(handles.enter_gpib_adress,'String');
settings.sa_gpib=str2double(val);


% --- Executes during object creation, after setting all properties.
function enter_gpib_adress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to enter_gpib_adress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in read_g_code.
function read_g_code_Callback(hObject, eventdata, handles)
global FSP;
global settings;
global g_code;
global connections;
% hObject    handle to read_g_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename=uigetfile;
g_code=importdata(filename);
if (connections.sa_connected==1)&&(connections.rfdc_connected==1)
    set(handles.getdata_button,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function current_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to current_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function current_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to current_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function position_X_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position_X (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function position_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to position_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function x_coor_Callback(hObject, eventdata, handles)
global draw;
global FSP;
% hObject    handle to x_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_coor as text
%        str2double(get(hObject,'String')) returns contents of x_coor as a double
x_coo = get(handles.x_coor,'String');
draw.x_coor = x_coo;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function x_coor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function y_coor_Callback(hObject, eventdata, handles)
global draw;
% hObject    handle to y_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_coor as text
%        str2double(get(hObject,'String')) returns contents of y_coor as a double
y_coo = get(handles.y_coor,'String');
draw.y_coor = y_coo;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function y_coor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in graph_pop.
function graph_pop_Callback(hObject, eventdata, handles)
global draw;
% hObject    handle to graph_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns graph_pop contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graph_pop
val = get(hObject,'Value');
draw.graph_print=val;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function graph_pop_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graph_pop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function connection_status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to connection_status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function contsweep_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to contsweep_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in draw_graph_button.
function draw_graph_button_Callback(hObject, eventdata, handles)
global settings;
global draw;
% hObject    handle to draw_graph_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
guidata(hObject, handles);


% --- Executes on button press in draw_field_button.
function draw_field_button_Callback(hObject, eventdata, handles)
global settings;
global draw;
% hObject    handle to draw_field_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
guidata(hObject, handles);



function set_frequency_Callback(hObject, eventdata, handles)
global FSP;
global draw;
% hObject    handle to set_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_frequency as text
%        str2double(get(hObject,'String')) returns contents of set_frequency as a double
val = get(hObject,'String');
draw.frequency_search=str2double(val);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function set_frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_set_frequency.
function popup_set_frequency_Callback(hObject, eventdata, handles)
global draw;
global FSP;
% hObject    handle to popup_set_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_set_frequency contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_set_frequency
val = get(hObject,'Value');
draw.frequency_search_unit=val;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popup_set_frequency_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_set_frequency (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in right_arrow.
function right_arrow_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to right_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.x=calibrations.x+1;
% posalji naredbu za pomak u desno
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);


% --- Executes on button press in left_arrow.
function left_arrow_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to left_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.x=calibrations.x-1;
% posalji naredbu za pomak u lijevo
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);


% --- Executes on button press in up_arrow.
function up_arrow_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to up_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.y=calibrations.y+1;
% posalji naredbu za pomak prema gore
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);


% --- Executes on button press in down_arrow.
function down_arrow_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to down_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.y=calibrations.y-1;
% posalji naredbu za pomak prema dolje
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);



function ref_point_coor_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to ref_point_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ref_point_coor as text
%        str2double(get(hObject,'String')) returns contents of ref_point_coor as a double
string = get(handles.ref_point_coor,'String');
split_string=regexp(string,',','split');
if numel(split_string)~=2
    msgbox('Input must be in form: number1,number2','Error','error');
else    
    calibrations.x = str2double(split_string{1});
    calibrations.y = str2double(split_string{2});
end


% --- Executes during object creation, after setting all properties.
function ref_point_coor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ref_point_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over right_arrow.
function right_arrow_ButtonDownFcn(hObject, eventdata, handles)
global calibrations;
% hObject    handle to right_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.x=calibrations.x+1;
% posalji naredbu za pomak u desno
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);


% --- Executes on button press in connect_rfdc.
function connect_rfdc_Callback(hObject, eventdata, handles)
global settings;
global FSP2;
global connections;
% hObject    handle to connect_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

FSP2 = gpib('ni',0,settings.rfdc_gpib);    
FSP2.InputBufferSize = 1044480;

guidata(hObject, handles);

if strcmp('open', FSP2.status)  
    msgbox('RF/DC source is connected ','Error','error');     
else
     fopen(FSP2);
     if strcmp('closed', FSP2.status)
         delete(FSP2);
         clear FSP2;
     end
     %Reset instrument
     fprintf(FSP2, '*RST');
     %Reset status registers
     fprintf(FSP2, '*CLS');
     set(handles.rfdc_connection_status,'String','RF/DC Connection: on');
     connections.rfdc_connected=1;         
end

set(handles.level_rfdc,'Enable','on');
set(handles.level_unit_rfdc,'Enable','on');
set(handles.freq_rfdc,'Enable','on');
set(handles.frequency_unit_rfdc,'Enable','on');
set(handles.Execute_rfdc_settings,'Enable','on');
set(handles.disconnect_rfdc,'Enable','on');

guidata(hObject, handles);


% --- Executes on button press in disconnect_rfdc.
function disconnect_rfdc_Callback(hObject, eventdata, handles)
global FSP2;
global connections;
% hObject    handle to disconnect_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', FSP2.status)  
    msgbox('RF/DC source is disconnected ','Error','error');     
else
     fprintf(FSP2,'OUTP OFF');
     fclose(FSP2);
     set(handles.rfdc_connection_status,'String','RF/DC Connection: off');
end
guidata(hObject, handles);
if strcmp('open', FSP2.status)  
    msgbox('Disconnect before deleting the RF/DC object ','Error','error'); 
else
    % Odspoji RF/DC
    delete(FSP2);
    clear FSP2;
    connections.rfdc_connected=0;
end




function gpib_rfdc_adress_Callback(hObject, eventdata, handles)
global settings;
% hObject    handle to gpib_rfdc_adress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gpib_rfdc_adress as text
%        str2double(get(hObject,'String')) returns contents of gpib_rfdc_adress as a double
val = get(handles.gpib_rfdc_adress,'String');
settings.rfdc_gpib=str2double(val);

% --- Executes during object creation, after setting all properties.
function gpib_rfdc_adress_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gpib_rfdc_adress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in frequency_unit_rfdc.
function frequency_unit_rfdc_Callback(hObject, eventdata, handles)
global settings_rf;
% hObject    handle to frequency_unit_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns frequency_unit_rfdc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from frequency_unit_rfdc
freq_unit = get(handles.frequency_unit_rfdc,'Value');
settings_rf.rfdc.freq_unit = freq_unit;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function frequency_unit_rfdc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frequency_unit_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in level_unit_rfdc.
function level_unit_rfdc_Callback(hObject, eventdata, handles)
global settings_rf;
% hObject    handle to level_unit_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns level_unit_rfdc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from level_unit_rfdc
level_unit = get(handles.level_unit_rfdc,'Value');
settings_rf.rfdc.level_unit = level_unit;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function level_unit_rfdc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level_unit_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Execute_rfdc_settings.
function Execute_rfdc_settings_Callback(hObject, eventdata, handles)
global FSP2;
global FSP;
global settings_rf;
global connections;
% hObject    handle to Execute_rfdc_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% FREKVENCIJA
switch settings_rf.rfdc.freq_unit
    case 1
        unit='Hz';
    case 2
        unit='kHz';
    case 3
        unit='MHz';
    case 4
        unit='GHz';
end
freq=[settings_rf.rfdc.freq_value,unit];
to_send=['FREQ ',freq];
fprintf(FSP2, to_send);
pause(0.3);
% AMPLITUDA
lev = 30;
positive = 0;
switch settings_rf.rfdc.level_unit
    case 1
        unit_l='dBm';
        lev = str2double(settings_rf.rfdc.level_value);
    case 2
        unit_l='dBmV';
        lev = -46.9897 + str2double(settings_rf.rfdc.level_value);
    case 3
        unit_l='dBuV';
        lev = -106.98 + str2double(settings_rf.rfdc.level_value);
    case 4
        unit_l='V';
        lev = 10 + 20*log10(str2double(settings_rf.rfdc.level_value)*sqrt(2));
        positive = 1;
end
level=[settings_rf.rfdc.level_value,unit_l];
to_send=['POW ', level];
if (lev < 3.01)
    fprintf(FSP2, to_send);
    if (positive == 0)
        decib = str2double(settings_rf.rfdc.level_value) + 5;
        to_send=['DISP:WIND:TRAC:Y:RLEV ',num2str(decib), unit_l];
    else
        decib = lev + 5;
        to_send=['DISP:WIND:TRAC:Y:RLEV ',num2str(decib), 'dBm'];
    end
    if (connections.sa_connected == 1)
        fprintf(FSP, to_send);
    end
    fprintf(FSP2, 'OUTP ON');
end
guidata(hObject, handles);




function freq_rfdc_Callback(hObject, eventdata, handles)
global settings_rf;
% hObject    handle to freq_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq_rfdc as text
%        str2double(get(hObject,'String')) returns contents of freq_rfdc as a double
freq = get(handles.freq_rfdc,'String');
settings_rf.rfdc.freq_value = freq;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function freq_rfdc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function level_rfdc_Callback(hObject, eventdata, handles)
global settings_rf;
% hObject    handle to level_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of level_rfdc as text
%        str2double(get(hObject,'String')) returns contents of level_rfdc as a double
level = get(handles.level_rfdc,'String');
settings_rf.rfdc.level_value = level;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function level_rfdc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to level_rfdc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ref_level_Callback(hObject, eventdata, handles)
global settings;
% hObject    handle to ref_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ref_level as text
%        str2double(get(hObject,'String')) returns contents of ref_level as a double
ref_level = get(handles.ref_level,'String');
settings.sa.ref_level = ref_level;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ref_level_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ref_level (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in ref_level_unit.
function ref_level_unit_Callback(hObject, eventdata, handles)
global settings;
% hObject    handle to ref_level_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns ref_level_unit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ref_level_unit
ref_level_unit = get(handles.ref_level_unit,'Value');
settings.sa.ref_level_unit = ref_level_unit;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ref_level_unit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ref_level_unit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function launch_phase_Callback(hObject, eventdata, handles)
% hObject    handle to launch_phase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function dut_Callback(hObject, eventdata, handles)
% hObject    handle to dut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Definition_Callback(hObject, eventdata, handles)
% hObject    handle to Definition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
global connections;
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
if (connections.sa_connected==1)||(connections.rfdc_connected==1)||(connections.pm_forward==1)||(connections.pm_reflected==1)||(connections.fluke_connected==1)||(connections.osc_connected==1)
    msgbox('Disconnect before exiting!','Warning','warn')
else
    delete(hObject);
    clear all;
    clear fun;
    clear functions;
end


function com_forward_Callback(hObject, eventdata, handles)
% hObject    handle to com_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of com_forward as text
%        str2double(get(hObject,'String')) returns contents of com_forward as a double


% --- Executes during object creation, after setting all properties.
function com_forward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function com_reflected_Callback(hObject, eventdata, handles)
% hObject    handle to com_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of com_reflected as text
%        str2double(get(hObject,'String')) returns contents of com_reflected as a double


% --- Executes during object creation, after setting all properties.
function com_reflected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to com_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baud_forward_Callback(hObject, eventdata, handles)
% hObject    handle to baud_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baud_forward as text
%        str2double(get(hObject,'String')) returns contents of baud_forward as a double


% --- Executes during object creation, after setting all properties.
function baud_forward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baud_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baud_reflected_Callback(hObject, eventdata, handles)
% hObject    handle to baud_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baud_reflected as text
%        str2double(get(hObject,'String')) returns contents of baud_reflected as a double


% --- Executes during object creation, after setting all properties.
function baud_reflected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baud_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filter_forward.
function filter_forward_Callback(hObject, eventdata, handles)
% hObject    handle to filter_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter_forward contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter_forward


% --- Executes during object creation, after setting all properties.
function filter_forward_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in filter_reflected.
function filter_reflected_Callback(hObject, eventdata, handles)
% hObject    handle to filter_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter_reflected contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter_reflected


% --- Executes during object creation, after setting all properties.
function filter_reflected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connect_forward.
function connect_forward_Callback(hObject, eventdata, handles)
global radi_pm_forward;
global connections;
% hObject    handle to connect_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radi_pm_forward = serial(get(handles.com_forward,'String'), 'BaudRate', str2double(get(handles.baud_forward,'String')));
if strcmp('open', radi_pm_forward.status)  
    msgbox('Forward power meter is already connected ','Error','error');     
else
    fopen(radi_pm_forward);
    connections.pm_forward=1;
    filt = get(handles.filter_forward,'Value');
    switch filt
        case 1
            filter_string='FILTER 1';
        case 2
            filter_string='FILTER 2';
        case 3
            filter_string='FILTER 3';
        case 4
            filter_string='FILTER 4';
        case 5
            filter_string='FILTER 5';
        case 6
            filter_string='FILTER 6';
        case 7
            filter_string='FILTER 7';
        case 8
            filter_string='FILTER AUTO';
    end
    fprintf(radi_pm_forward, filter_string);
    n=fscanf(radi_pm_forward);
    n_correct=[n(1),n(2)];
    if strcmp(n_correct,'OK')
    else
        error('Filter adjustment failed')
    end
    set(handles.pm_forward_connection_status,'String','PM Forward Connection: on');
    set(handles.get_button_forward,'Enable','on');
end
guidata(hObject, handles);


% --- Executes on button press in connect_reflected.
function connect_reflected_Callback(hObject, eventdata, handles)
global radi_pm_reflected;
global connections;
% hObject    handle to connect_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
radi_pm_reflected = serial(get(handles.com_reflected,'String'), 'BaudRate', str2double(get(handles.baud_reflected,'String')));
if strcmp('open', radi_pm_reflected.status)  
    msgbox('Reflected power meter is already connected ','Error','error');     
else
    fopen(radi_pm_reflected);
    connections.pm_reflected=1;
    filt = get(handles.filter_reflected,'Value');
    switch filt
        case 1
            filter_string='FILTER 1';
        case 2
            filter_string='FILTER 2';
        case 3
            filter_string='FILTER 3';
        case 4
            filter_string='FILTER 4';
        case 5
            filter_string='FILTER 5';
        case 6
            filter_string='FILTER 6';
        case 7
            filter_string='FILTER 7';
        case 8
            filter_string='FILTER AUTO';
    end
    fprintf(radi_pm_reflected, filter_string);
    n=fscanf(radi_pm_reflected);
    n_correct=[n(1),n(2)];
    if strcmp(n_correct,'OK')
    else
        error('Filter adjustment failed')
    end
    set(handles.pm_reflected_connection_status,'String','PM Reflected Connection: on');
    set(handles.get_button_reflected,'Enable','on');
end


% --- Executes on button press in disconnect_forward.
function disconnect_forward_Callback(hObject, eventdata, handles)
global connections;
global radi_pm_forward;
% hObject    handle to disconnect_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', radi_pm_forward.status)  
    msgbox('Forward power meter is already disconnected ','Error','error');     
else
    fclose(radi_pm_forward);
    % Odspoji PM-F
    delete(radi_pm_forward);
    clear radi_pm_forward;
    connections.pm_forward=0;
    set(handles.pm_forward_connection_status,'String','PM Forward Connection: off');
end
guidata(hObject, handles);



% --- Executes on button press in disconnect_reflected.
function disconnect_reflected_Callback(hObject, eventdata, handles)
global connections;
global radi_pm_reflected;
% hObject    handle to disconnect_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', radi_pm_reflected.status)  
    msgbox('Reflected power meter is already disconnected ','Error','error');     
else
    fclose(radi_pm_reflected);
    % Odspoji PM-REF
    delete(radi_pm_reflected);
    clear radi_pm_reflected;
    connections.pm_reflected=0;
    set(handles.pm_reflected_connection_status,'String','PM Reflected Connection: off');
end
guidata(hObject, handles);


% --------------------------------------------------------------------
function meas_emc_Callback(hObject, eventdata, handles)
% hObject    handle to meas_emc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function set_fmin_Callback(hObject, eventdata, handles)
% hObject    handle to set_fmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_fmin as text
%        str2double(get(hObject,'String')) returns contents of set_fmin as a double


% --- Executes during object creation, after setting all properties.
function set_fmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_fmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set_fstep_Callback(hObject, eventdata, handles)
% hObject    handle to set_fstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_fstep as text
%        str2double(get(hObject,'String')) returns contents of set_fstep as a double


% --- Executes during object creation, after setting all properties.
function set_fstep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_fstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set_fmax_Callback(hObject, eventdata, handles)
% hObject    handle to set_fmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_fmax as text
%        str2double(get(hObject,'String')) returns contents of set_fmax as a double


% --- Executes during object creation, after setting all properties.
function set_fmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_fmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set_pmin_Callback(hObject, eventdata, handles)
% hObject    handle to set_pmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_pmin as text
%        str2double(get(hObject,'String')) returns contents of set_pmin as a double


% --- Executes during object creation, after setting all properties.
function set_pmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_pmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set_pstep_Callback(hObject, eventdata, handles)
% hObject    handle to set_pstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_pstep as text
%        str2double(get(hObject,'String')) returns contents of set_pstep as a double


% --- Executes during object creation, after setting all properties.
function set_pstep_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_pstep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function set_pmax_Callback(hObject, eventdata, handles)
% hObject    handle to set_pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of set_pmax as text
%        str2double(get(hObject,'String')) returns contents of set_pmax as a double


% --- Executes during object creation, after setting all properties.
function set_pmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_pmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dpi_low_Callback(hObject, eventdata, handles)
% hObject    handle to dpi_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dpi_low as text
%        str2double(get(hObject,'String')) returns contents of dpi_low as a double


% --- Executes during object creation, after setting all properties.
function dpi_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dpi_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dpi_high_Callback(hObject, eventdata, handles)
% hObject    handle to dpi_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dpi_high as text
%        str2double(get(hObject,'String')) returns contents of dpi_high as a double


% --- Executes during object creation, after setting all properties.
function dpi_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dpi_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in dpi_funit.
function dpi_funit_Callback(hObject, eventdata, handles)
% hObject    handle to dpi_funit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns dpi_funit contents as cell array
%        contents{get(hObject,'Value')} returns selected item from dpi_funit


% --- Executes during object creation, after setting all properties.
function dpi_funit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dpi_funit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gpib_fluke_Callback(hObject, eventdata, handles)
global fmulti;
% hObject    handle to gpib_fluke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gpib_fluke as text
%        str2double(get(hObject,'String')) returns contents of gpib_fluke as a double
val = get(handles.gpib_fluke,'String');
fmulti.gpib_fluke=str2double(val);


% --- Executes during object creation, after setting all properties.
function gpib_fluke_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gpib_fluke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connect_fluke.
function connect_fluke_Callback(hObject, eventdata, handles)
global connections;
global fluke;
global fmulti;
% hObject    handle to connect_fluke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fluke = gpib('ni',0,fmulti.gpib_fluke);    
fluke.InputBufferSize = 1044480;

guidata(hObject, handles);

if strcmp('open', fluke.status)  
    msgbox('Fluke multimeter is already connected ','Error','error');     
else
     fopen(fluke);
     %Reset instrument
     fprintf(fluke, '*RST');
     %Reset status registers
     fprintf(fluke, '*CLS');
     fprintf(fluke, 'VDC');
     connections.fluke_connected=1;
     set(handles.fluke_connection_status,'String','Fluke Connection: on');
end

set(handles.get_fluke_v,'Enable','on');
set(handles.disconnect_fluke,'Enable','on');

guidata(hObject, handles);


% --- Executes on button press in disconnect_fluke.
function disconnect_fluke_Callback(hObject, eventdata, handles)
global connections;
global fluke;
% hObject    handle to disconnect_fluke (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', fluke.status)  
    msgbox('Fluke multimeter is already disconnected ','Error','error');     
else
     fclose(fluke);
end
guidata(hObject, handles);
if strcmp('open', fluke.status)  
    msgbox('Disconnect before deleting the fluke object ','Error','error'); 
else
    % Odspoji fluke
    delete(fluke);
    clear fluke;
    connections.fluke_connected=0;
    set(handles.fluke_connection_status,'String','Fluke Connection: off');
end


% --- Executes on button press in get_fluke_v.
function get_fluke_v_Callback(hObject, eventdata, handles)
global fluke;
global fmulti;
% hObject    handle to get_fluke_v (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fprintf(fluke, 'VAL?');
fmulti.fluke_voltage = fscanf(fluke);
voltage = str2double(fmulti.fluke_voltage);
fmulti.fluke_voltage = num2str(voltage);
set(handles.fluke_voltage,'String',fmulti.fluke_voltage);


% --- Executes on button press in start_dpi_meas.
function start_dpi_meas_Callback(hObject, eventdata, handles)
global dpi_values;
global radi_pm_forward;
global radi_pm_reflected;
global FSP2;
global connections;
global fluke;
global fmulti;
global agilent_osc;
% hObject    handle to start_dpi_meas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==0)||(connections.pm_forward==0)||(connections.pm_reflected==0)||((connections.fluke_connected==0)&&(connections.osc_connected==0))
    msgbox('Connect to instruments before measuring!','Warning','warn')
else
    dpi_values.fspace=get(handles.set_fspace,'Value');
    dpi_values.fmin=get(handles.set_fmin,'String');
    f_min = str2double(dpi_values.fmin);
    dpi_values.fmax=get(handles.set_fmax,'String');
    f_max = str2double(dpi_values.fmax);
    dpi_values.nstep=get(handles.set_fstep,'String');
    n_step = str2double(dpi_values.nstep);
    dpi_values.dpi_funit=get(handles.dpi_funit,'Value');
    dpi_values.pmin=get(handles.set_pmin,'String');
    p_min = str2double(dpi_values.pmin);
    dpi_values.pmax=get(handles.set_pmax,'String');
    p_max = str2double(dpi_values.pmax);
    dpi_values.pstep=get(handles.set_pstep,'String');
    p_step = str2double(dpi_values.pstep);
    dpi_values.dpi_low=get(handles.dpi_low,'String');
    low_dpi = str2double(dpi_values.dpi_low);
    dpi_values.dpi_high=get(handles.dpi_high,'String');
    high_dpi = str2double(dpi_values.dpi_high);
    switch dpi_values.dpi_funit
        case 1
            unit='Hz';
            gain=1;
        case 2
            unit='kHz';
            gain=1000;
        case 3
            unit='MHz';
            gain=1000000;
        case 4
            unit='GHz';
            gain=1000000000;
    end
    switch dpi_values.fspace
        case 1
            frequenc=linspace(f_min*gain,f_max*gain,n_step);
        case 2
            frequenc=logspace(log10(f_min*gain),log10(f_max*gain),n_step);
    end
    frequency_test=zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_trans=zeros(length(frequenc),1);
    P_forw=zeros(length(frequenc),1);
    P_reflec=zeros(length(frequenc),1);
    P_forward = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_reflected = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_transmitted = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    countf=1;
    begin=0;
    filename = uiputfile;
    % Petlja kroz frekvencije
    for i=1:length(frequenc)
        freq=[num2str(frequenc(i)/gain),unit];
        to_send=['FREQ ',freq];
        fprintf(FSP2, to_send);
        pause(0.3);
        % Petlja kroz snage
        countp=1;
        for j=p_min:p_step:p_max
            level=[num2str(j),'dBm'];
            to_send=['POW ', level];
            if (j <= 3)
                fprintf(FSP2, to_send);
                if (begin==0)
                   fprintf(FSP2, 'OUTP ON'); 
                   begin=1;
                end
                pause(0.3);
            end
            % Provjeri postavljanje frekvencije
            to_send=['FREQUENCY ',num2str(frequenc(i)),' Hz'];
            fprintf(radi_pm_forward,to_send);
            n=fscanf(radi_pm_forward);
            n_correct=[n(1),n(2)];
            if strcmp(n_correct,'OK')
            else
                error('Failed to load frequency')
            end
            fprintf(radi_pm_forward,'FREQUENCY?');
            corr_freq_for=strsplit(fscanf(radi_pm_forward),' ');
            correct_freq_forward=str2double(corr_freq_for(1));
            fprintf(radi_pm_reflected,to_send);
            n=fscanf(radi_pm_reflected);
            n_correct=[n(1),n(2)];
            if strcmp(n_correct,'OK')
            else
                error('Failed to load frequency')
            end
            fprintf(radi_pm_reflected,'FREQUENCY?');
            corr_freq_ref=strsplit(fscanf(radi_pm_reflected),' ');
            correct_freq_reflected=str2double(corr_freq_ref(1));
            check = floor(frequenc(i));
            if (floor(correct_freq_forward)~=check)||(floor(correct_freq_reflected)~=check)
                 %error ('PM failed to load frequency');
            end
            % Pro�itaj snagu sa PM
            fprintf(radi_pm_forward,'POWER?');
            Power_forward = strsplit(fscanf(radi_pm_forward),' ');
            P_forward(countf,countp) = str2double(Power_forward(1))+40;
            fprintf(radi_pm_reflected,'POWER?');
            Power_reflected = strsplit(fscanf(radi_pm_reflected),' ');
            P_reflected(countf,countp) = str2double(Power_reflected(1))+40;
            % Pro�itaj napon sa Flukea/osciloskopa            
            if (connections.osc_connected==1)                
%                 %% old variant
%                 pause(0.5);
%                 fprintf(FSP2,'FREQ?');
%                 ff = str2double(fscanf(FSP2));
%                 %time = 10*(1/ff);
%                 time = 5*(1/ff);
%                 time_s = num2str(time);
%                 timebase = [':TIMebase:RANGe ',time_s];
%                 fprintf(agilent_osc, timebase);
%                 %fprintf(agilent_osc, ':DIGitize CHANnel1');
%                 fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
%                 vmax_s = fscanf(agilent_osc);
%                 vmax = str2double(vmax_s);
%                 %fprintf(agilent_osc, ':DIGitize CHANnel1');
%                 fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
%                 vmin_s = fscanf(agilent_osc);
%                 vmin = str2double(vmin_s);
                %% new
                fprintf(FSP2,'FREQ?');
                ff = str2double(fscanf(FSP2));
                time = 20*(1/ff);
                %time = 10*(1/ff);
                %time = 5*(1/ff);
                time_s = num2str(time);
                timebase = [':TIMebase:RANGe ',time_s];
                fprintf(agilent_osc, timebase);                
                vmin_s = [];
                vmax_s = [];
                while isempty(vmin_s) || isempty(vmax_s)
                    fprintf(agilent_osc, ':TRIGger:LEVel 5 V'); 
                    fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                    fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
                    vmax_s = fscanf(agilent_osc);
                    if isempty(vmax_s)
                        disp('empty string');
                    end                    
                    vmax = str2double(vmax_s);
                    %fprintf(agilent_osc, ':DIGitize CHANnel1');
                    fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
                    vmin_s = fscanf(agilent_osc);
                    if isempty(vmin_s)
                        disp('empty string');
                    end                      
                    vmin = str2double(vmin_s);
                end
                
                trigger_level = (vmax + vmin)/2;
                trigger_level_msg = [':TRIGger:LEVel ',num2str(trigger_level)];
                fprintf(agilent_osc, trigger_level_msg);                
                %fprintf(agilent_osc, ':TRIGger:SWEep NORMal');
                
                %fprintf(agilent_osc, ':TER?');
                %trig_status = str2num(fscanf(agilent_osc));
                %fprintf(agilent_osc, ':TER?');
                %trig_status = str2num(fscanf(agilent_osc));
                %if trig_status == 0
                    fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                %end
                
                vmin_s = [];
                vmax_s = [];
                num_sweeps = 10;
                for swindex = 1:num_sweeps
                    while isempty(vmin_s) || isempty(vmax_s)
                        pause(1);
                        fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
                        vmax_s = fscanf(agilent_osc);
                        if isempty(vmax_s)
                            disp('empty string');
                            fprintf(agilent_osc, '*RST');
                            osc_default_setting;
                            fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                        end
                        vmax = str2double(vmax_s);

                        fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
                        vmin_s = fscanf(agilent_osc);
                        if isempty(vmin_s)
                            disp('empty string');
                            fprintf(agilent_osc, '*RST');
                            osc_default_setting;
                            fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                        end                    
                        vmin = str2double(vmin_s);
                    end
                    vmin_sweep(swindex) = vmin;
                    vmax_sweep(swindex) = vmax;
                end
                vmin = min(vmin_sweep);
                vmax = max(vmax_sweep);
            else
                if (connections.fluke_connected==1)
                    fprintf(fluke, 'VAL?');
                    fmulti.fluke_voltage = fscanf(fluke);
                    vmax = str2double(fmulti.fluke_voltage);
                    vmin = vmax;
                end
            end
            if (vmax >= high_dpi)
                frequency_test(countf, countp) = 1;
                break;
            end
            if (vmin <= low_dpi)
                frequency_test(countf, countp) = -1;
                break;
            end
            countp=countp+1;
        end
        countf=countf+1;
    end
    fprintf(FSP2, 'OUTP OFF');
    % Izra�unaj p_transmitted
    P_forward_calc = 1e-3*10.^(P_forward./10);
    P_reflected_calc = 1e-3*10.^(P_reflected./10);
    P_transmitted_calc = P_forward_calc - P_reflected_calc;
    cf=1;
    for i=1:length(frequenc)
        cp=1;
        for j=p_min:p_step:p_max
            P_transmitted(cf,cp) = real(10*log10(P_transmitted_calc(cf,cp)/(1e-3)));
            if (frequency_test(cf,cp)~=0)
                P_trans(cf) = P_transmitted(cf,cp);
                P_forw(cf) = P_forward(cf,cp);
                P_reflec(cf) = P_reflected(cf,cp);
                break;
            else
                P_trans(cf) = P_transmitted(cf,cp);
                P_forw(cf) = P_forward(cf,cp);
                P_reflec(cf) = P_reflected(cf,cp);
            end
            cp=cp+1;
        end 
        cf=cf+1;
    end
    % Spremi i nacrtaj
    save(filename,'P_trans');
    save(filename,'frequenc', '-append');
    %save(filename,'P_forward','-append');
    save(filename,'P_forw','-append');
    save(filename,'P_reflec','-append');
    save(filename,'frequency_test','-append');
    %save(filename,'P_reflected','-append');
    %save(filename,'P_transmitted','-append');
    h = figure(1);
    switch dpi_values.fspace
        case 1
            plot(frequenc, P_forw);
        case 2
            semilogx(frequenc, P_forw);
    end
    fr = ['frequency, ',unit];
    xlabel(fr);
    ylabel('forward power, dBm');
    str=['DPI measurement (',dpi_values.fmin,' ',unit,' - ',dpi_values.fmax,unit,')'];
    title(str);
    %export_fig('DPI measurement.pdf');
    filename1 = sprintf('DPI measurement(%s %s - %s %s).pdf',dpi_values.fmin,unit,dpi_values.fmax,unit);
    print( h, '-append', '-dpdf', filename1 );
end



function visa_address_Callback(hObject, eventdata, handles)
global ag_oscilloscope;
% hObject    handle to visa_address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of visa_address as text
%        str2double(get(hObject,'String')) returns contents of visa_address as a double
val = get(handles.visa_address,'String');
ag_oscilloscope.visa_address=val;


% --- Executes during object creation, after setting all properties.
function visa_address_CreateFcn(hObject, eventdata, handles)
% hObject    handle to visa_address (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connect_oscilloscope.
function osc_default_setting()
global connections;
global agilent_osc;
global FSP2;
if (connections.rfdc_connected==1)
    fprintf(FSP2,'FREQ?');
    frequenc = fscanf(FSP2);
    ff = str2double(frequenc);
    time = 10*(1/ff);
    time_s = num2str(time);
    timebase = [':TIMebase:RANGe ',time_s];
    fprintf(agilent_osc, timebase);
else
    error('NO FSP2 connenction');
end
fprintf(agilent_osc, ':TIMebase:DELay 0');
fprintf(agilent_osc, ':TIMebase:REFerence CENTer');
fprintf(agilent_osc, ':CHANnel1:PROBe 10');
fprintf(agilent_osc, ':CHANnel1:RANGe 1000 mV');
fprintf(agilent_osc, ':CHANnel1:OFFSet 5 V');
fprintf(agilent_osc, ':CHANnel1:COUPling DC');
fprintf(agilent_osc, ':TRIGger:LEVel 5 V');
fprintf(agilent_osc, ':TRIGger:SLOPe POSitive');
fprintf(agilent_osc, ':ACQuire:TYPE PEAK');     
%fprintf(agilent_osc, ':ACQuire:TYPE AVERage');
%fprintf(agilent_osc, ':ACQuire:COUNt 8');
fprintf(agilent_osc, ':WAVeform:SOURce CHANnel1');
fprintf(agilent_osc, ':WAVeform:FORMat ASCII');
fprintf(agilent_osc, ':WAVeform:POINts:MODE MAXimum');
fprintf(agilent_osc, ':WAVeform:POINts 100000');
fprintf(agilent_osc, ':CHANnel1:BWLimit OFF');   

function connect_oscilloscope_Callback(hObject, eventdata, handles)
global connections;
global agilent_osc;
global ag_oscilloscope;
global FSP2;
% hObject    handle to connect_oscilloscope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
agilent_osc = visa('agilent',ag_oscilloscope.visa_address);    
agilent_osc.InputBufferSize = 1044480;
agilent_osc.Timeout = 5;

guidata(hObject, handles);

if strcmp('open', agilent_osc.status)  
    msgbox('Agilent oscilloscope  is already connected ','Error','error');     
else
     fopen(agilent_osc);
     %Reset instrument
     fprintf(agilent_osc, '*RST');
     %Reset status registers
     fprintf(agilent_osc, '*CLS');
     connections.osc_connected=1;
     set(handles.oscilloscope_connection_status,'String','Oscilloscope Connection: on');
      if (connections.rfdc_connected==1)
          fprintf(FSP2,'FREQ?');
          frequenc = fscanf(FSP2);
          ff = str2double(frequenc);
          time = 10*(1/ff);
          time_s = num2str(time);
          timebase = [':TIMebase:RANGe ',time_s];
          fprintf(agilent_osc, timebase);
      end
     osc_default_setting;
     fprintf(agilent_osc, ':TRIGger:SWEep AUTO');        
end

set(handles.disconnect_oscilloscope,'Enable','on');

guidata(hObject, handles);


% --- Executes on button press in disconnect_oscilloscope.
function disconnect_oscilloscope_Callback(hObject, eventdata, handles)
global connections;
global agilent_osc;
% hObject    handle to disconnect_oscilloscope (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp('closed', agilent_osc.status)  
    msgbox('Agilent oscilloscope is already disconnected ','Error','error');     
else
     fclose(agilent_osc);
end
guidata(hObject, handles);
if strcmp('open', agilent_osc.status)  
    msgbox('Disconnect before deleting the Agilent oscilloscope object ','Error','error'); 
else
    % Odspoji osciloskop
    delete(agilent_osc);
    clear agilent_osc;
    connections.osc_connected=0;
    set(handles.oscilloscope_connection_status,'String','Oscilloscope Connection: off');
end


% --- Executes on selection change in set_fspace.
function set_fspace_Callback(hObject, eventdata, handles)
% hObject    handle to set_fspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns set_fspace contents as cell array
%        contents{get(hObject,'Value')} returns selected item from set_fspace


% --- Executes during object creation, after setting all properties.
function set_fspace_CreateFcn(hObject, eventdata, handles)
% hObject    handle to set_fspace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in get_button_forward.
function get_button_forward_Callback(hObject, eventdata, handles)
global pmeters;
global radi_pm_forward;
global FSP2;
global connections;
% hObject    handle to get_button_forward (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==1)
    fprintf(FSP2,'FREQ?');
    frequenc = fscanf(FSP2);
    ff = str2double(frequenc);
    frequenc = num2str(ff);
    to_send=['FREQUENCY ',frequenc,' Hz'];
    fprintf(radi_pm_forward,to_send);
    n=fscanf(radi_pm_forward);
    n_correct=[n(1),n(2)];
    if strcmp(n_correct,'OK')
    else
        error('Failed to load frequency');
    end
    fprintf(radi_pm_forward,'FREQUENCY?');
    corr_freq_for=strsplit(fscanf(radi_pm_forward),' ');
    correct_freq_forward=str2double(corr_freq_for(1));
    if (floor(correct_freq_forward)~=floor(str2double(frequenc)))
        error('Failed to load frequency');
    end
    fprintf(radi_pm_forward,'POWER?');
    Power_forward = strsplit(fscanf(radi_pm_forward),' ');
    P_forward = str2double(Power_forward(1))+40;
    P_forw = num2str(P_forward);
    set(handles.get_forward_power,'String',P_forw);
else
    fprintf(radi_pm_forward,'POWER?');
    Power_forward = strsplit(fscanf(radi_pm_forward),' ');
    P_forward = str2double(Power_forward(1))+40;
    P_forw = num2str(P_forward);
    set(handles.get_forward_power,'String',P_forw);
end    


% --- Executes on button press in get_button_reflected.
function get_button_reflected_Callback(hObject, eventdata, handles)
global pmeters;
global radi_pm_reflected;
global FSP2;
global connections;
% hObject    handle to get_button_reflected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==1)
    fprintf(FSP2,'FREQ?');
    frequenc = fscanf(FSP2);
    ff = str2double(frequenc);
    frequenc = num2str(ff);
    to_send=['FREQUENCY ',frequenc,' Hz'];
    fprintf(radi_pm_reflected,to_send);
    n=fscanf(radi_pm_reflected);
    n_correct=[n(1),n(2)];
    if strcmp(n_correct,'OK')
    else
        error('Failed to load frequency');
    end
    fprintf(radi_pm_reflected,'FREQUENCY?');
    corr_freq_ref=strsplit(fscanf(radi_pm_reflected),' ');
    correct_freq_reflected=str2double(corr_freq_ref(1));
    if (floor(correct_freq_reflected)~=floor(str2double(frequenc)))
        error('Failed to load frequency');
    end
    fprintf(radi_pm_reflected,'POWER?');
    Power_reflected = strsplit(fscanf(radi_pm_reflected),' ');
    P_reflected = str2double(Power_reflected(1))+40;
    P_reflec = num2str(P_reflected);
    set(handles.get_reflected_power,'String',P_reflec);
else
    fprintf(radi_pm_reflected,'POWER?');
    Power_reflected = strsplit(fscanf(radi_pm_reflected),' ');
    P_reflected = str2double(Power_reflected(1))+40;
    P_reflec = num2str(P_reflected);
    set(handles.get_reflected_power,'String',P_reflec);
end 


% --- Executes on button press in disconnect_all.
function disconnect_all_Callback(hObject, eventdata, handles)
global connections;
global FSP;
global FSP2;
global radi_pm_forward;
global radi_pm_reflected;
global agilent_osc;
global fluke;
% hObject    handle to disconnect_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% disconnect all
if (connections.rfdc_connected==1)
    if strcmp('closed', FSP2.status)  
        msgbox('RF/DC source is disconnected ','Error','error');     
    else
        fprintf(FSP2,'OUTP OFF');
        fclose(FSP2);
        set(handles.rfdc_connection_status,'String','RF/DC Connection: off');
    end
    guidata(hObject, handles);
    if strcmp('open', FSP2.status)  
        msgbox('Disconnect before deleting the RF/DC object ','Error','error'); 
    else
        % Odspoji RF/DC
        delete(FSP2);
        clear FSP2;
        connections.rfdc_connected=0;
    end
end
if (connections.sa_connected==1)
    if strcmp('closed', FSP.status)  
        msgbox('Spectrum analyzer is disconnected ','Error','error');     
    else
        fclose(FSP);
        set(handles.connection_status,'String','SA Connection: off');
    end
    guidata(hObject, handles);
    if strcmp('open', FSP.status)  
        msgbox('Disconnect before deleting the SA object ','Error','error'); 
    else
        % Odspoji SA
        delete(FSP);
        clear FSP;
        connections.sa_connected=0;
    end
end
if (connections.pm_forward==1)
    if strcmp('closed', radi_pm_forward.status)  
        msgbox('Forward power meter is already disconnected ','Error','error');     
    else
        fclose(radi_pm_forward);
        % Odspoji PM-F
        delete(radi_pm_forward);
        clear radi_pm_forward;
        connections.pm_forward=0;
        set(handles.pm_forward_connection_status,'String','PM Forward Connection: off');
    end
end
if (connections.pm_reflected==1)
    if strcmp('closed', radi_pm_reflected.status)  
        msgbox('Reflected power meter is already disconnected ','Error','error');     
    else
        fclose(radi_pm_reflected);
        % Odspoji PM-REF
        delete(radi_pm_reflected);
        clear radi_pm_reflected;
        connections.pm_reflected=0;
        set(handles.pm_reflected_connection_status,'String','PM Reflected Connection: off');
    end
end
if (connections.fluke_connected==1)
    if strcmp('closed', fluke.status)  
        msgbox('Fluke multimeter is already disconnected ','Error','error');     
    else
        fclose(fluke);
    end
    guidata(hObject, handles);
    if strcmp('open', fluke.status)  
        msgbox('Disconnect before deleting the fluke object ','Error','error'); 
    else
        % Odspoji fluke
        delete(fluke);
        clear fluke;
        connections.fluke_connected=0;
        set(handles.fluke_connection_status,'String','Fluke Connection: off');
    end
end
if (connections.osc_connected==1)
    if strcmp('closed', agilent_osc.status)  
        msgbox('Agilent oscilloscope is already disconnected ','Error','error');     
    else
        fclose(agilent_osc);
    end
    guidata(hObject, handles);
    if strcmp('open', agilent_osc.status)  
        msgbox('Disconnect before deleting the Agilent oscilloscope object ','Error','error'); 
    else
        % Odspoji osciloskop
        delete(agilent_osc);
        clear agilent_osc;
        connections.osc_connected=0;
        set(handles.oscilloscope_connection_status,'String','Oscilloscope Connection: off');
    end
end


% --- Executes on button press in measure_quit.
function measure_quit_Callback(hObject, eventdata, handles)
% hObject    handle to measure_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global dpi_values;
global radi_pm_forward;
global radi_pm_reflected;
global FSP2;
global connections;
global fluke;
global fmulti;
global agilent_osc;
global FSP;
% hObject    handle to start_dpi_meas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==0)||(connections.pm_forward==0)||(connections.pm_reflected==0)||((connections.fluke_connected==0)&&(connections.osc_connected==0))
    msgbox('Connect to instruments before measuring!','Warning','warn')
else
    dpi_values.fspace=get(handles.set_fspace,'Value');
    dpi_values.fmin=get(handles.set_fmin,'String');
    f_min = str2double(dpi_values.fmin);
    dpi_values.fmax=get(handles.set_fmax,'String');
    f_max = str2double(dpi_values.fmax);
    dpi_values.nstep=get(handles.set_fstep,'String');
    n_step = str2double(dpi_values.nstep);
    dpi_values.dpi_funit=get(handles.dpi_funit,'Value');
    dpi_values.pmin=get(handles.set_pmin,'String');
    p_min = str2double(dpi_values.pmin);
    dpi_values.pmax=get(handles.set_pmax,'String');
    p_max = str2double(dpi_values.pmax);
    dpi_values.pstep=get(handles.set_pstep,'String');
    p_step = str2double(dpi_values.pstep);
    dpi_values.dpi_low=get(handles.dpi_low,'String');
    low_dpi = str2double(dpi_values.dpi_low);
    dpi_values.dpi_high=get(handles.dpi_high,'String');
    high_dpi = str2double(dpi_values.dpi_high);
    switch dpi_values.dpi_funit
        case 1
            unit='Hz';
            gain=1;
        case 2
            unit='kHz';
            gain=1000;
        case 3
            unit='MHz';
            gain=1000000;
        case 4
            unit='GHz';
            gain=1000000000;
    end
    switch dpi_values.fspace
        case 1
            frequenc=linspace(f_min*gain,f_max*gain,n_step);
        case 2
            frequenc=logspace(log10(f_min*gain),log10(f_max*gain),n_step);
    end
    frequency_test=zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_trans=zeros(length(frequenc),1);
    P_forw=zeros(length(frequenc),1);
    P_reflec=zeros(length(frequenc),1);
    P_forward = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_reflected = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    P_transmitted = zeros(length(frequenc), floor((p_max-p_min)/p_step + 1));
    countf=1;
    begin=0;
    filename = uiputfile;
    % Petlja kroz frekvencije
    for i=1:length(frequenc)
        freq=[num2str(frequenc(i)/gain),unit];
        to_send=['FREQ ',freq];
        fprintf(FSP2, to_send);
        pause(0.3);
        % Petlja kroz snage
        countp=1;
        for j=p_min:p_step:p_max
            level=[num2str(j),'dBm'];
            to_send=['POW ', level];
            if (j <= 3)
                fprintf(FSP2, to_send);
                if (begin==0)
                   fprintf(FSP2, 'OUTP ON'); 
                   begin=1;
                end
                pause(0.3);
            end
            % Provjeri postavljanje frekvencije
            to_send=['FREQUENCY ',num2str(frequenc(i)),' Hz'];
            fprintf(radi_pm_forward,to_send);
            n=fscanf(radi_pm_forward);
            n_correct=[n(1),n(2)];
            if strcmp(n_correct,'OK')
            else
                error('Failed to load frequency')
            end
            fprintf(radi_pm_forward,'FREQUENCY?');
            corr_freq_for=strsplit(fscanf(radi_pm_forward),' ');
            correct_freq_forward=str2double(corr_freq_for(1));
            fprintf(radi_pm_reflected,to_send);
            n=fscanf(radi_pm_reflected);
            n_correct=[n(1),n(2)];
            if strcmp(n_correct,'OK')
            else
                error('Failed to load frequency')
            end
            fprintf(radi_pm_reflected,'FREQUENCY?');
            corr_freq_ref=strsplit(fscanf(radi_pm_reflected),' ');
            correct_freq_reflected=str2double(corr_freq_ref(1));
            check = floor(frequenc(i));
            if (floor(correct_freq_forward)~=check)||(floor(correct_freq_reflected)~=check)
                 %error ('PM failed to load frequency');
            end
            % Pro�itaj snagu sa PM
            fprintf(radi_pm_forward,'POWER?');
            Power_forward = strsplit(fscanf(radi_pm_forward),' ');
            P_forward(countf,countp) = str2double(Power_forward(1))+40;
            fprintf(radi_pm_reflected,'POWER?');
            Power_reflected = strsplit(fscanf(radi_pm_reflected),' ');
            P_reflected(countf,countp) = str2double(Power_reflected(1))+40;
            % Pro�itaj napon sa Flukea/osciloskopa            
            if (connections.osc_connected==1)                
%                 %% old variant
%                 pause(0.5);
%                 fprintf(FSP2,'FREQ?');
%                 ff = str2double(fscanf(FSP2));
%                 %time = 10*(1/ff);
%                 time = 5*(1/ff);
%                 time_s = num2str(time);
%                 timebase = [':TIMebase:RANGe ',time_s];
%                 fprintf(agilent_osc, timebase);
%                 %fprintf(agilent_osc, ':DIGitize CHANnel1');
%                 fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
%                 vmax_s = fscanf(agilent_osc);
%                 vmax = str2double(vmax_s);
%                 %fprintf(agilent_osc, ':DIGitize CHANnel1');
%                 fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
%                 vmin_s = fscanf(agilent_osc);
%                 vmin = str2double(vmin_s);
                %% new
                fprintf(FSP2,'FREQ?');
                ff = str2double(fscanf(FSP2));
                time = 20*(1/ff);
                %time = 10*(1/ff);
                %time = 5*(1/ff);
                time_s = num2str(time);
                timebase = [':TIMebase:RANGe ',time_s];
                fprintf(agilent_osc, timebase);                
                vmin_s = [];
                vmax_s = [];
                while isempty(vmin_s) || isempty(vmax_s)
                    fprintf(agilent_osc, ':TRIGger:LEVel 5 V'); 
                    fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                    fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
                    vmax_s = fscanf(agilent_osc);
                    if isempty(vmax_s)
                        disp('empty string');
                    end                    
                    vmax = str2double(vmax_s);
                    %fprintf(agilent_osc, ':DIGitize CHANnel1');
                    fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
                    vmin_s = fscanf(agilent_osc);
                    if isempty(vmin_s)
                        disp('empty string');
                    end                      
                    vmin = str2double(vmin_s);
                end
                
                trigger_level = (vmax + vmin)/2;
                trigger_level_msg = [':TRIGger:LEVel ',num2str(trigger_level)];
                fprintf(agilent_osc, trigger_level_msg);                
                %fprintf(agilent_osc, ':TRIGger:SWEep NORMal');
                
                %fprintf(agilent_osc, ':TER?');
                %trig_status = str2num(fscanf(agilent_osc));
                %fprintf(agilent_osc, ':TER?');
                %trig_status = str2num(fscanf(agilent_osc));
                %if trig_status == 0
                    fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                %end
                
                vmin_s = [];
                vmax_s = [];
                num_sweeps = 10;
                for swindex = 1:num_sweeps
                    while isempty(vmin_s) || isempty(vmax_s)
                        pause(1);
                        fprintf(agilent_osc, ':MEASure:VMAX? CHANnel1');
                        vmax_s = fscanf(agilent_osc);
                        if isempty(vmax_s)
                            disp('empty string');
                            fprintf(agilent_osc, '*RST');
                            osc_default_setting;
                            fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                        end
                        vmax = str2double(vmax_s);

                        fprintf(agilent_osc, ':MEASure:VMIN? CHANnel1');
                        vmin_s = fscanf(agilent_osc);
                        if isempty(vmin_s)
                            disp('empty string');
                            fprintf(agilent_osc, '*RST');
                            osc_default_setting;
                            fprintf(agilent_osc, ':TRIGger:SWEep AUTO');
                        end                    
                        vmin = str2double(vmin_s);
                    end
                    vmin_sweep(swindex) = vmin;
                    vmax_sweep(swindex) = vmax;
                end
                vmin = min(vmin_sweep);
                vmax = max(vmax_sweep);
            else
                if (connections.fluke_connected==1)
                    fprintf(fluke, 'VAL?');
                    fmulti.fluke_voltage = fscanf(fluke);
                    vmax = str2double(fmulti.fluke_voltage);
                    vmin = vmax;
                end
            end
            if (vmax >= high_dpi)
                frequency_test(countf, countp) = 1;
                break;
            end
            if (vmin <= low_dpi)
                frequency_test(countf, countp) = -1;
                break;
            end
            countp=countp+1;
        end
        countf=countf+1;
    end
    fprintf(FSP2, 'OUTP OFF');
    % Izra�unaj p_transmitted
    P_forward_calc = 1e-3*10.^(P_forward./10);
    P_reflected_calc = 1e-3*10.^(P_reflected./10);
    P_transmitted_calc = P_forward_calc - P_reflected_calc;
    cf=1;
    for i=1:length(frequenc)
        cp=1;
        for j=p_min:p_step:p_max
            P_transmitted(cf,cp) = real(10*log10(P_transmitted_calc(cf,cp)/(1e-3)));
            if (frequency_test(cf,cp)~=0)
                P_trans(cf) = P_transmitted(cf,cp);
                P_forw(cf) = P_forward(cf,cp);
                P_reflec(cf) = P_reflected(cf,cp);
                break;
            else
                P_trans(cf) = P_transmitted(cf,cp);
                P_forw(cf) = P_forward(cf,cp);
                P_reflec(cf) = P_reflected(cf,cp);
            end
            cp=cp+1;
        end 
        cf=cf+1;
    end
    % Spremi i nacrtaj
    save(filename,'P_trans');
    save(filename,'frequenc', '-append');
    %save(filename,'P_forward','-append');
    save(filename,'P_forw','-append');
    save(filename,'P_reflec','-append');
    save(filename,'frequency_test','-append');
    %save(filename,'P_reflected','-append');
    %save(filename,'P_transmitted','-append');
    h = figure(1);
%     switch dpi_values.fspace
%         case 1
%             plot(frequenc, P_forw);
%         case 2
%             semilogx(frequenc, P_forw);
%     end
    fr = ['frequency, ',unit];
    xlabel(fr);
    ylabel('forward power, dBm');
    str=['DPI measurement (',dpi_values.fmin,' ',unit,' - ',dpi_values.fmax,unit,')'];
    title(str);
    %export_fig('DPI measurement.pdf');
    filename1 = sprintf('DPI measurement(%s %s - %s %s).pdf',dpi_values.fmin,unit,dpi_values.fmax,unit);
    print( h, '-append', '-dpdf', filename1 );
    
    % disconnect all
    if (connections.rfdc_connected==1)
        if strcmp('closed', FSP2.status)  
            msgbox('RF/DC source is disconnected ','Error','error');     
        else
            fprintf(FSP2,'OUTP OFF');
            fclose(FSP2);
            set(handles.rfdc_connection_status,'String','RF/DC Connection: off');
        end
        guidata(hObject, handles);
        if strcmp('open', FSP2.status)  
            msgbox('Disconnect before deleting the RF/DC object ','Error','error'); 
        else
            % Odspoji RF/DC
            delete(FSP2);
            clear FSP2;
            connections.rfdc_connected=0;
        end
    end
    if (connections.sa_connected==1)
        if strcmp('closed', FSP.status)  
            msgbox('Spectrum analyzer is disconnected ','Error','error');     
        else
            fclose(FSP);
            set(handles.connection_status,'String','SA Connection: off');
        end
        guidata(hObject, handles);
        if strcmp('open', FSP.status)  
            msgbox('Disconnect before deleting the SA object ','Error','error'); 
        else
            % Odspoji SA
            delete(FSP);
            clear FSP;
            connections.sa_connected=0;
        end
    end
    if (connections.pm_forward==1)
        if strcmp('closed', radi_pm_forward.status)  
            msgbox('Forward power meter is already disconnected ','Error','error');     
        else
            fclose(radi_pm_forward);
            % Odspoji PM-F
            delete(radi_pm_forward);
            clear radi_pm_forward;
            connections.pm_forward=0;
            set(handles.pm_forward_connection_status,'String','PM Forward Connection: off');
        end
    end
    if (connections.pm_reflected==1)
        if strcmp('closed', radi_pm_reflected.status)  
            msgbox('Reflected power meter is already disconnected ','Error','error');     
        else
            fclose(radi_pm_reflected);
            % Odspoji PM-REF
            delete(radi_pm_reflected);
            clear radi_pm_reflected;
            connections.pm_reflected=0;
            set(handles.pm_reflected_connection_status,'String','PM Reflected Connection: off');
        end
    end
    if (connections.fluke_connected==1)
        if strcmp('closed', fluke.status)  
            msgbox('Fluke multimeter is already disconnected ','Error','error');     
        else
            fclose(fluke);
        end
        guidata(hObject, handles);
        if strcmp('open', fluke.status)  
            msgbox('Disconnect before deleting the fluke object ','Error','error'); 
        else
            % Odspoji fluke
            delete(fluke);
            clear fluke;
            connections.fluke_connected=0;
            set(handles.fluke_connection_status,'String','Fluke Connection: off');
        end
    end
    if (connections.osc_connected==1)
        if strcmp('closed', agilent_osc.status)  
            msgbox('Agilent oscilloscope is already disconnected ','Error','error');     
        else
            fclose(agilent_osc);
        end
        guidata(hObject, handles);
        if strcmp('open', agilent_osc.status)  
            msgbox('Disconnect before deleting the Agilent oscilloscope object ','Error','error'); 
        else
            % Odspoji osciloskop
            delete(agilent_osc);
            clear agilent_osc;
            connections.osc_connected=0;
            set(handles.oscilloscope_connection_status,'String','Oscilloscope Connection: off');
        end
    end
    close(Guido);
    clear all;
    clear fun;
    clear functions;
end