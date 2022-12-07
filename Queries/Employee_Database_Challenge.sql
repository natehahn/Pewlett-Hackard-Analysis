SELECT emp.emp_no,
	emp.first_name,
	emp.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as emp
LEFT JOIN titles as t
ON emp.emp_no = t.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
--INTO unique_titles
FROM retirement_titles as rt
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- Employee retirement count by title
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

SELECT DISTINCT ON (emp_no) emp.emp_no,
	emp.first_name,
	emp.last_name,
	emp.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_program_eligible
FROM employees as emp
	INNER JOIN dept_employees as de
		ON (emp.emp_no = de.emp_no)
	INNER JOIN titles as t
		ON (emp.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') AND
	(emp.birth_date BETWEEN '1965-01-01' AND '1965-12-31')