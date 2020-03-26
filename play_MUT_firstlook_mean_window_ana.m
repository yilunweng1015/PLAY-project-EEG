%% Written by Julie M. Schneider 10/4/2018,. Modified by Yi-Lun Weng 02/10/2020
% All resources can be found at: https://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox:_within-subject_t-tests

%% Creating GND Variables for Mass Univariate Analyses
%If you already have a GND file:
load play_all_firstlook.GND -MAT

%%If chanlocs are wrong, load GND_chanlocs.mat
%GND.chanlocs = GND_chanlocs
%%To create a GND variable:
%GND=erplab2GND('gui')

%Establish BIN differences of interest
GND=bin_dif(GND,26,27,'Inst vs Mod Firstlook');%bin 28
GND=bin_dif(GND,25,26,'Equi vs Inst Firstlook');%bin 29
GND=bin_dif(GND,25,27,'Equi vs Mod Firstlook');%bin 30

%% Mean time window analysis
%Instead of performing t-tests at every single time point, it is also possible to perform t-test on mean difference wave amplitude in a particular time window.
%cluster based permutation test
GND=clustGND(GND,28,'time_wind',[0 -100],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[0 -100],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[0 -100],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');

GND=clustGND(GND,28,'time_wind',[-100 -200],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-100 -200],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-100 -200],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');

GND=clustGND(GND,28,'time_wind',[-200 -300],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-200 -300],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-200 -300],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');

GND=clustGND(GND,28,'time_wind',[-300 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-300 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-300 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');

GND=clustGND(GND,28,'time_wind',[0 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[0 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[0 -400],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes', 'save_GND', 'no');


%tmax permutation test (Permutation)
GND=tmaxGND(GND,28,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');



%tfdr test
GND=tfdrGND(GND,28,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,29,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,30,'time_wind',[0 -100],'mean_wind','yes', 'save_GND', 'no');

GND=tfdrGND(GND,28,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,29,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,30,'time_wind',[-100 -200],'mean_wind','yes', 'save_GND', 'no');

GND=tfdrGND(GND,28,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,29,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,30,'time_wind',[-200 -300],'mean_wind','yes', 'save_GND', 'no');

GND=tfdrGND(GND,28,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,29,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,30,'time_wind',[-300 -400],'mean_wind','yes', 'save_GND', 'no');

GND=tfdrGND(GND,28,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,29,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');
GND=tfdrGND(GND,30,'time_wind',[0 -400],'mean_wind','yes', 'save_GND', 'no');

