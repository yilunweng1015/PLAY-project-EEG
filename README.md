## EEG/ERP Data analysis (03/24/2020 updated by Yi-Lun Weng)
  

## **Overview** 

1. EEG preprocessing: EEG raw data will be filtered, re-referenced, component-identified, component-removed, epoched and binned.
   Then ERP data will be computed in the end.  

    => Input data:    play_a_xxx.set
    => MATLAB script: 1.play_filter_ref.m & 2.play_ica.m & 3.play_ev_bin_epo.m & 4.play_erp.m
    => Output data:   play_a_xxx.erp
   
2. Performing the mass univariate analyses (factorial ANOVA) on ERP.   

    => Input data:    play_all_firstlook.GND
    => MATLAB script: play_MUT_firstlook_factorial_anova.m
    => Output data:   play_MUT_firstlook_factorial_anova_result.csv

3. Performing the mass univariate analyses (mean window) on ERP.   

    => Input data:    play_all_firstlook.GND
    => MATLAB script: play_MUT_firstlook_mean_window_ana.m
    => Output data:   play_MUT_firstlook_mean_window_result.csv

3. Performing the mass univariate analyses (time point by time point) on ERP.   

    => Input data:    play_all_firstlook.GND
    => MATLAB script: play_MUT_firstlook_timepoint_by_timepoint_ana.m
    => Output data:   play_MUT_firstlook_timepoint_by_timepoint_result.csv

#### ***All the data files and scripts are saved on the NAS: \projects\play\analysis\eeg***

## **1. EEG preprocessing**  

**(1) Filter and reference the EEG raw data.**   
    Use the high pass (0.1) and low pass (30) variables you have set, it filters out the data that is outside of the low pass-high pass range.   
    It also references the data to the TP9 and TP10 electrodes.  

  If this part is successfully run, you should see the file named as 'play_a_xxx_fl_rr.set' in the corresponding subject folder.


**(2) Inspect manually and remove bad blocks the preprocessed EEG data.**   
    This should be done after preprocessing and before running ICA.  
    Save file that is checked with the name: 'play_a_xxx_fl_rr_clean.set'.  

**(3) Run ICA on the clean EEG data.**   
    ICA goes through the raw data and identifies and separates the raw data into different components.  
    It identifies things such as eye movement artifacts, noises or activations.  

  If this part is successfully run, you should see 'play_a_xxx_fl_rr_ica.set' file in the corresponding subject folder.  


**(4) Reject bad components manually.**  
    Components, such as eye blinks and eye movements, are marked here and will later be rejected.
    Save manually rejected file as: 'play_a_xxx_fl_rr_ica.set'


**(5) Epoch EEG data.**  
    This part marks stimulus-relavant chunks in the processed data so far. 
    Use the variable epoch_length you have set up where the marking should begin and end relative to the onset of a stimulus.


**(6) Create eventlist, apply binlist, extract epochs, and artifact rejection.**  
    This part puts the eventcodes for each stimulus into different bins and extracts the epoched data and finally rejects the components.
    If the script is successfully run, you should see the files named as 'play_a_xxx_fl_rr_ica_el_bin_epo_ar.set' and 
    'AR_summary_play_a_xxx.txt' in the corresponding subject folder.

  The .set data contains the epoched, artifect-rejected, and bin-applied EEG data.  
  
  The .txt file is a summary about how much percentage of data is rejected.  


**(7) Create individual ERP.**  
    This rejects all the epochs that have been marked as bad in the artifact rejection and averages the good, 
    remaining trials together to create an averaged ERP on the individual level.

  If the script is successfully run, you should see the file named as 'play_a_xxx.erp' in the corresponding subject folder.


**(8) Average individual ERPs together into group.**  
    This portion of the script loads all the individual ERP files into ERPLAB and averages them together to create a 
    group ERP that may then be plotted.



## **2. Mass univariate analysis**

(1) Download and install the Mass Univariate Toolbox 
    (https://openwetware.org/wiki/Mass_Univariate_ERP_Toolbox).

(2) Load the play_a_xxx.erp files into a single "GND" MATLAB data structure using the Mass Univariate Toolbox function erplab2GND.m.  
    If you want to perform between-subject analyses, create a "GRP" MATLAB data structure from two or more "GND" data structures.

(3) Conduct the mass univariate analyses on the GND or GRP data structures. 


