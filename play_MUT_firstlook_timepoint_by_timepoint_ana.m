%% Written by Julie M. Schneider 10/4/2018,. Modified by Yi-Lun Weng 02/10/2020
% All resources can be found at: https://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox:_within-subject_t-tests

%% Creating GND Variables for Mass Univariate Analyses
%If you already have a GND file:
load play_all_firstlook.GND -MAT

%%If chanlocs are wrong, load GND_chanlocs.mat
%GND.chanlocs = GND_chanlocs
%%To create a GND variable:
%GND=erplab2GND('gui')


%% Time point by time point analysis
%Establish BIN differences of interest
GND=bin_dif(GND,26,27,'Inst vs Mod Firstlook');%bin 28
GND=bin_dif(GND,25,26,'Equi vs Inst Firstlook');%bin 29
GND=bin_dif(GND,25,27,'Equi vs Mod Firstlook');%bin 30

%%cluster mass permutatoin test (Cluster)
%chan_hood relates to neighborhood density (computed as radius * max
%distance in idealized coordinates = max distance in units cm) .61
%corresponds to a 56 cm adult head
%GND=clustGND(GND,30,'time_wind',[0 -100],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,28,'time_wind',[0 -100],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[0 -100],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[0 -100],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');


GND=clustGND(GND,28,'time_wind',[-100 -200],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-100 -200],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-100 -200],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');


GND=clustGND(GND,28,'time_wind',[-200 -300],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-200 -300],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-200 -300],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');


GND=clustGND(GND,28,'time_wind',[-300 -400],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,29,'time_wind',[-300 -400],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');
GND=clustGND(GND,30,'time_wind',[-300 -400],'chan_hood',.61,'alpha',.05, 'save_GND', 'no');


%%tmax permutation test (Permutation) 
%To determine when and where the ERPs to standards and deviants differ, we will perform a permutation test based on the one-sample/repeated measures t-statistic using every time point at every electrode from 0 to 500 ms post-stimulus, controlling for the FWER 
GND=tmaxGND(GND,28,'time_wind',[0 -100], 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[0 -100], 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[0 -100], 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-100 -200], 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-100 -200], 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-100 -200], 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-200 -300], 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-200 -300], 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-200 -300], 'save_GND', 'no');

GND=tmaxGND(GND,28,'time_wind',[-300 -400], 'save_GND', 'no');
GND=tmaxGND(GND,29,'time_wind',[-300 -400], 'save_GND', 'no');
GND=tmaxGND(GND,30,'time_wind',[-300 -400], 'save_GND', 'no');


%%t-test with control of the false discovery rate (FDR)
GND=tfdrGND(GND,28,'method','by','time_wind',[0 -100], 'save_GND', 'no');
GND=tfdrGND(GND,29,'method','by','time_wind',[0 -100], 'save_GND', 'no');
GND=tfdrGND(GND,30,'method','by','time_wind',[0 -100], 'save_GND', 'no');

GND=tfdrGND(GND,28,'method','by','time_wind',[-100 -200], 'save_GND', 'no');
GND=tfdrGND(GND,29,'method','by','time_wind',[-100 -200], 'save_GND', 'no');
GND=tfdrGND(GND,30,'method','by','time_wind',[-100 -200], 'save_GND', 'no');

GND=tfdrGND(GND,28,'method','by','time_wind',[-200 -300], 'save_GND', 'no');
GND=tfdrGND(GND,29,'method','by','time_wind',[-200 -300], 'save_GND', 'no');
GND=tfdrGND(GND,30,'method','by','time_wind',[-200 -300], 'save_GND', 'no');

GND=tfdrGND(GND,28,'method','by','time_wind',[-300 -400], 'save_GND', 'no');
GND=tfdrGND(GND,29,'method','by','time_wind',[-300 -400], 'save_GND', 'no');
GND=tfdrGND(GND,30,'method','by','time_wind',[-300 -400], 'save_GND', 'no');

% %To plot these with a temperature scale to represent graded degree of
% %significance. The number corresponds to the raster plot.
% sig_raster(GND,GND=clustGND(GND,25,'time_wind',[0 250],'chan_hood',.61,'thresh_p',.05);
%   3,'use_color','rgb');

