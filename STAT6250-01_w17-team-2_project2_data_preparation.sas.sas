********************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*This file creates datasets required for addressing analysis questions;

*
[Dataset 1 Name] ResearchFile_2014_15(AlamedaContraCosta)

[Dataset Description] Physical Fitness Test (PFT) program results(2014-2015)Statewide data files for the Physical Fitness Testing Program, 2014-2015 (Filtered for Alameda and Contra Costa County school districts).

[Experimental Unit Description] contain results from the Physical Fitness Test (PFT) program

[Number of Observations] 39,945

[Number of Features] 24

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary]http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles15.zip file - PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The columns "Level_Number", "Report_Number", "Table_Number", "Line_Number","County Code", "District Code","School Code" uniquely identify a PFT test result row

;

*

[Dataset 2 Name] ResearchFile_2015_16_(AlamedaContraCosta)

[Dataset Description] Physical Fitness Test (PFT) program results(2015-2016)Statewide data files for the Physical Fitness Testing Program, 2015-2016 (Filtered for Alameda and Contra Costa County school districts).

[Experimental Unit Description] contain results from the Physical Fitness Test (PFT) program

[Number of Observations] 40,634

[Number of Features] 24

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary]http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file - PFT Research File Layouts 2016.PDF contains data dictionary

[Unique ID Schema] The columns "Level_Number", "Report_Number", "Table_Number", "Line_Number","County Code", "District Code","School Code" uniquely identify a PFT test result row

;

*
[Dataset 3 Name] Entities_2014_15

[Dataset Description] Physical Fitness Entities, 2014-2015

[Experimental Unit Description] Physical Fitness Entities - County, District and School codes and names

[Number of Observations] 10,696

[Number of Features] 8

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary]http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file - PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The CCCode + Dcode + Scode is combined to form the CDS_Code, which uniquely represents a school.

;


*

[Dataset 4 Name] Subgroups_2014_15

[Dataset Description] Demographic classifications of student populations based on gender,

                      ethnicity and economic status

[Experimental Unit Description] Demographic classifications of student populations

[Number of Observations] 845                 

[Number of Features] 7

[Data Source] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp

[Data Dictionary] http://www.cde.ca.gov/ta/tg/pf/pftresearch.asp - Download PFTResearchFiles16.zip file -  PFT Research File Layouts 2015.PDF contains data dictionary

[Unique ID Schema] The column (Level_Number+Report_Number+Table_Number+Line_Number) form the primary key
;

*

[Dataset 5 Name] FRPM_14_15

[Dataset Description] an unduplicated count of students who are FRPM eligible. This count includes: Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools;* Students who are automatically eligible for free meals based on their foster, migrant, or homeless status, or because they were "directly certified" as being eligible for free meals based on their participation in California's food stamp program.

[Experimental Unit Description] an unduplicated count of students who are FRPM eligible per school

[Number of Observations] 10393             

[Number of Features] 28

[Data Source] http://www.cde.ca.gov/ds/sd/sd/filessp.asp

[Data Dictionary] http://www.cde.ca.gov/ds/sd/sd/fsspfrpm.asp

[Unique ID Schema] The column (County Code + DistrictCode + SchoolCode) form the primary key

;

*

[Dataset 7 Name] FRPM_15_16

[Dataset Description] an unduplicated count of students who are FRPM eligible. This count includes: Students who are eligible to receive Free or Reduced Price Meals (FRPM) based on applying for the National School Lunch Program (NSLP), or who are determined to meet the same income eligibility criteria as the NSLP, through their local schools; *Students who are automatically eligible for free meals based on their foster, migrant, or homeless status, or because they were "directly certified" as being eligible for free meals based on their participation in California's food stamp program.

[Experimental Unit Description] an unduplicated count of students who are FRPM eligible per school

[Number of Observations] 10453                   

[Number of Features] 28

[Data Source] http://www.cde.ca.gov/ds/sd/sd/filessp.asp

[Data Dictionary] http://www.cde.ca.gov/ds/sd/sd/fsspfrpm.asp

[Unique ID Schema] The column (County Code + DistrictCode + SchoolCode) form the primary key


*=========== code for setting analytic datasets for YW's research questions =============;

* setup environmental parameters;
%let inputDataset1URL =



*============================== end of block YW===============================;







*=========== code for setting analytic datasets for AS's research questions =============;




*======================== end of block AS=====================================;

