

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
