function [ handles ] = startDPIMeasurement( handles )
global fluke;
global fmulti;
global agilent_osc;
global dpi_values;
global radi_pm_forward;
global radi_pm_reflected;
global FSP2;
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
            % Proèitaj snagu sa PM
            fprintf(radi_pm_forward,'POWER?');
            Power_forward = strsplit(fscanf(radi_pm_forward),' ');
            P_forward(countf,countp) = str2double(Power_forward(1))+40;
            fprintf(radi_pm_reflected,'POWER?');
            Power_reflected = strsplit(fscanf(radi_pm_reflected),' ');
            P_reflected(countf,countp) = str2double(Power_reflected(1))+40;
            % Proèitaj napon sa Flukea/osciloskopa            
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
    % Izraèunaj p_transmitted
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

