# sql---challenge
Module 9 - SQL challenge

**Background:**

I was hired as a data engineer at Pewlett Hackard (a fictional company) and led a project to perform data modeling, data engineering, and data analysis over the company's legacy employee database, which were six CSV files:
1. [titles.csv](https://github.com/rperez025/sql---challenge/blob/main/data/titles.csv)
2. [employees.csv](https://github.com/rperez025/sql---challenge/blob/main/data/employees.csv)
3. [departments.csv](https://github.com/rperez025/sql---challenge/blob/main/data/departments.csv)
4. [dept_manager.csv](https://github.com/rperez025/sql---challenge/blob/main/data/dept_manager.csv)
5. [dept_employee.csv](https://github.com/rperez025/sql---challenge/blob/main/data/dept_emp.csv)
6. [salaries.csv](https://github.com/rperez025/sql---challenge/blob/main/data/salaries.csv)

_REQUIREMENT 1: DATA MODELING_

I created an entity-relational diagram (ERD) on the Company's legacy employee database tables. Please refer to ERD at [01_Data_Modeling_ERD.png](https://github.com/rperez025/sql---challenge/blob/main/data/salaries.csv).

_REQUIREMENT 2: DATA ENGINEERING_

I used Postgres to create SQL script to create the 6 respective legacy employee database tables (schemas). I specified the data types,
primary keys, foreign keys, and other constraints. I ensured that the primary key columns in the tables were unique, and created composite keys where necessary. Additionally, I created the tables in an order that preserves the foreign keys constraints. Lastly, I imported the csv files to the respective 6 tables.

_REQUIREMENT 3: DATA ANALYSIS_

I created SQL queries to respond to the following analysis questions:
1. List the employee number, last name, first name, sex, and salary of each employee.
2. List the first name, last name, and hire date for the employees who were hired in 1986.
3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
6. List each employee in the Sales department, including their employee number, last name, and first name.
7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

Please refer to the [02_Data_Engineering_and_03_Data_Analysis_EmployeeSQL.sql](https://github.com/rperez025/sql---challenge/blob/main/EmployeeSQL/02_Data_Engineering_and_03_Data_Analysis_EmployeeSQL.sql) file for SQL queries responding to the above analysis questions.

**RESOURCES AND REFERENCES**

During the challenge, I referenced the following to aid in my understanding and completion of the assignment:

1. Reviewed and reperformed a majority of the class activites in my GitLab Working Folder
2. Watched the following Dr. A instructor videos:
   * [Creating a Database Table and basic Querying in PostgreSQL](https://www.youtube.com/watch?v=Gf-JUiYKWIw)
   * [SQL Day 01 - Activity 10 - Joining Bird Bands (Demo)](https://www.youtube.com/watch?v=dkam4b-6DJM)
   * [SQL Day 02 - Activity 11 - Mine the Subqueries (Demo)](https://www.youtube.com/watch?v=hHUntY6O-rs)
   * [SQL Day 03 - Activity 06 - Student Data Relationships (Demo)](https://www.youtube.com/watch?v=TCr9Zi-0JBo)
   * [SQL Day 03 - Activities 08 and 09 - GYM ERD (Demo)](https://www.youtube.com/watch?v=bMBo6mjSbKw)
   * [SQL Day 03 - Activities 10 and 11 - (Demo)](https://www.youtube.com/watch?v=npftGEiTsaY)
3. Used the following code provided by Dr. A to respond to analyis question 2: "USE BETWEEN as a part of the WHERE Clause for the
   hire_date from the employees table"
