*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic datasets to address several research
questions regarding physical fitness level at CA public K-12 schools

Dataset Name: cde_2014_analytic_file created in external file
STAT6250-01_w17-team-0_project2_data_preparation.sas, which is assumed to be
in the same directory as this file
See included file for dataset properties
;

* environmental setup;
%let dataPrepFileName = STAT6250-01_w17-team-2_project2_data_preparation.sas;
%let sasUEFilePrefix = YW_team-2_project2;

* load external file that generates analytic dataset cde_2014_analytic_file
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
* Research Question Analysis Starting Point Question 1;
*******************************************************************************;

*
Research Question 1: 
What is the fitness level change from year 2014 to year 2015 and from year 2015 to year 2016? Specifically, which among grade 5, grade 6, and grade 7, which grade of students have the better fitness level? 

Rationale: This should help identify trend of fitness for students in CA K-12 publich schools.So that we can consider for if there is a need for increasing students physical fitness levels.

Note: This compares the average value of column Perc5c, Perc7c, and Perc9c.and compare the results of the means between year 2014-2015 and year 2015-2016.

Methodology: Proc print is used to display mean for different columns 
;

proc means data = pft_combined_raw;
		   class perc5c perc7c perc9c;
	       var perc5c perc7c perc9c;
run;


*******************************************************************************;
* Research Question Analysis Starting Point Question 2;
*******************************************************************************;

*
Research Question 2: 
What is the change of rate for FRPM for K-12 publich school students from year 2014 to year 2015 and from year 2015 to year 2016? 

Rationale: This should help identify poverty level change for students in CA K-12 publich schools.So that we know if there is a correlationship between poverty and student fitness level. 

Note: This is to compare the results of the means of percentage FRPM between year 2014-2015 and year 2015-2016.

Methodology: Proc print is used to display mean for different columns 
;

proc format;
	value var22_fmt
		var22="Eligible Percent FRPM"
		;
proc means data = prpm_combined_raw;
		   class var22;
	       var var22;
		   format var22_fmt;
	
run;


*******************************************************************************;
* Research Question Analysis Starting Point Question 3;
*******************************************************************************;

*
Research Question 3: 
What is correlationship between student's ethnicity and their physical fitness level?  

Rationale: This should help identify poverty level change for students in CA K-12 publich schools.So that we know if there is a correlationship between poverty and student fitness level. 

Methodology: Proc print is used to display mean for different columns 
;

proc means data = pft_combined_raw;
				class perc5c perc7c perc9c report_number;
				where report_number = 3
					  report_number = 4
					  report_number = 5
					  report_number = 6
					  report_number = 7
					  report_number = 8
					  report_number = 9
					  report_number = 10
					  ;
				var perc5c perc7c perc9c;
run;
