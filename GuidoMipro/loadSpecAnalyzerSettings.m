function [ handles ] = loadSpecAnalyzerSettings( handles )
global settings;
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
end

