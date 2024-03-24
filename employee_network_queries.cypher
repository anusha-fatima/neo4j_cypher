// Retrieve all employees
MATCH (e:Employee)
RETURN e;

//Find employees belonging to a specific team
MATCH (e:Employee)-[:Belongs_to]->(t:Team {name: 'Tech'})
RETURN e;

// Get managers and their respective teams
MATCH (m:Manager)-[:Belongs_to]->(t:Team)
RETURN m, t;

// Find employees managed by a specific manager
MATCH (e:Employee)-[:Managed_by]->(m:Manager {name: 'Kamran'})
RETURN e;

// Calculate the total salary of employees
MATCH (e:Employee)
RETURN SUM(e.salary) AS total_salary;

// Find employees located in Lahore
MATCH (e:Employee)-[:Located_in]->(:Location {country: 'Lahore'})
RETURN e;

// Count the number of employees in each team
MATCH (e:Employee)-[:Belongs_to]->(t:Team)
RETURN t.name, COUNT(e) AS employee_count;

// Retrieve the highest salary among employees
MATCH (e:Employee)
RETURN MAX(e.salary) AS highest_salary;

// Calculate the average salary of all employees
MATCH (e:Employee)
RETURN AVG(e.salary) AS average_salary;

// Sum the salaries of full-time employees
MATCH (e:Employee)-[:Belongs_to {contract_type: 'full_time'}]->()
RETURN SUM(e.salary) AS full_time_salary;

// Find employees located in Karachi with a salary greater than 70000
MATCH (e:Employee)-[:Located_in]->(:Location {country: 'Karachi'})
WHERE e.salary > 70000
RETURN e;

