# Pewlett Hackard Analysis

### Overview

This analysis was completed at the request of Pewlett Hackard.  The analysis is centered around the current employee makeup using multiple inputs and the retirement eligibility of employees.  Several insights were discovered that will support the company in preparing for the future with regards to hiring needs and who is eligible for support in the Mentorship Program.

Program Used: PostgreSQL15, PgAdmin4
Version: 15.1

### Results

When we conducted the analysis on the provided spreadsheets we discovered some information that the company will want to start planning for.  

 -  First, we called upon the data to identify those within the retirement categorie and removed those that may have transferred to another position within the company.
 -  Next we created a count of all the personnel that could retire based on the work title.  What we found is alarming.  See the image below.
 
![Retirement Count](https://github.com/natehahn/Pewlett-Hackard-Analysis/blob/main/Data/retirement_count.png)
 
- If all of the personnel chose to retire tomorrow, more than 65,000 staff members would be leaving.  Many in senior management and engineer roles.  The need to get ahead of identifying those who wish to retire in the near term and start hiring for positions should be a priority.

- The next querie conducted was to identify those that are eligible to participate in a mentorship program for training those new employees.  Over 1500 employees are eligible for this program.  The individuals are included in the mentorship_program_eligible.csv.

### Summary

To recap the most essential elements of this report:

1. 72,458 employees are eligible for retirement.  That means hiring will need to begin immediately to insure continuity within the company.
2. There are enough retirement-ready employees to mentor the next generation of employees.  

In order to identify how many employees there are in each department to mentor new employees, we can use the code:

-- Number of mentors per department
SELECT COUNT(mp.emp_no), mp.title
FROM mentorship_program_eligible as mp
GROUP BY mp.title
ORDER BY count;


