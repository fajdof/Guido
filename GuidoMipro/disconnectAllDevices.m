function [ handles ] = disconnectAllDevices( handles )
global radi_pm_forward;
global radi_pm_reflected;
global FSP2;
global connections;
global fluke;
global agilent_osc;
global FSP;
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

end

