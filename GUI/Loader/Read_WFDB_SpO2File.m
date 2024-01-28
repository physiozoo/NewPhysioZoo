function [UniqueMap, header,data] = Read_WFDB_SpO2File(header_info,UniqueMap,waitbar_handle,FileName,ext)
if (isempty(header_info.N_channels))                                                                                                            % return if have no signals
    UniqueMap('MSG') = 'msg_10';
    UniqueMap('IsHeader') = false;
    header = [];
    data = [];
    return
end
for iCh = 1 :  length(header_info.channel_info)
    Description = strsplit(header_info.channel_info{iCh}.description,'(');                     % get mammal and integration level from description
    try
        Channel_Type = strsplit(Description{2},')');                     % get mammal and integration level from description
        Channel.name = Description{1};
        Channel.type = Channel_Type{1};
        Channel_Enable = strsplit(Channel.type,',');
        %         Channel.enable = Channel_Enable{2};
        switch Channel_Enable{2}
            case 'enable'
                Channel.enable = true;
            otherwise
                Channel.enable = false;
        end
        Channel.type = Channel_Enable{1};
    catch
        Channel.type = 'select';
        Channel.name = 'data';
        Channel.enable = true;
    end
    %     Channel.enable = 'yes';
    try
        Channel.unit = header_info.channel_info{iCh}.units;
    catch
        Channel.unit = 'select';
    end
    Channels{iCh} = Channel;
end
try
    comment = header_info.comments{1};
    comment = strsplit(comment,':');
    header.Integration_level = comment{3};
    comment = strsplit(comment{2},',');
    header.Mammal = comment{1};
catch
    
end

%% -----------  Read data from WFDB file ------------------------
[tm, sig, Fs] = mhrv.wfdb.rdsamp(FileName, 1:header_info.N_channels, 'header_info', header_info);
data.data = [tm,sig];

%% --------------------Build Channels Information for Loader ---------------------------------------------
if ~isempty(tm)
    tCh = 1;
    header.Channels{tCh}.type = 'time';
    header.Channels{tCh}.unit = 'sec';
    header.Channels{tCh}.enable = 'yes';
    header.Channels{tCh}.name = 'time';
    header.Channels = [header.Channels Channels];
else
    header.Channels = Channels;
end
UniqueMap('IsHeader') = true;
header.Fs = Fs;