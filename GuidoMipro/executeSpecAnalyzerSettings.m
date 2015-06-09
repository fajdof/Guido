function [ handles ] = executeSpecAnalyzerSettings( handles )
global settings;
global FSP;
switch settings.sa.peak
    case 1
        fprintf(FSP, 'DET APE');
    case 2 
        fprintf(FSP, 'DET QPE');
    case 3
        fprintf(FSP, 'DET AVER');
    otherwise
        fprintf(FSP, 'DET AVER');
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
end

