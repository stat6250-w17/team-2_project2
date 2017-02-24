*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

* environmental setup;
%let dataPrepFileName = STAT6250-01_w17-team-2_project2_data_preparation.sas;
%let sasUEFilePrefix = team-2_project2;

* load external file that generates analytic dataset frpm_analytic_file
using a system path dependent on the host operating system, after setting the
relative file import path to the current directory, if using Windows;
%macro setup;
    %if
        &SYSSCP. = WIN
    %then
        %do;
            X
            "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))"""
            ;           
            %include ".\&dataPrepFileName.";
        %end;
    %else
        %do;
            %include "~/&sasUEFilePrefix./&dataPrepFileName.";
        %end;
%mend;
%setup

*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
"Research Question: 
;

title2
"Rationale: This should help identify schoos to consider for new outreach based upon increasing child-poverty levels."
;

footnote1
"All five schools listed appear to have experienced extremely large increases percent eligible for free/reduced-price meals between AY2014-15 and AY2015-16."
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved, especially for the school apparently exhibiting an increase of 100%."
;

footnote3
"However, assuming there are no data issues underlying this analysis, possible explanations for such large increases include changing CA demographics and recent loosening of the rules under which students qualify for free/reduced-price meals."
;

*
Note: This compares the column "Percent (%) Eligible Free (K-12)" from frpm1415
to the column of the same name from frpm1516.
Methodology: Proc print is used to display the first five rows of a dataset
that was sorted by frpm_rate_change_2014_to_2015 in descending order in the
data-prep file.
;

proc print data=cde_2014_analytic_file_frpm_sort(obs=5);
    id School_Name;
    var frpm_rate_change_2014_to_2015;
run;

title;
footnote;

