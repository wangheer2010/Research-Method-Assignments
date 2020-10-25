/* Type these commands to install the "estout" package: 
ssc install estout
Also: Note you can type help [command] into Stata to get help on any command. 
*/

* Read in data: 
*insheet using "/Users/chenwang/Documents/GitHub/ResearchMethods-Repository/HW1/assignment1-research-methods.csv",clear
insheet using "/Users/chenwang/Documents/GitHub/Research-Method-Assignments/HW1/assignment1-research-methods.csv",clear
* Label your variables
label variable eliteschoolcandidate "Elite School Candidate"
label variable calledback "Called Back"
label variable recruiterismale "Recruiter is Male"

* Run regression: 
reg calledback eliteschoolcandidate i.malecandidate i.recruiterismale

* Store regression
eststo regression_one 

**********************************
* FOR PEOPLE USING LaTeX: 
* Create output options. The below defaults are common and can be customized. 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) prehead(\begin{tabular}{l*{14}{c}}) postfoot(\end{tabular}) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using Assignment1-Table.tex, $tableoptions keep(eliteschoolcandidate) 


**********************************
* FOR PEOPLE USING MICROSOFT: 
global tableoptions "bf(%15.2gc) sfmt(%15.2gc) se label noisily noeqlines nonumbers varlabels(_cons Constant, end("" ) nolast)  starlevels(* 0.1 ** 0.05 *** 0.01) replace r2"
esttab regression_one using Assignment1-Table.rtf, $tableoptions keep(eliteschoolcandidate) 
