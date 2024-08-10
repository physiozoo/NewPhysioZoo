%%
function GUI = set_fiducials_checkboxs(GUI, Integration)

if strcmp(Integration, 'ECG')
    
    GUI.P_checkbox.String = 'P-Peaks';
    GUI.Q_checkbox.String = 'Q-Peaks (QRS on)';
    GUI.R_checkbox.String = 'R-Peaks';
    GUI.S_checkbox.String = 'S-Peaks (QRS off)';
    GUI.T_checkbox.String = 'T-Peaks';
    
    GUI.P_checkbox.Tag = 'PPeaksCb';
    GUI.Q_checkbox.Tag = 'QPeaksCb';
    GUI.R_checkbox.Tag = 'RPeaksCb';
    GUI.S_checkbox.Tag = 'SPeaksCb';
    GUI.T_checkbox.Tag = 'TPeaksCb';
    
    GUI.P_checkbox.Value = 0;
    GUI.Q_checkbox.Value = 0;
    GUI.R_checkbox.Value = 1;
    GUI.S_checkbox.Value = 0;
    GUI.T_checkbox.Value = 0;
    
    GUI.P_checkbox.Enable = 'on';
    GUI.Q_checkbox.Enable = 'on';
    GUI.R_checkbox.Enable = 'on';
    GUI.S_checkbox.Enable = 'on';
    GUI.T_checkbox.Enable = 'on';
    
    GUI.T_checkbox.Visible = 'on';
    
    GUI.P_checkbox.ForegroundColor = [0.9290, 0.6940, 0.1250];
    GUI.Q_checkbox.ForegroundColor = [0.4940, 0.1840, 0.5560];
    GUI.R_checkbox.ForegroundColor = [1 0 0];
    GUI.S_checkbox.ForegroundColor = [0.8500, 0.3250, 0.0980];
    GUI.T_checkbox.ForegroundColor = [0.6350, 0.0780, 0.1840];
else                
    GUI.P_checkbox.String = 'sp';
    GUI.Q_checkbox.String = 'on';
    GUI.R_checkbox.String = 'dn';
    GUI.S_checkbox.String = 'dp';
    GUI.T_checkbox.String = '';
    
    GUI.P_checkbox.Tag = 'RPeaksCb';
    GUI.Q_checkbox.Tag = 'QPeaksCb';    
    GUI.R_checkbox.Tag = 'PPeaksCb';    
    GUI.S_checkbox.Tag = 'SPeaksCb';
    GUI.T_checkbox.Tag = 'TPeaksCb';
    
    GUI.P_checkbox.Value = 1;
    GUI.R_checkbox.Value = 0;
    GUI.R_checkbox.Value = 0;
    GUI.S_checkbox.Value = 0;
    GUI.T_checkbox.Value = 0;
        
    GUI.P_checkbox.Enable = 'on';
    GUI.Q_checkbox.Enable = 'on';
    GUI.R_checkbox.Enable = 'on';
    GUI.S_checkbox.Enable = 'on';
    GUI.T_checkbox.Enable = 'off';
        
    GUI.T_checkbox.Visible = 'off';
    
    GUI.P_checkbox.ForegroundColor = 'r';
    GUI.Q_checkbox.ForegroundColor = 'b';
    GUI.R_checkbox.ForegroundColor = 'g';
    GUI.S_checkbox.ForegroundColor = 'm';
    GUI.T_checkbox.ForegroundColor = 'w';
end