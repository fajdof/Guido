function [ ] = executeSmiqSettings( )
global FSP2;
global FSP;
global settings_rf;
global connections;
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

end

