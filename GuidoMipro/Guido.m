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

% Last Modified by GUIDE v2.5 08-Jun-2015 15:18:53

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
% FLUKE adress 23!
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Guido (see VARARGIN)

% Choose default command line output for vers1
handles.output = hObject;
handles = DisableButtons(handles);
handles = SetOpeningPanel(handles);
handles = setDefaultValues(handles);

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
% hObject    handle to G_code (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
generateGcode();
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
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
    set(handles.nfs_panel,'Visible','off');
end

% --------------------------------------------------------------------
function near_field_scanner_Callback(hObject, eventdata, handles)
% hObject    handle to near_field_scanner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open_panel=get(handles.nfs_panel,'Visible');
if strcmp('off', open_panel)
    set(handles.sa_panel,'Visible','off');
    set(handles.rfdc,'Visible','off');
    set(handles.uipanel12,'Visible','off');
    set(handles.uipanel14,'Visible','off');
    set(handles.uipanel15,'Visible','off');
    set(handles.power_meters,'Visible','off');
    set(handles.emc_test,'Visible','off');
    set(handles.fluke_multimeter,'Visible','off');
    set(handles.oscilloscope,'Visible','off');
    set(handles.nfs_panel,'Visible','on');
end

% --- Executes on button press in getdata_button.
function getdata_button_Callback(hObject, eventdata, handles)
% hObject    handle to getdata_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
signalGenNFSTest();
guidata(hObject, handles);


function z_position_Callback(hObject, eventdata, handles)
global g_positions;
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
global g_positions;
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
global g_positions;
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
global g_positions;
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
global g_positions;
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
% hObject    handle to save_to_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uiputfile;
save(filename,'settings');


% --------------------------------------------------------------------
function load_settings_Callback(hObject, eventdata, handles)
global settings;
% hObject    handle to load_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filename = uigetfile;
settings = load(filename);
settings = settings.settings;
handles = loadSpecAnalyzerSettings(handles);
guidata(hObject, handles);


% --- Executes on button press in execute_settings.
function execute_settings_Callback(hObject, eventdata, handles)
% hObject    handle to execute_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = executeSpecAnalyzerSettings(handles);
guidata(hObject, handles);



function enter_gpib_adress_Callback(hObject, eventdata, handles)
global settings;
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
% hObject    handle to draw_graph_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawNFSTestGraph();
guidata(hObject, handles);


% --- Executes on button press in draw_field_button.
function draw_field_button_Callback(hObject, eventdata, handles)
% hObject    handle to draw_field_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
drawNFSTestFieldGraph();
guidata(hObject, handles);



function set_frequency_Callback(hObject, eventdata, handles)
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
global NFS;
% hObject    handle to right_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.x=calibrations.x+1;
% posalji naredbu za pomak u desno
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);
% pomakni
first = uint8(3);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);


% --- Executes on button press in left_arrow.
function left_arrow_Callback(hObject, eventdata, handles)
global calibrations;
global NFS;
% hObject    handle to left_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.x=calibrations.x-1;
% posalji naredbu za pomak u lijevo
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);
% pomakni
first = uint8(2);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);



% --- Executes on button press in up_arrow.
function up_arrow_Callback(hObject, eventdata, handles)
global calibrations;
global NFS;
% hObject    handle to up_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.y=calibrations.y+1;
% posalji naredbu za pomak prema gore
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);
% pomakni
first = uint8(4);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);


% --- Executes on button press in down_arrow.
function down_arrow_Callback(hObject, eventdata, handles)
global calibrations;
global NFS;
% hObject    handle to down_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
calibrations.y=calibrations.y-1;
% posalji naredbu za pomak prema dolje
string=strcat(num2str(calibrations.x),',',num2str(calibrations.y));
set(handles.ref_point_coor, 'String', string);
% pomakni
first = uint8(5);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);



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
% hObject    handle to Execute_rfdc_settings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% FREKVENCIJA
executeSmiqSettings();
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
global connections;
% hObject    handle to start_dpi_meas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==0)||(connections.pm_forward==0)||(connections.pm_reflected==0)||((connections.fluke_connected==0)&&(connections.osc_connected==0))
    msgbox('Connect to instruments before measuring!','Warning','warn')
else
    handles = startDPIMeasurement(handles);
end
guidata(hObject, handles);



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
% hObject    handle to disconnect_all (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% disconnect all
handles = disconnectAllDevices(handles);
guidata(hObject,handles);


% --- Executes on button press in measure_quit.
function measure_quit_Callback(hObject, eventdata, handles)
% hObject    handle to measure_quit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global connections;
% hObject    handle to start_dpi_meas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (connections.rfdc_connected==0)||(connections.pm_forward==0)||(connections.pm_reflected==0)||((connections.fluke_connected==0)&&(connections.osc_connected==0))
    msgbox('Connect to instruments before measuring!','Warning','warn')
else
    handles = startDPIMeasurement(handles);
    % disconnect all
    handles = disconnectAllDevices(handles);
    guidata(hObject,handles);
    close(Guido);
    clear all;
    clear fun;
    clear functions;
end


% --- Executes on button press in get_data_nfs.
function get_data_nfs_Callback(hObject, eventdata, handles)
% hObject    handle to get_data_nfs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = startNFSMeasurement(handles);
guidata(hObject, handles);



function ref_height_coor_Callback(hObject, eventdata, handles)
global calibrations;
% hObject    handle to ref_height_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ref_height_coor as text
%        str2double(get(hObject,'String')) returns contents of ref_height_coor as a double
string = get(handles.ref_height_coor,'String');
calibrations.z = str2double(string);


% --- Executes during object creation, after setting all properties.
function ref_height_coor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ref_height_coor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in down_height_arrow.
function down_height_arrow_Callback(hObject, eventdata, handles)
% hObject    handle to down_height_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global calibrations;
global NFS;
calibrations.z=calibrations.z-1;
set(handles.ref_height_coor, 'String', calibrations.z);
% pomakni
first = uint8(6);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);


% --- Executes on button press in up_height_arrow.
function up_height_arrow_Callback(hObject, eventdata, handles)
% hObject    handle to up_height_arrow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global calibrations;
global NFS;
calibrations.z=calibrations.z+1;
set(handles.ref_height_coor, 'String', calibrations.z);
% pomakni
first = uint8(7);
fwrite(NFS,first);
second = uint8(0);
third = uint8(200);
fwrite(NFS,second);
fwrite(NFS,third);