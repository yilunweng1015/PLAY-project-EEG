%% set up file and folders
% establish working directory 
clc
play_dir;

highpass=0.1; %set high pass filter
lowpass=30; %set low pass filter
current_run = ''; %establish current run
epoch_baseline = -100.0 %epoch baseline
epoch_end = 1000.0; %epoch offset

% establish subject list
for s = [22] %edit for subject of interest (can run multiple at once)

    % get subject info, same name as subjects.m (function)
    [subject] = play_subjects(s);
    subject
    datasetname = [subject current_run] %create consistent naming scheme for subject dataset

%% Preprocessing steps
% Step 3: Create eventlist, apply binlist, extract epochs, and artifact rejection
    EEG  = pop_creabasiceventlist( EEG , 'AlphanumericCleaning', 'on', 'BoundaryNumeric', { -99 }, 'BoundaryString', { 'boundary' }, 'Eventlist', [txtdir subject filesep 'eventlist.txt'] ); 
    EEG = eeg_checkset( EEG );
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET,'gui','off'); 
    EEG  = pop_binlister( EEG , 'BDF', [txtdir 'play_binlist_030520.txt'], 'ExportEL', [txtdir subject filesep 'binlist.txt'],'ImportEL', [txtdir subject filesep 'eventlist.txt'], 'IndexEL',  1, 'SendEL2', 'EEG&Text', 'Voutput', 'EEG' );
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = pop_epochbin( EEG , [epoch_baseline  epoch_end],  'pre'); 
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG  = pop_artmwppth( EEG , 'Channel',  1:32, 'Flag',  1, 'Threshold',  100, 'Twindow', [epoch_baseline epoch_end], 'Windowsize',  200, 'Windowstep',  100 ); 
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET ,'savenew',[workdir subject filesep subject '_epo_ar.set'],'gui','off'); 
    EEG = pop_summary_AR_eeg_detection(EEG, [workdir subject filesep 'AR_summary_' subject '_epoch_ar.txt']); 
    [EEG, MPD] = getardetection(EEG, 1);
end
% 
% %% Create ERP from erp.set file
% for s = [2] %edit for subject of interest (can run multiple at once)
%     
%     % get subject info, same name as subjects.m (function)
%     [subject] = play_subjects(s);
%     subject
% 
%     %% create erp set
%     EEG = pop_loadset('filename',[subject '_epoch_ar.set'],'filepath',[workdir subject filesep]);
%     [ALLEEG, EEG, CURRENTSET] = eeg_store(ALLEEG, EEG, 0 );
%     ERP = pop_averager(ALLEEG , 'Criterion', 'good', 'DSindex',1, 'ExcludeBoundary', 'on', 'SEM', 'on' );
%     ERP = pop_savemyerp(ERP, 'erpname', subject, 'filename', [subject '.erp'], 'filepath', [erpdir subject filesep], 'Warning', 'on');   
% end

% %Down filter indvidual erp date and run bin/channel operations
% for s = [1:16 18:31] %edit for subject of interest (can run multiple at once)
%     [subject] = blast_subjects(s);
%     subject
%     
%     datasetname= [subject '_chanloc.erp']
%     outputname= [subject '_GND.erp']
%     
%     ERP = pop_loaderp( 'filename', datasetname, 'filepath',[erpdir subject filesep]);
%     ERP = pop_filterp( ERP,  1:22 , 'Cutoff',  30, 'Design', 'butter', 'Filter', 'lowpass', 'Order',  2 );
%     ERP = pop_binoperator( ERP, {  'b16 = (b1+b2)/2 label all standards',  'b17 = (b4+b5+b7+b8)/4 label all deviants',...
%       'b18 = (b4+b5)/2 label voice deviant ',  'b19 = (b7+b8)/2 label syllable deviant',  'b20 = (b5+b7)/2 label high freq deviant',...
%       'b21 = (b4+b8)/2 label low freq deviant', 'b22 = (b14+b15)/2 label all long',  'b23 = (b10+b11)/2 label all short'});
%     ERP = pop_erpchanoperator( ERP, {  'ch23 = (ch1+ch3+ch4+ch8+ch9+ch13+ch15+ch16+ch20)/9 label left',  'ch24 = (ch2+ch6+ch7+ch11+ch12+ch14+ch18+ch19+ch21)/9 label right',  'ch25 = (ch1+ch2+ch3+ch4+ch5+ch6+ch7)/7 label frontal', 'ch26 = (ch8+ch9+ch10+ch11+ch12+ch13+ch14)/7 label central', 'ch27 = (ch15+ch16+ch17+ch18+ch19+ch20+ch21+ch22)/8 label parietal', 'ch28 = (ch1+ch3+ch4)/3 label left frontal', 'ch29 = (ch2+ch6+ch7)/3 label right frontal', 'ch30 = (ch8+ch9+ch13)/3 label left central', 'ch31 = (ch11+ch12+ch14)/3 label right central', 'ch32 = (ch15+ch16+ch20)/3 label left parietal','ch33 = (ch18+ch19+ch21)/3 label right parietal'} ,...
%      'ErrorMsg', 'popup', 'KeepLocations',  0, 'Warning', 'on' );
%     ERP = pop_savemyerp(ERP, 'erpname', datasetname, 'filename', outputname, 'filepath',[erpdir subject filesep]);
%  end
%      
% %% Average individual ERPs together into group
% grandavg_filename= 'grand_avg_N27.erp'
% txtfile = 'load_erpset_n27.txt' %all individual subject erp files with path to file
%     ERP = pop_gaverager( [anadir txtfile] , 'ExcludeNullBin', 'on', 'SEM', 'on' );
%     ERP = pop_savemyerp(ERP,...
%  'erpname', 'grandavg_erp', 'filename', [grandavg_filename], 'filepath', [erpdir], 'Warning',...
%  'on');