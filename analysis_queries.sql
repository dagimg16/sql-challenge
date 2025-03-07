-- Employee number, last name, first name, sex, and salary of each employee

select e.emp_no, e.last_name, e.first_name ,e.sex, s.salary 
from employees e 
inner join salaries s on e.emp_no = s.emp_no ;

--- First name, last name, and hire date for the employees who were hired in 1986 
select e.first_name ,e.last_name , e.hire_date 
from employees e 
where extract (year from e.hire_date) = 1986;

--- Manager of each department along with their department number, department name, employee number, last name, and first name
select dm.dept_no,d.dept_name, dm.emp_no, e.last_name, e.first_name 
from dept_manager dm 
join departaments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no ;

--- Department number for each employee along with that employee’s employee number, last name, first name, and department name
select e.emp_no, de.dept_no, e.last_name , e.first_name , d.dept_name 
from employees e
join dept_emp de on e.emp_no = de.emp_no 
join departaments d on de.dept_no = d.dept_no;

--- First name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
select e.first_name , e.last_name , e.sex 
from employees e 
where e.first_name = 'Hercules' and e.last_name like 'B%';

--- Each employee in the Sales department, including their employee number, last name, and first name 
select e.emp_no, d.dept_name , e.last_name , e.first_name
from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departaments d on de.dept_no = d.dept_no
where d.dept_no = 'd007';

--- Each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no, d.dept_name , e.last_name , e.first_name
from employees e 
join dept_emp de on e.emp_no = de.emp_no
join departaments d on de.dept_no = d.dept_no
where d.dept_no = 'd007' or d.dept_no ='d005';

--- Frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
select e.last_name , count(e.last_name)
from employees e 
group by e.last_name
order by count desc;