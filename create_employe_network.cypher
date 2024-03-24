////// STEP 1 ///////

// Create employee nodes
CREATE (:Employee {name: 'Haris', salary: 60000})
CREATE (:Employee {name: 'Salman', salary: 65000})
CREATE (:Employee {name: 'Ayesha', salary: 70000})
CREATE (:Employee {name: 'Waqas', salary: 62000})

CREATE (:Employee {name: 'Sidra', salary: 68000})
CREATE (:Employee {name: 'Ali', salary: 67000})

CREATE (:Employee {name: 'Shazaib', salary: 73000})
CREATE (:Employee {name: 'Kashif', salary: 64000})
CREATE (:Employee {name: 'Sana', salary: 71000})
CREATE (:Employee {name: 'Jawad', salary: 69000})

// Create manager nodes (Managers are also employees)
CREATE (:Manager:Employee {name: 'Kamran', salary: 80000})
CREATE (:Manager:Employee {name: 'Mehwish', salary: 82000})
CREATE (:Manager:Employee {name: 'Yousuf', salary: 85000})

// Create location nodes
CREATE (:Location {country: 'Karachi'})
CREATE (:Location {country: 'Lahore'})
CREATE (:Location {country: 'Islamabad'})

// Create team nodes
CREATE (:Team {name: 'Tech'})
CREATE (:Team {name: 'Admin'})
CREATE (:Team {name: 'Customer Support'})

////// STEP 2 ///////

// Assign employees to teams
MATCH (e:Employee), (t:Team)
WHERE e.name IN ['Haris', 'Salman', 'Ayesha']
AND t.name IN ['Tech']
CREATE (e)-[:Belongs_to {contract_type: 'full_time'}]->(t)

MATCH (e:Employee), (t:Team)
WHERE e.name IN ['Waqas']
AND t.name IN ['Tech']
CREATE (e)-[:Belongs_to {contract_type: 'part_time'}]->(t)

MATCH (e:Employee), (t:Team)
WHERE e.name IN ['Sidra', 'Ali']
AND t.name IN ['Admin']
CREATE (e)-[:Belongs_to {contract_type: 'full_time'}]->(t)

MATCH (e:Employee), (t:Team)
WHERE e.name IN ['Shazaib', 'Kashif', 'Sana', 'Jawad']
AND t.name IN ['Customer Support']
CREATE (e)-[:Belongs_to {contract_type: 'part_time'}]->(t)

////// STEP 3 ///////

// Assign managers to teams
MATCH (m:Manager), (t:Team)
WHERE m.name IN ['Kamran']
AND t.name IN ['Tech']
CREATE (m)-[:Belongs_to {contract_type: 'full_time'}]->(t)

MATCH (m:Manager), (t:Team)
WHERE m.name IN ['Mehwish']
AND t.name IN ['Admin']
CREATE (m)-[:Belongs_to {contract_type: 'full_time'}]->(t)

MATCH (m:Manager), (t:Team)
WHERE m.name IN ['Yousuf']
AND t.name IN ['Customer Support']
CREATE (m)-[:Belongs_to {contract_type: 'full_time'}]->(t)

////// STEP 4 ///////

// Assign employees' location
MATCH (e:Employee), (l:Location)
WHERE e.name IN ['Haris','Salman', 'Ayesha', 'Kamran', 'Sidra', 'Ali', 'Mehwish','Shazaib','Yousuf']
AND l.country IN ['Karachi']
CREATE (e)-[:Located_in]->(l)

MATCH (e:Employee), (l:Location)
WHERE e.name IN ['Kashif', 'Sana']
AND l.country IN ['Lahore']
CREATE (e)-[:Located_in]->(l)

MATCH (e:Employee), (l:Location)
WHERE e.name IN ['Waqas','Jawad']
AND l.country IN ['Islamabad']
CREATE (e)-[:Located_in]->(l)

////// STEP 5 ///////

// Establish manager-employee relationship
MATCH (e:Employee), (m:Manager)
WHERE e.name IN ['Haris', 'Salman', 'Ayesha', 'Waqas']
AND m.name IN ['Kamran']
CREATE (e)-[:Managed_by]->(m)

MATCH (e:Employee), (m:Manager)
WHERE e.name IN ['Sidra', 'Ali']
AND m.name IN ['Mehwish']
CREATE (e)-[:Managed_by]->(m)

MATCH (e:Employee), (m:Manager)
WHERE e.name IN ['Shazaib', 'Kashif', 'Sana', 'Jawad']
AND m.name IN ['Yousuf']
CREATE (e)-[:Managed_by]->(m)
