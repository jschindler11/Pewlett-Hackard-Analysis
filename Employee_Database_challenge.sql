-- Number of Retiring Employees by Title
SELECT em.emp_no, 
       em.first_name, 
       em.last_name,
	   ti.title, 
       ti.from_date, 
       ti.to_date
	--INTO retirement_titles
	FROM employees AS em
	LEFT JOIN titles as ti
	ON (em.emp_no = ti.emp_no)
	WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	ORDER BY em.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY emp_no ASC, to_date DESC;

-- # of employees by their most recent job title who are about to retire
SELECT COUNT(ut.emp_no), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

