function [] = mhrv_init( varargin )
%% MHRV_INIT Initialize MATLAB environment of the mhrv tools.
% Run this script before using the toolkit.
% It will initialize the matlab path and environment for the mhrv tools, and also download the
% PhysioNet tools if they are not found on this system.
% To set custom user-specific options (e.g. PhysioNet tools location), edit the file
% cfg/mhrv_config.m before running this.
% By default this script won't do anything if it was run previously during the same MATLAB session.
%
%   Usage:
%       mhrv_init [-f/--force] [-c/--close]
%
%   * The --force/-f option forces running of this script again, even if it was run before.
%   * The --close/-c option causes the script to close all open figures.

%% Parse input
should_force = false;
should_close = false;
for i = 1:length(varargin)
    curr_arg = varargin{i};
    if strcmp(curr_arg, '-f') || strcmp(curr_arg, '--force') 
        should_force = true;
    elseif strcmp(curr_arg, '-c') || strcmp(curr_arg, '--close')
        should_close = true;
    end
end

%% Check if already initialized

% Base toolbox dir is the directory containing this script
basepath_ = fileparts(mfilename('fullpath'));

% The mhrv_basepath global variable holds the base toolbox directory. If it's empty, then this is
% the first time this script is run.
global mhrv_basepath;

% If the toolbox was not previously initialized, OR it was previously initialized in a different
% directory, always run. Otherwize, only run if should_force is true.
if ~isempty(mhrv_basepath)
    if ~strcmp(mhrv_basepath, basepath_)
        fprintf('Initializing mhrv toolbox in new basepath %s...\n', basepath_);
    elseif should_force
        fprintf('Initializing mhrv toolbox in %s (--force)...\n', basepath_);
    else
        % Already initialized in the current basepath and should_force is false
        return;
    end
else
    fprintf('Initializing mhrv toolbox in %s...\n', basepath_);
end

% Save the root toolbox dir as a global variable
mhrv_basepath = basepath_;

%% Reset workspaces

% Remove mhrv-realted persistent variables
clear get_wfdb_tool_path;

if should_close
    close all;
end

%% Set up matlab path

% Find source and dependencies directories
lib_dir_ = [basepath_ filesep 'lib'];
cfg_dir_ = [basepath_ filesep 'cfg'];
bin_dir_ = [basepath_ filesep 'bin'];

% Add them to matlab's path including subfolders
if ~isdeployed
    addpath(basepath_);
    addpath(genpath(lib_dir_));
    addpath(genpath(cfg_dir_));
end

%% Load default toolbox parameters
mhrv.defaults.mhrv_load_defaults('--clear');
wfdb_path_ = mhrv.defaults.mhrv_get_default('mhrv.paths.wfdb_path', 'value');

%% WFDB paths
% Check if user specified a custom wfdb path. If not, use mhrv root folder.
if (isempty(wfdb_path_))
    wfdb_search_path_ = basepath_;
else
    wfdb_search_path_ = wfdb_path_;
end

% Make sure WFDB tools are installed. If not, download them now.
should_download = false;
try
    wfdb_config_bin_ = mhrv.wfdb.get_wfdb_tool_path('wfdb-config', wfdb_search_path_);
catch
    warning('WFDB binaries not detected, attempting to download...');
    should_download = true;
end

if should_download
    try
        mhrv.wfdb.download_wfdb(bin_dir_);
    catch e
        error('Failed to download: %s', e.message);
    end
    wfdb_config_bin_ = mhrv.wfdb.get_wfdb_tool_path('wfdb-config', wfdb_search_path_);
end

% Check WFDB tools version
supported_version_ = '10.5.24';
[~, wfdb_version_] = jsystem([wfdb_config_bin_ ' --version']);
ver_cmp_ = mhrv.util.vercmp(wfdb_version_, supported_version_);
if ver_cmp_ < 0
    warning('Detected WFDB version (%s) is older than the tested version, please use %s or newer', wfdb_version_, supported_version_);
elseif ver_cmp_ > 0
    disp('Notice: Detected WFDB version (%s) is newer than the tested version (%s)', wfdb_version_, supported_version_);
end

end
