?*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;
* 
This file prepares the datasets described below for analysis.
It consists of 2 main datasets and 4 supporting datasets that are linked for 
for further detailed analysis. 
Creates analytic dataset : AS_PFT_analytic_datasetFINAL


[Dataset 1 Name] ResearchFile_2014_15(AlamedaContraCosta)

[Dataset Description] : Physical Fitness Test (PFT) program results(2014-2015)
                        Statewide data files for the Physical Fitness Testing Program, 2014-2015
                      (Filtered for Alameda and Contra Costa County school districts[District Codes : dcode
			10017,31609,31617,61119,61127,61143,61150,61168,61176,61192,
			61200,61234,61242,61259,61275,61291,61309,75093,75101,75119,76653])

[Experimental Unit Description] contain results from the Physical Fitness Test (PFT) program

[Number of Observations] 39945
                    
[Number of Features] 24

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles15.zip file; 
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

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file; 
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

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file; 
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

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file; 
                  PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The column (Level_Number+Report_Number+Table_Number+Line_Number) form the primary key


--


--

[Dataset 5 Name] FRPM_14_15

[Dataset Description] an unduplicated count of students who are FRPM eligible. This count includes:
			- Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools; and
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
			- Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools; and
			- Students who are automatically eligible for free meals based on their foster, migrant, or homeless status, or because they were "directly certified" as being eligible for free meals based on their participation in California's food stamp program.

[Experimental Unit Description] an unduplicated count of students who are FRPM eligible per school

[Number of Observations] 10453
                    
[Number of Features] 28

[Data Source] http://www.cde.ca.gov/ds/sd/sd/filessp.asp

[Data Dictionary] http://www.cde.ca.gov/ds/sd/sd/fsspfrpm.asp

[Unique ID Schema] The column (County Code + DistrictCode + SchoolCode) form the primary key


--
*=========== code for setting datasets for YW's research questions ====================;




*============================================================================;


*=========== code for setting datasets for AS's research questions ====================;
* setup environmental parameters;
filename PFT14_15 "%sysfunc(getoption(work))/PFT14_15.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2014_15_ResearchFile(AlamedaContraCosta).xls?raw=true"    
    out=PFT14_15
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=PFT14_15
	OUT= WORK.PFT14_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;

*********************************;
filename PFT15_16 "%sysfunc(getoption(work))/PFTtmp.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2015_16_ResearchFile(AlamedaContraCosta).xls?raw=true"    
    out=PFT15_16
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=PFT15_16
	OUT= WORK.PFT15_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;

*********************************;
filename Ent15_16 "%sysfunc(getoption(work))/Entities.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2015_16_Entities.xls?raw=true"    
    out=Ent15_16
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=Ent15_16
	OUT= WORK.Entities_2015_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;

*********************************;
filename Sub14_15 "%sysfunc(getoption(work))/Subgroups.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/2014_15_Subgroups.xls?raw=true"    
    out=Sub14_15
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=Sub14_15
	OUT= WORK.Subgroup_2014_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;

*********************************;
filename FRP14_15 "%sysfunc(getoption(work))/FRPM1415.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/frpm1415.xls?raw=true"    
    out=FRP14_15
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=FRP14_15
	OUT= WORK.FRP14_15
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;


*********************************;
filename FRP15_16 "%sysfunc(getoption(work))/FRPM1516.xls";

PROC HTTP
    method="get" 
    url="https://github.com/stat6250/team-2_project2/blob/master/data/frpm1516.xls?raw=true"    
    out=FRP15_16
    ;
run;



/*Import each of the worksheets from the xls files into SAS as a separate dataset*/
PROC IMPORT FILE=FRP15_16
	OUT= WORK.FRP15_16
	DBMS=xls
	REPLACE;
	GETNAMES=YES;
;
RUN;
*********************************;




/*Stack the PFT 2014-15 and 2015-16 data into a single PFT14_16 dataset */
DATA PFT14_16;
     set PFT14_15(IN=in1415 RENAME=(CO=ccode DIST=dcode SCHL=scode) )
         PFT15_16(IN=in1516 RENAME=(CO=ccode DIST=dcode SCHL=scode) ) 

 ;

/*Stack the PFT 2014-15 and 2015-16 data into a single PFT14_16 dataset */
DATA FRP14_16;
	set FRP14_15(IN=in1415 )
        FRP15_16(IN=in1516 );
    ccode = input(County_code,2.);
    dcode = input(District_code,2.);
    scode = input(School_code,2.)
 ;


/* The final analytics dataset combines PFT14_16 dataset with the Entities and
   Subgroups information. */
   
/* Merge PFT data with Entities dataset.
   Prior to one-to-many merge, sort the PFT dataset and Entities dataset
   by the CountyCode + DistrictCode + SchoolCode which defines each 'Entity'*/
proc sort data = PFT14_16;
     by ccode dcode scode
;

proc sort data = Entities_2015_16;
     by ccode dcode scode
;

proc sort data = Entities_2015_16;
     by ccode dcode scode
;


/*Merge entities and pft datasets*/
data AS_PFT_analytic_dataset1;
     
     set PFT14_16 Entities_2015_16(drop=ChrtNum);
     by ccode dcode scode;

proc sort data =AS_PFT_analytic_dataset1;
	by Level_Number Report_Number Table_Number Line_Number
;

proc sort data = Subgroup_2014_15;
     by Level_Number Report_Number Table_Number Line_Number
;


data AS_PFT_analytic_dataset2;
     set AS_PFT_analytic_dataset1 Subgroup_2014_15;
     by Level_Number Report_Number Table_Number Line_Number;


proc sort data =AS_PFT_analytic_dataset2;
     by ccode dcode scode;
;


proc sort data =FRP14_16;
     by ccode dcode scode;
;


data AS_PFT_analytic_datasetFINAL;
	 set AS_PFT_analytic_dataset2 FRP14_16;
     by ccode dcode scode;


proc sort
        nodupkey
        data=AS_PFT_analytic_datasetFINAL
        out=_null_
    ;
    by ccode dcode scode level_number report_number table_number line_number
    ;

run;

QUIT;
proc contents data=AS_PFT_analytic_datasetFINAL
;

*===========================================================================;

