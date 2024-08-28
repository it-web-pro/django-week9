-- Insert Departments
INSERT INTO employee_department (name) VALUES
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Operations');


-- Insert Positions
INSERT INTO employee_position (name, description, department_id) VALUES
('Software Developer', 'Develops software applications.', 1),
('System Administrator', 'Maintains IT infrastructure.', 1),
('Network Engineer', 'Designs and manages computer networks.', 1),
('HR Manager', 'Oversees HR department.', 2),
('Recruiter', 'Recruits new employees.', 2),
('Payroll Specialist', 'Manages payroll.', 2),
('Accountant', 'Handles financial records.', 3),
('Financial Analyst', 'Analyzes financial data.', 3),
('Auditor', 'Conducts financial audits.', 3),
('Marketing Manager', 'Oversees marketing department.', 4),
('Content Creator', 'Creates marketing content.', 4),
('SEO Specialist', 'Optimizes search engine visibility.', 4),
('Operations Manager', 'Oversees operations department.', 5),
('Logistics Coordinator', 'Manages logistics.', 5),
('Warehouse Manager', 'Manages warehouse operations.', 5),
('Data Scientist', 'Analyzes data and provides insights.', 1),
('Product Manager', 'Oversees product development.', 4),
('Customer Support', 'Provides customer support.', 5),
('Sales Manager', 'Manages sales team.', 4),
('Quality Assurance', 'Ensures product quality.', 1);


-- Insert Employees
INSERT INTO employee_employee (first_name, last_name, gender, birth_date, hire_date, salary, position_id) VALUES
('John', 'Doe', 'M', '1980-01-01', '2005-01-01', 75000.00, 1),  -- Manager IT
('Jane', 'Smith', 'F', '1985-02-02', '2010-02-02', 70000.00, 4),  -- Manager HR
('Jim', 'Brown', 'M', '1990-03-03', '2015-03-03', 72000.00, 7),  -- Manager Finance
('Jill', 'Johnson', 'F', '1985-04-04', '2010-04-04', 71000.00, 10),  -- Manager Marketing
('Jack', 'Jones', 'M', '1995-05-05', '2020-05-05', 73000.00, 13),  -- Manager Operations
('Alice', 'Adams', 'F', '1985-04-12', '2010-06-20', 60000.00, 1),
('Bob', 'Baker', 'M', '1992-08-24', '2015-09-15', 55000.00, 1),
('Carol', 'Clark', 'F', '1988-11-30', '2012-11-01', 62000.00, 1),
('David', 'Davis', 'M', '1995-02-19', '2018-03-22', 48000.00, 1),
('Eve', 'Evans', 'LGBT', '1990-07-14', '2016-07-19', 58000.00, 1),
('Frank', 'Franklin', 'M', '1987-12-01', '2011-05-18', 59000.00, 1),
('Grace', 'Green', 'F', '1991-03-08', '2017-10-10', 53000.00, 1),
('Hank', 'Harris', 'M', '1989-09-27', '2014-08-16', 61000.00, 1),
('Ivy', 'Iverson', 'F', '1993-05-23', '2019-02-25', 47000.00, 1),
('Jack', 'Jackson', 'M', '1986-01-13', '2013-12-05', 56000.00, 11),
('Liam', 'Lewis', 'M', '1984-02-15', '2009-06-20', 65000.00, 12),
('Noah', 'Nelson', 'M', '1991-03-10', '2014-05-22', 59000.00, 13),
('Emma', 'Edwards', 'F', '1987-09-29', '2011-08-30', 63000.00, 14),
('Olivia', 'Owens', 'F', '1994-12-17', '2019-07-05', 52000.00, 15),
('Ava', 'Anderson', 'F', '1993-11-15', '2018-10-21', 50000.00, 16),
('Isabella', 'Ingram', 'F', '1986-05-27', '2010-03-14', 60000.00, 17),
('Sophia', 'Simpson', 'F', '1990-01-05', '2015-04-18', 58000.00, 18),
('Mason', 'Morris', 'M', '1989-06-23', '2013-02-19', 57000.00, 19),
('Logan', 'Lopez', 'M', '1995-08-11', '2018-11-12', 51000.00, 20),
('Lucas', 'Lewis', 'M', '1988-04-25', '2012-05-25', 62000.00, 1),
('Ethan', 'Evans', 'M', '1992-07-20', '2016-09-15', 54000.00, 2),
('James', 'Johnson', 'M', '1985-10-14', '2010-12-01', 61000.00, 3),
('Alexander', 'Alexander', 'M', '1991-03-30', '2017-01-05', 56000.00, 4),
('Benjamin', 'Brown', 'M', '1989-11-18', '2014-06-10', 60000.00, 5),
('Jack', 'James', 'M', '1993-02-07', '2019-02-20', 57000.00, 6),
('Oscar', 'Owen', 'M', '1986-05-15', '2013-11-22', 63000.00, 1),
('Ella', 'Elliot', 'F', '1989-10-30', '2014-07-15', 52000.00, 1),
('Charlotte', 'Chapman', 'F', '1991-06-18', '2017-02-28', 60000.00, 1),
('Mia', 'Miller', 'F', '1993-12-05', '2018-05-20', 61000.00, 1),
('Amelia', 'Adams', 'F', '1990-03-15', '2015-03-15', 59000.00, 1),
('Harper', 'Hughes', 'F', '1988-07-12', '2011-09-01', 58000.00, 1),
('Evelyn', 'Ellis', 'F', '1992-01-30', '2016-01-20', 55000.00, 1),
('Abigail', 'Andrews', 'F', '1985-09-20', '2010-03-25', 60000.00, 1);


-- Insert Projects
INSERT INTO employee_project (name, description, manager_id, due_date, start_date) VALUES
('Project Alpha', 'A top-secret project.', 1, '2024-12-31', '2024-01-01'),
('Project Beta', 'A marketing initiative.', 4, '2024-11-30', '2024-02-01'),
('Project Gamma', 'A financial review.', 3, '2024-10-31', '2024-03-01'),
('Project Delta', 'An HR reorganization.', 2, '2024-09-30', '2024-04-01'),
('Project Epsilon', 'An operational overhaul.', 5, '2024-08-31', '2024-05-01');


-- Associate Employees with Projects (assuming a many-to-many relationship table exists named 'employee_project_staff')
INSERT INTO employee_project_staff (project_id, employee_id) VALUES
(1, 1), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (1, 14),
(2, 2), (2, 15), (2, 16), (2, 17), (2, 18), (2, 19), (2, 20), (2, 21), (2, 22), (2, 23),
(3, 3), (3, 24), (3, 25), (3, 26), (3, 27), (3, 28), (3, 29), (3, 30),
(4, 4), (4, 1), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10),
(5, 5), (5, 2), (5, 3), (5, 4), (5, 6), (5, 7), (5, 8), (5, 9);


