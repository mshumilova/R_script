Task
  
We want to find common surnames of doctors between two datasets (table 1 and table 2) and count the number of patients these doctors are curing during an observational study.

Data description 
 
The table 1 is a dataset with doctors and patients participating in an observational study (surnames of reseachers are repeated as many times as many patients they are curing).
The table 2 is a dataset with doctors who participated in another project and we want to find out if we have reseachers from the table 1 among them.

How to solve the task? 

step 1 - subset preparation (we want to work only with surnames of the doctors)
step 2 - finding common surnames using inner join approach
step 3 - count patients (as far as we have repeated surnames on the table 1 and it indicates how many patients the doctors are curing, 
we count repeated surnames after joining to get the number of patients)

