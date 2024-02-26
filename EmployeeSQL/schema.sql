DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Dept_Emp;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Titles;

CREATE TABLE IF NOT EXISTS Titles(
	title_id VARCHAR(5) PRIMARY KEY,
	title VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employees(
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10) NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	FOREIGN KEY(emp_title_id) references Titles(title_id)
);

CREATE TABLE IF NOT EXISTS Salaries(
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	FOREIGN KEY(emp_no) references Employees(emp_no)
);

CREATE TABLE IF NOT EXISTS Departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dept_Manager(
	dept_no VARCHAR(4),
	emp_no INT NOT NULL,
	FOREIGN KEY(emp_no) references Employees(emp_no),
	FOREIGN KEY(dept_no) references Departments(dept_no),
	PRIMARY KEY(dept_no, emp_no)
);

CREATE TABLE IF NOT EXISTS Dept_Emp(
	emp_no INT,
	dept_no VARCHAR(4),
	FOREIGN KEY(emp_no) references Employees(emp_no),
	FOREIGN KEY(dept_no) references Departments(dept_no),
	PRIMARY KEY(dept_no, emp_no)
);



