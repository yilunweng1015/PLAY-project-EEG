%% set up file and folders
% establish working directory 
clc
play_dir;

     
%% Average individual ERPs together into group
grandavg_filename= 'play_all_N25.erp'
txtfile = 'load_erpset_n25.txt' %all individual subject erp files with path to file
    ERP = pop_gaverager( [anadir txtfile] , 'ExcludeNullBin', 'on', 'SEM', 'on' );
    ERP = pop_savemyerp(ERP,...
 'erpname', 'grandavg_erp', 'filename', [grandavg_filename], 'filepath', [erpdir], 'Warning',...
 'on');