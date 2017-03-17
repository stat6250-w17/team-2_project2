*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic datasets to address several research
questions regarding physical fitness level at CA public K-12 schools.

Dataset Name: pft_analytic_dataset, pft14_16, and frp14_16 created in external 
file STAT6250-01_w17-team-2_project2_data_preparation.sas, which is assumed to 
be in the same directory as this file.

See included file for dataset properties.
;

*environmental setup;
X 
"cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))"""
;

%include '.\STAT6250-01_w17-team-2_project2_data_preparation.sas'
;


*******************************************************************************;
* Research Question Analysis Starting Point Question 1;
*******************************************************************************;

title1
"Research Question 1: What is the average fitness level rate of different grades and what's the average percentage students who are in need of FRPM?"
; 

title2
"Rationale: This should help identify trend of fitness for students in CA K-12 public schools and see how does it match the trend of poverty data."
;

footnote1
"We can see that grade 5 students have the highest percentage of fitness high risk."
;

footnote2
"We can see that the percentage of the PFRM students are closet to grade 5 students who are in risk of physical fitness. Further study can be invested to see if there is correlations between grade 5 students and their PFRM rate."
;

*
Note: This compares the average value of column Perc5c, Perc7c, and Perc9c and
compare the results of the means with PFRM data.
;

*
Methodology: Use Proc means procedure and identify the variables to compare the 
values.
;

proc means 
 		data = pft_analytic_dataset 
		(
			rename = 
			(
				perc5c = percent_G5_highrisk 
				perc7c = percent_G7_highrisk 
				perc9c = percent_G9_highrisk 
				var22 = percent_eligible_frpm
			)
		)mean maxdec = 2
	;
     var percent_G5_highrisk 
		 percent_G7_highrisk 
		 percent_G9_highrisk 
         percent_eligible_frpm
     ;
     label percent_G5_highrisk = 
				'percentage of Grade 5 students in high risk zone'
           percent_G7_highrisk = 
				'percentage of Grade 7 students in high risk zone'
           percent_G9_highrisk = 
				'percentage of Grade 9 students in high risk zone'
     ;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point Question 2;
*******************************************************************************;

title1 
"Research Question 2: What is the fitness level change across from different district?"
;

title2
"Rationale: This would help us to identify which district students have relatively better fitness performance."
;

footnote1
"From the results we can see that district 31609 has 0% of students who are in health risk."
; 

footnote2
"From the resutls we can see district 76653 grade 5 and grade 7 students have 0% in the health risk zone but their grade 9 students have about 90%. Further research need to be made for this result to see why this is the case."
;
*
Note: This compares the average value of column Perc5c, Perc7c, and Perc9c within
the pft14_16 data only.
;

*
Methodology: Use Proc means procedure and identify the variables to compare the 
values.
;

proc means 
		data = pft14_16 
		(
			rename = 
			(
				perc5c = percent_G5_highrisk 
				perc7c = percent_G7_highrisk 
				perc9c = percent_G9_highrisk 
			)
		)mean maxdec = 2
	      ;
		class dcode;
    	var percent_G5_highrisk percent_G7_highrisk percent_G9_highrisk;
     	label percent_G5_highrisk = 
					'percentage of Grade 5 students in high risk zone'
              percent_G7_highrisk = 
					'percentage of Grade 7 students in high risk zone'
              percent_G9_highrisk = 
					'percentage of Grade 9 students in high risk zone'
          ;
run;

title;
footnote;

*******************************************************************************;
* Research Question Analysis Starting Point Question 3;
*******************************************************************************;

title1 
"Research Question 3: What is the change of rate for FRPM for K-12 publich school students from different districts?"
;

title2
"Rationale: This should help identify poverty level change for students in CA K-12 publich schools.So that we know if there is a correlationship between poverty and student fitness level."
;

footnote1
"For district 31609, the frpm rate was 90%, but have 0% health high risk rate from the study above. We can further study this disctrict and see what can be learned from this district in terms of improving student fitness level."
;

footnote2
"District 76653 has almost 0% frpm, but their 9th graders are in a high health risk. Study need to be done for this result."
;


*
Note: This is to compare the results of the means of percentage FRPM between 
year 2014-2015 and year 2015-2016.
;

*
Methodology: Use Proc means procedure and identify the variables to compare 
the values.
;

proc means data = frp14_16 mean maxdec = 2 n missing; 
	 class district_code district_name; 
	 label var22 = elegible frpm percentage;  
 	 var var22; 
run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point Question 4;
*******************************************************************************;

title1
"Research Question 4: What is correlationship between student's ethnicity and their physical fitness level? "
;

title2
"Rationale: This should help identify ethnicity impact for students in CA K-12 publich schools.So that we know if there is a correlationship between ethnicity and student fitness level."
;

footnote1
"From the result, we can see that in general group 7, which is Hispanic, have more percent of students who are at a higher health risk."
;

footnote2
"From the result, we can see that group 4, which is American Indian, in general have heathier students."
;

*
Methodology: Use Proc means procedure and identify the variables to compare 
the values.
; 

proc means data = pft14_16 mean maxdec=2;
		class Report_Number;
		where Report_Number in (3,4,5,6,7,8,9,19);
		var perc5c perc7c perc9c;
		label Perc5c = 'percentage of Grade 5 students in high risk zone'
              Perc7c = 'percentage of Grade 7 students in high risk zone'
              Perc9c = 'percentage of Grade 9 students in high risk zone'
          ;
		format Report_Number Report_Number_Format.;
run;

title;
footnote;

* =============================================================================;







