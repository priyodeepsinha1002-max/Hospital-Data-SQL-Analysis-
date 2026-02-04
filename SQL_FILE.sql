drop table details;

create table details(
Hospital_Name varchar(50),
Location varchar(50),
Department varchar(100),
DoctorsCount int,	
PatientsCount int,	
AdmissionDate Date,	
DischargeDate Date,	
MedicalExpenses numeric(1000,2)
);

Select * from details;

copy details(Hospital_Name,Location,Department,DoctorsCount,PatientsCount,
AdmissionDate,DischargeDate,MedicalExpenses)
from 'D:/SQL/Satish dhawale/Certificate/Hospital_Data.csv'
with(format csv, header true,delimiter',');


/*1. Total Number of Patients
o Write an SQL query to find the total number of patients across all hospitals*/

Select hospital_name, sum(patientscount)
from details
group by hospital_name;

/*Average Number of Doctors per Hospital
o Retrieve the average count of doctors available in each hospital.*/

Select * from details;

Select hospital_name, avg(DoctorsCount)
from details
group by hospital_name;

/*Top 3 Departments with the Highest Number of Patients
o Find the top 3 hospital departments that have the highest number of patients.*/


Select hospital_name, department, count(patientscount) as counts
from details
group by hospital_name, department
order by counts desc limit 3;

/*Hospital with the Maximum Medical Expenses
o Identify the hospital that recorded the highest medical expenses*/

Select hospital_name, max(medicalexpenses) as max_expense
from details 
group by hospital_name
order by max_expense desc limit 1;

/*Daily Average Medical Expenses
o Calculate the average medical expenses per day for each hospital.*/

Select hospital_name, avg(medicalexpenses/30) as per_day
from details 
group by hospital_name;

/* Longest Hospital Stay
o Find the patient with the longest stay by calculating the difference between 
Discharge Date and Admission Date.*/

SELECT *, (dischargedate - admissiondate) AS stay_duration
FROM details
ORDER BY stay_duration DESC
LIMIT 1;

/*Total Patients Treated Per City
o Count the total number of patients treated in each city.*/


Select * from details;

Select distinct location, count(patientscount)
from details
group by location;

/*Average Length of Stay Per Department
o Calculate the average number of days patients spend in each department.*/

Select department, avg(dischargedate - admissiondate) as stay_duration
from details 
group by department;


/*Identify the Department with the Lowest Number of Patients
o Find the department with the least number of patients*/


Select department, min(patientscount) as min_patient
from details 
group by department
order by min_patient asc limit 1;

/*Monthly Medical Expenses Report
• Group the data by month and calculate the total medical expenses for each month.*/

SELECT 
EXTRACT(MONTH FROM AdmissionDate) AS month_number, 
SUM(MedicalExpenses) AS total_monthly_expenses
FROM details
GROUP BY month_number
ORDER BY month_number;



