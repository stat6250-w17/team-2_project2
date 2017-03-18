*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;
* 
This file prepares the datasets described below for analysis.
It impotrs and uses 2 main datasets and 4 supporting datasets that are linked for 
for further detailed analysis. 
Creates analytic dataset : PFT_analytic_dataset

---------------------------------------------------------------------------------
[Dataset 1 Name] ResearchFile_2014_15(AlamedaContraCosta)

[Dataset Description] : Physical Fitness Test (PFT) program results(2014-2015)
                        Statewide data files for the Physical Fitness Testing Program, 2014-2015
                      (Filtered for Alameda and Contra Costa County school districts
                       [District Codes : dcode
			10017,31609,31617,61119,61127,61143,61150,61168,61176,61192,
			61200,61234,61242,61259,61275,61291,61309,75093,75101,75119,76653])

[Experimental Unit Description] contain results from the Physical Fitness Test (PFT) program

[Number of Observations] 39945
                    
[Number of Features] 24

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles15.zip file 
                  PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The columns "Level_Number", "Report_Number", "Table_Number", "Line_Number","County Code",
                   "District Code","School Code" uniquely identify a PFT test result row

--

[Dataset 2 Name] ResearchFile_2015_16_(AlamedaContraCosta)

[Dataset Description] Physical Fitness Test (PFT) program results(2015-2016)
                      Statewide data files for the Physical Fitness Testing Program, 2015-2016
                      (Filtered for Alameda and Contra Costa County school districts[District Codes : dcode
			10017,31609,31617,61119,61127,61143,61150,61168,61176,61192,
			61200,61234,61242,61259,61275,61291,61309,75093,75101,75119,76653])

[Experimental Unit Description] contain results from the Physical Fitness Test (PFT) program

[Number of Observations] 40634
                    
[Number of Features] 24

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file 
                  PFT Research File Layouts 2016.PDF contains data dictionary

[Unique ID Schema] The columns "Level_Number", "Report_Number", "Table_Number", "Line_Number","County Code",
                   "District Code","School Code" uniquely identify a PFT test result row


--

[Dataset 3 Name] Entities_2014_15

[Dataset Description] Physical Fitness Entities, 2014-2015

[Experimental Unit Description] Physical Fitness Entities - County, District and School codes and names

[Number of Observations] 10696
                   
[Number of Features] 8

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file 
                  PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The CCCode + Dcode + Scode is combined to form the CDS_Code, 
                   which uniquely represents a school.

--

[Dataset 4 Name] Subgroups_2014_15

[Dataset Description] Demographic classifications of student populations based on gender,
                      ethnicity and economic status

[Experimental Unit Description] Demographic classifications of student populations

[Number of Observations] 845
                    
[Number of Features] 7

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file 
                  PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The column (Level_Number+Report_Number+Table_Number+Line_Number) form the primary key


--

[Dataset 5 Name] FRPM_14_15

[Dataset Description] an unduplicated count of students who are FRPM eligible. This count includes:
			- Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools and
			- Students who are automatically eligible for free meals based on their foster, migrant, or homeless status, or because they were "directly certified" as being eligible for free meals based on their participation in California's food stamp program.

[Experimental Unit Description] an unduplicated count of students who are FRPM eligible per school

[Number of Observations] 10393
                    
[Number of Features] 28

[Data Source] http://www.cde.ca.gov/ds/sd/sd/filessp.asp

[Data Dictionary] http://www.cde.ca.gov/ds/sd/sd/fsspfrpm.asp

[Unique ID Schema] The column (County Code + DistrictCode + SchoolCode) form the primary key


--

[Dataset 6 Name] FRPM_15_16

[Dataset Description] an unduplicated count of students who are FRPM eligible. This count includes:
			- Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools and
			- Students who are automatically eligible for free meals based on their foster, migrant, or homeless status, or because they were "directly certified" as being eligible for free meals based on their participation in California's food stamp program.

[Experimental Unit Description] an unduplicated count of students who are FRPM eligible per school

[Number of Observations] 10453
                    
[Number of Features] 28

[Data Source] http://www.cde.ca.gov/ds/sd/sd/filessp.asp

[Data Dictionary] http://www.cde.ca.gov/ds/sd/sd/fsspfrpm.asp

[Unique ID Schema] The column (County Code + DistrictCode + SchoolCode) form the primary key


*============================================================
Import each of the 6 xls files into a SAS dataset 
*============================================================;

/* Import 2014_15_ResearchFile(AlamedaContraCosta).xls */

filename PFT14_15 "%sysfunc(getoption(work))/PFT14_15.xls";

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2014_15_ResearchFile(AlamedaContraCosta).xls?raw=true"    
    out=PFT14_15
    ;
run;

proc import FILE=PFT14_15
	OUT= WORK.PFT14_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;

*--------------------------;

/* Import 2015_16_ResearchFile(AlamedaContraCosta).xls */

filename PFT15_16 "%sysfunc(getoption(work))/PFT15_16.xls";

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2015_16_ResearchFile(AlamedaContraCosta).xls?raw=true"    
    out=PFT15_16
    ;
run;

proc import FILE=PFT15_16
	OUT= WORK.PFT15_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;


/* Import 2015_16_Entities.xls */
filename Ent15_16 "%sysfunc(getoption(work))/Entities.xls"; 

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2015_16_Entities.xls?raw=true"    
    out=Ent15_16
    ;
run;


proc import FILE=Ent15_16
	OUT= WORK.Entities_2015_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;


/* Import 2014_15_Subgroups.xls */
filename Sub14_15 "%sysfunc(getoption(work))/Subgroups.xls";

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2014_15_Subgroups.xls?raw=true"    
    out=Sub14_15
    ;
run;

proc import FILE=Sub14_15
	OUT= WORK.Subgroup_2014_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;


/* Import frpm1415.xls */
filename FRP14_15 "%sysfunc(getoption(work))/FRPM1415.xls";

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/frpm1415.xls?raw=true"    
    out=FRP14_15
    ;
run;

proc import FILE=FRP14_15
	OUT= WORK.FRP14_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;



/* Import frpm1516.xls */
filename FRP15_16 "%sysfunc(getoption(work))/FRPM1516.xls";

proc http
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/frpm1516.xls?raw=true"    
    out=FRP15_16
    ;
run;

proc import FILE=FRP15_16
	OUT= WORK.FRP15_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;
*====================================================================
End of import of xls
=====================================================================;

/* Proc Format Statement */
proc format;
    value Report_Number_Format
	    3 = 'African Americans' 
	    4 = 'American Indian'
	    5 = 'Asians'
	    6 = 'Filipino'
	    7 = 'Hispanic'
	    8 = 'Native Hawaiian'
	    9 = 'White'
	    10 = 'Two or more races'
    ;

run;

*=============================================================================
Sort and combine datasets vertically
- PFT  2014_15 is combined vertically with PFT  2015_16
- FRPM 2014_15 is combined vertically with FRPM 2015_16
==============================================================================;

/*Combine the PFT 2014-15 and 2015-16 data into a single PFT14_16 dataset */
data PFT14_16;
     set PFT14_15(IN=in1415 RENAME=(CO=ccode DIST=dcode SCHL=scode) )/* Change the names of county code, district code and school code columns */
         PFT15_16(IN=in1516 RENAME=(CO=ccode DIST=dcode SCHL=scode) )/* so they are uniform in all datasets                                    */ 

;

/*Combine the FRPM 2014-15 and 2015-16 data into a single FRP14_16 dataset */
data FRP14_16;
        retain school_name;
        length school_name $100;
	set FRP14_15(IN=in1415 rename=(school_name = school_name_1))
            FRP15_16(IN=in1516 rename=(school_name = school_name_2));
    /* Change datatype of county, district and school code 
       so they are consistent with PFT and FRPM datasets*/
    ccode = input(County_code,2.)  ; 
    dcode = input(District_code,2.);
    scode = input(School_code,2.)  ;
    if in1415=1 then school_name=school_name_1;
    if in1516=1 then school_name=school_name_2;


*==============================================================================
* The final analytics dataset combines PFT14_16 dataset with the Entities, 
* Subgroups and FRPM datasets
*=============================================================================;
   
/* Merge or horizontally combine PFT data with Entities dataset.
   Prior to one-to-many merge, sort the PFT dataset and Entities dataset
   by the CountyCode + DistrictCode + SchoolCode which defines each 'Entity'*/

proc sort data=PFT14_16;
     by ccode dcode scode
;

proc sort data = Entities_2015_16;
     by ccode dcode scode
;

/* Combine the datasets using merge */
data PFT_analytic_dataset1; /*temp dataset to hold PFT + Entities data*/    
     merge PFT14_16 Entities_2015_16(drop=ChrtNum);
     by ccode dcode scode;


/* Next Merge or horizontally combine PFT+ENtities data Subgroups dataset.
   Prior to one-to-many merge, sort the PFT+Entities dataset and Subgroups dataset
   by the CountyCode + DistrictCode + SchoolCode which defines each 'Entity'*/

proc sort data=PFT_analytic_dataset1;
	by Level_Number Report_Number Table_Number Line_Number
;

proc sort data = Subgroup_2014_15;
     by Level_Number Report_Number Table_Number Line_Number
;


/* Combine the datasets using merge */
data PFT_analytic_dataset2;
     merge PFT_analytic_dataset1 Subgroup_2014_15;
     by Level_Number Report_Number Table_Number Line_Number;




/* Next Merge or horizontally combine PFT+ENtities+Subgroups with the FRPM dataset.
   Prior to one-to-many merge, sort the PFT+Entities+Subgroups dataset and FRPM dataset
   by the CountyCode + DistrictCode + SchoolCode which defines each 'Entity'*/


proc sort data =PFT_analytic_dataset2;
     by ccode dcode scode;
;


proc sort data =FRP14_16;
     by ccode dcode scode;
;


data PFT_analytic_dataset;
     merge PFT_analytic_dataset2 FRP14_16;
     by ccode dcode scode;


proc sort
        nodupkey
        data=PFT_analytic_dataset
        out=_null_
    ;
    by ccode dcode scode level_number report_number table_number line_number
    ;

run;

quit;

*===========================================================================;

