// Create employee nodes
CREATE (:Employee {name: 'John Doe', salary: 60000})
CREATE (:Employee {name: 'Jane Smith', salary: 65000})
CREATE (:Employee {name: 'Michael Johnson', salary: 70000})
CREATE (:Employee {name: 'Emily Brown', salary: 62000})
CREATE (:Employee {name: 'David Wilson', salary: 68000})
CREATE (:Employee {name: 'Jennifer Lee', salary: 67000})
CREATE (:Employee {name: 'Christopher Davis', salary: 73000})
CREATE (:Employee {name: 'Amanda Martinez', salary: 64000})
CREATE (:Employee {name: 'Ryan Taylor', salary: 71000})
CREATE (:Employee {name: 'Jessica Anderson', salary: 69000})

// Create manager nodes (Managers are also employees)
CREATE (:Manager:Employee {name: 'John Manager', salary: 80000})
CREATE (:Manager:Employee {name: 'Jane Manager', salary: 82000})
CREATE (:Manager:Employee {name: 'Michael Manager', salary: 85000})

// Create location nodes
CREATE (:Location {country: 'USA'})
CREATE (:Location {country: 'Canada'})
CREATE (:Location {country: 'UK'})

// Create team nodes
CREATE (:Team {name: 'Team A'})
CREATE (:Team {name: 'Team B'})
CREATE (:Team {name: 'Team C'})

// Assign employees to teams
MATCH (e:Employee), (t:Team)
WHERE e.name IN ['John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Brown', 'David Wilson',
                 'Jennifer Lee', 'Christopher Davis', 'Amanda Martinez', 'Ryan Taylor', 'Jessica Anderson']
AND t.name IN ['Team A', 'Team B', 'Team C']
CREATE (e)-[:Belongs_to {contract_type: 'full_time'}]->(t)

// Assign managers to teams
MATCH (m:Manager), (t:Team)
WHERE m.name IN ['John Manager', 'Jane Manager', 'Michael Manager']
AND t.name IN ['Team A', 'Team B', 'Team C']
CREATE (m)-[:Belongs_to {contract_type: 'full_time'}]->(t)

// Assign employees' location
MATCH (e:Employee), (l:Location)
WHERE e.name IN ['John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Brown', 'David Wilson',
                 'Jennifer Lee', 'Christopher Davis', 'Amanda Martinez', 'Ryan Taylor', 'Jessica Anderson']
AND l.country IN ['USA', 'Canada', 'UK']
CREATE (e)-[:Located_in]->(l)

// Establish manager-employee relationship
MATCH (e:Employee), (m:Manager)
WHERE e.name IN ['John Doe', 'Jane Smith', 'Michael Johnson', 'Emily Brown', 'David Wilson',
                 'Jennifer Lee', 'Christopher Davis', 'Amanda Martinez', 'Ryan Taylor', 'Jessica Anderson']
AND m.name IN ['John Manager', 'Jane Manager', 'Michael Manager']
CREATE (e)-[:Managed_by]->(m)
