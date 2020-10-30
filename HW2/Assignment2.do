/* Type these commands to install the "estout" package: 
ssc install estout
Also: Note you can type help [command] into Stata to get help on any command. 
*/
cd "/Users/chenwang/Documents/GitHub/Research-Method-Assignments/HW2/"
* Read in data: 
insheet using "vaping-ban-panel.csv",clear
*2.test the parellel trend
tsset stateid year
tvdiff lunghospitalizations vapingban, model(fe) pre(9) post(10) vce(robust) test_tt

insheet using "vaping-ban-panel.csv",clear
tsset stateid year
reg lunghospitalizations year##vapingban i.year i.stateid
* Store regression
eststo regression_one
*3.draw the line
collapse (mean) lunghospitalizations, by (vapingban year)
reshape wide lunghospitalizations, i(year) j(vapingban)
graph twoway line lunghospitalizations0 lunghospitalizations1 year, sort

*4.run a regression to estimate the treatment effect of the law
insheet using "vaping-ban-panel.csv",clear
tsset stateid year
reg lunghospitalizations i.vapingban i.year i.stateid

* Store regression
eststo regression_four
reg lunghospitalizations year##vapingban i.year i.stateid
* Store regression
eststo regression_one
**********************************
* FOR PEOPLE USING LaTeX: 
* Create output options. The below defaults are common and can be customized. 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) prehead(\begin{tabular}{l*{14}{c|c}}) postfoot(\end{tabular}) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"

esttab regression_one regression_four using Assignment2-Table.tex, $tableoptions keep(1.vapingban) 


**********************************
* FOR PEOPLE USING MICROSOFT: 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one regression_four using Assignment2-Table.rtf, $tableoptions keep(1.vapingban) 
