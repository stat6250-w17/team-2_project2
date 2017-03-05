*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the PFT_analytic_dataset to address several research questions 
regarding Physical Fitness level of students in Alameda and Contra Costa school 
districts 

Dataset Name: PFT_analytic_dataset created in external file
              STAT6250-01_w17-team-2_project2_data_preparation.sas, which is 
              assumed to be in the same directory as this file.
	      See included file for dataset properties.
;



* environmental setup;
let dataPrepFileName = STAT6250-01_w17-team-2_project2_data_preparation.sas;
let sasUEFilePrefix = team-2_project2;


* load external file that generates analytic dataset PFT_analytic_dataset
using a system path dependent on the host operating system, after setting the
relative file import path to the current directory, if using Windows;
macro setup;
if
    &SYSSCP. = WIN
then
    do;
        X
        'cd ''substr(sysget(SAS_EXECFILEPATH),1,eval(length(sysget(SAS_EXECFILEPATH))-length(sysget(SAS_EXECFILENAME))))'''
        ;           
        include '.\&dataPrepFileName.';
    end;
else
    do;
        include '~/&sasUEFilePrefix./&dataPrepFileName.';
    end;
mend;
setup
;


*-------------------------REPORT 1------------------------------------;
title1
'Research Question 1:  Compare the results of the six areas of physical fitness that are part of the PFT test 
                       across each of the districts in Alameda county combined for year 2014-15 and 2015-16.';
  
title2
'Rationale: This will help identify which of the six areas is typically challenging for the student population. 
				 - Aerobic Capacity
                                 - Body Composition                   
                                 - Abdominal Strength                 
                                 - Trunk Extension Strength           
                                 - Upper Body Strength                
                                 - Flexibility
				Grade 5,7 and 9 students who are tested are categorized as healthy(PercNa), needs improvement(PercNb) and high risk(PercNc).
                                PE programs can be fine tuned if this analysis reveals that students consistently perform below average in any one of these
                                areas.';
*Note: This will avg columns Perc5a,Perc5b,Perc5c, Perc7a,Perc7b,Perc7c,Perc9a,Perc9b,Perc9c for all the schools. 
			     Use Report_Number = 0 ;

proc sql;
	select ccode, dcode, level_number, report_number, table_number, line_text,
               avg(Perc5a) as Grade5_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc5b) as Grade5_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc5c) as Grade5_At_Risk_Zone            format decimal8.2, 
               avg(Perc7a) as Grade7_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc7b) as Grade7_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc7c) as Grade7_At_Risk_Zone            format decimal8.2, 
               avg(Perc9a) as Grade9_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc9b) as Grade9_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc9c) as Grade9_At_Risk_Zone            format decimal8.2
	  from pft_analytic_dataset
         where Level_number  = 1 /* indicates school level     */
           and report_number = 0 /* indicates for all students */
           and table_number  = 1 /* indicates Fitness area */
           and scode <> 0        
         group by ccode, dcode, level_number, report_number, table_number, line_text
         order by ccode, dcode, level_number, report_number, table_number, line_text
;
;


title1
'Research Question 2: Compare the results of of the PFT for the above mentioned test areas based on gender across districts for years 2014-2015 
                      & 2015-2016 combined.'; 
title2
'Rationale: This would reveal a performance pattern for male and female students. If the results vary for male Vs. Female in any one specific district,
             it can help that district identify the reasons and modify their PE program to reduce the performance deficit.';
 
*Methodology: Use report_number = 14 which is a gender summary report. 
              Report for each district to facilitate comparison.;


proc sql;
	select ccode, dcode, level_number, report_number, table_number, line_text,
               avg(Perc5a) as Grade5_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc5b) as Grade5_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc5c) as Grade5_At_Risk_Zone            format decimal8.2, 
               avg(Perc7a) as Grade7_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc7b) as Grade7_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc7c) as Grade7_At_Risk_Zone            format decimal8.2, 
               avg(Perc9a) as Grade9_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc9b) as Grade9_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc9c) as Grade9_At_Risk_Zone            format decimal8.2
	  from pft_analytic_dataset
         where Level_number  = 1  /* indicates school level  */
           and report_number = 14 /* indicates Gender summary */
           and table_number  = 3  /* indicates gender summary */
         group by ccode, dcode, level_number, report_number, table_number, line_text
         order by ccode, dcode, level_number, report_number, table_number, line_text
;


title1
'Research Question 3: Compare the results of the PFT for the above mentioned test areas based on economic status 
                      across districts for years 2014-2015 
                      & 2015-2016.'; 
title2
'Rationale: This analysis can help district modify and enhance their PE program to provide support for specific socio-economic groups to improve
             awareness realted to health issues .e.g. need for proper diet and exercise; making fitness facilities available at low/no cost etc.'; 
*Methodology: Use report_number = 16 which is an economic summary report. 
              Report for each district to facilitate comparison.
;



proc sql;
	select ccode, dcode, level_number, report_number, table_number, line_text,
               avg(Perc5a) as Grade5_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc5b) as Grade5_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc5c) as Grade5_At_Risk_Zone            format decimal8.2, 
               avg(Perc7a) as Grade7_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc7b) as Grade7_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc7c) as Grade7_At_Risk_Zone            format decimal8.2, 
               avg(Perc9a) as Grade9_Healthy_Fitness_Zone    format decimal8.2, 
               avg(Perc9b) as Grade9_Needs_Improvement_Zone  format decimal8.2, 
               avg(Perc9c) as Grade9_At_Risk_Zone            format decimal8.2
	  from pft_analytic_dataset
         where Level_number  = 2  /* indicates district level  */
           and report_number = 16 /* indicates Economic Status summary */
           and table_number  = 5  /* indicates gender summary */
         group by ccode, dcode, level_number, report_number, table_number, line_text
         order by ccode, dcode, level_number, report_number, table_number, line_text
;

quit;

*===========================================================================;

