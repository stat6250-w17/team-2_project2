﻿/*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;
* 
This file creates a file handle to access the data folder on gitHub
*/

filename Dtfolder "%sysfunc(getoption(work))/data";


PROC HTTP
    method="get" 
    url="http://github.com/stat6250/team-2_project2/raw/master/data" 
    out=Dtfolder
    ;
run;

