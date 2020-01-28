%% Written by Julie M. Schneider 10/4/2018, modified by Yi-Lun Weng 12/13/2019
% All resources can be found at: https://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox:_within-subject_t-tests

%% Creating GND Variables for Mass Univariate Analyses
%If you already have a GND file:
load play_MUT_N25.GND -MAT

%If chanlocs are wrong, load GND_chanlocs.mat
%GND.chanlocs = GND_chanlocs

%To create a GND variable:
GND=erplab2GND('gui')

%Establish BIN differences of interest
GND=bin_dif(GND,27,26,'Verb time window mod-bias condition');%38
GND=bin_dif(GND,35,36,'Verb time window inst-bias condition');%39
GND=bin_dif(GND,35,26,'Verb time window equi-bias condition');%40

%Visualize differences (the numbers pertain to our new bin numbers)
gui_erp(GND,'bin',35);

%% Time point by time point analysis
%%tmax permutation test (Permutation) 
%To determine when and where the ERPs to standards and deviants differ, we will perform a permutation test based on the one-sample/repeated measures t-statistic using every time point at every electrode from 0 to 500 ms post-stimulus, controlling for the FWER 
GND=tmaxGND(GND,43,'time_wind',[0 600]);
GND=tmaxGND(GND,27,'time_wind',[50 300],'output_file','sdev_timeperm.txt');

%%t-test with control of the false discovery rate (FDR)
GND=tfdrGND(GND,20,'method','by','time_wind',[0 250]);
GND=tfdrGND(GND,21,'method','by','time_wind',[0 500],'output_file','sdev_fdr.txt');

%%cluster mass permutatoin test (Cluster)
%chan_hood relates to neighborhood density (computed as radius * max
%distance in idealized coordinates = max distance in units cm) .61
%corresponds to a 56 cm adult head
GND=clustGND(GND,39,'time_wind',[0 600],'chan_hood',.61,'thresh_p',.05);
GND=clustGND(GND,40,'time_wind',[0 600],'chan_hood',.61,'alpha',.05);

%To plot these with a temperature scale to represent graded degree of
%significance. The number corresponds to the raster plot.
sig_raster(GND,GND=clustGND(GND,25,'time_wind',[0 250],'chan_hood',.61,'thresh_p',.05);
  3,'use_color','rgb');

%% Mean time window analysis
%%tmax permutation test (Permutation)
%Instead of performing t-tests at every single time point, it is also possible to perform t-test on mean difference wave amplitude in a particular time window.
GND=tmaxGND(GND,20,'time_wind',[0 200],'mean_wind','yes');

%%cluster based permutation test
GND=clustGND(GND,20,'time_wind',[275 325],'chan_hood',.61,'thresh_p',.05,'mean_wind','yes');

%% Plotting fun tricks
%To reproduce figures without conducting permutation again:
sig_raster(GND,1);
gui_erp(GND,'t_test',1);

%to save raster image
print -f1 -depsc vdevlow_raster