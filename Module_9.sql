

create table departaments(
dept_no	varchar(20) PRIMARY KEY,
dept_name varchar(100) NOT null

);

create table dept_emp(
emp_no varchar(20) not null,
dept_no varchar(20) not null,
primary key (emp_no, dept_no),
foreign key (emp_no) references employees(emp_no) on delete cascade,
foreign key (dept_no) references departaments(dept_no) on delete cascade
);

create table dept_manager(
dept_no varchar(20) not null,
emp_no varchar(20) not null,
primary key (dept_no, emp_no),
foreign key (dept_no) references departaments(dept_no) on delete cascade,
foreign key (emp_no) references employees(emp_no) on delete cascade
);
create table employees(
emp_no	varchar(20) primary key,
emp_title_id varchar(50) not null,
birth_date	date not null,
first_name varchar(100),
last_name varchar(100),	
sex varchar(10),
hire_date date not null,
foreign key (emp_title_id) references titles(title_id) on delete cascade
);

create table salaries(
emp_no	varchar(20) primary key,
salary int not null,
foreign key (emp_no) references employees(emp_no) on delete cascade
);

create table titles(
title_id varchar(50) primary key,
title varchar(100) not null
);

select *
from departaments d 
;

select *
from dept_emp de 
;

select *
from dept_manager dm 
;

select *
from employees e
;

select *
from salaries s 
;

select *
from titles t 
;

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

