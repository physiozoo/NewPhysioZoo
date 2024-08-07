%%
function derivatives_path = PPG_derivative(ppg_file_name, config_file_name)

%% Path of executable file
derivatives_path = '';
exe_file_path = fileparts(mfilename('fullpath'));
executable_file = [exe_file_path filesep 'PPG' filesep 'pyPPG.exe'];

try    
    try
        config_struct = ReadYaml(config_file_name);
        Fs = load(ppg_file_name, 'Fs');
    catch e
        rethrow(e);
    end
        
    %% Input parameters
    in.data_path = ppg_file_name;
    in.savedata = 1;
    in.savingfolder = [tempdir, 'PPG_temp_dir'];
    in.savingformat = 'mat';
    in.savefig = 0;
    in.show_fig = 0;
    in.print_flag = 0;
    in.fs = Fs.Fs;
    in.filtering = config_struct.ppg_filt_enable.value;
    in.fL = config_struct.lcf_ppg.value + 0.0000001; %0.5000001;
    in.fH = config_struct.hcf_ppg.value; %12;
    in.order = config_struct.order.value; %4;
       
    in.savingformat = 'none';
    in.process_type = 'only_sig';
    in.check_ppg_len = 1;
    
    in.data_path = strrep(in.data_path, '\', '/');
    in.savingfolder = strrep(in.savingfolder ,'\', '/');
    executable_file = strrep(executable_file ,'\', '/');
    %% EXTRACT FILTERED PPG, VPG, APG, JPG
        
    func_args = zip_args(fieldnames(in), struct2cell(in));
    command = ['"' executable_file '" "' ,'{\"function\":\"ppg_example\",\"args\":',func_args,'}'];
    
    tic
    [status, result, error] = jsystem(command);
    toc
    
    if status == 0
        derivative_file_names = jsondecode(result);
        if ~isempty(derivative_file_names) && isfield(derivative_file_names, 'data_struct_mat')
            derivative_path = derivative_file_names.data_struct_mat;
            if exist(derivative_path, 'file')
                derivatives_path = derivative_path;
%                 a = load(derivative_path);
%                 if isfield(a, 'PPG_fiducials')
%                     fiducials_table = struct2table(a.PPG_fiducials);
%                 end
            else
                disp(['PPG_derivative error: ', 'No derivative file', '\n', result]);
                ME = MException('PPG_derivative:derivative', 'No derivative file');
                throw(ME);
            end
        end
    else
        disp(['PPG_derivative error: ', error, '\n', result]);
        ME = MException('PPG_derivative:jsystem', error);
        throw(ME);
    end        
catch e
    rethrow(e);
end