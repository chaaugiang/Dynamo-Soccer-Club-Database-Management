# Dynamo Soccer Club (DSC)
## Project Summary

In this project, we developed a comprehensive data model for Dynamo Soccer Club (DSC). Using SQL for data querying, we extracted valuable information and performed calculations to provide actionable insights in a managerial perspective.

## Technique Highlights
1. Date Comparison: Utilize CURRENT_DATE() function
2. Data Transformation & Aggregation: CONCAT(), FORMAT(), REPLACE(), COUNT(), MAX(), SUM(), ROUND()
4. Pattern Matching: REGEXP to filter data based on specific patterns.
5. Conditional Logic: Implement CASE statements to categorize data based on conditions.
6. Join Operations: INNER JOIN, LEFT JOIN, etc
7. Sorting: Organize query results using ORDER BY, GROUP BY to sort data based on specific criteria.
8. Subqueries: Incorporate subqueries within queries to perform comparisons and calculations.

## My Specific Contribution:

### 1. Mock Data Generation

#### Description: I was responsible for generating realistic mock data for the project. This involved creating datasets that would accurately represent the different entities and relationships within the Dynamo Soccer Club.
Tool Used: Mockaroo

### 2. Reverse Engineering into SQL Data Model
#### Description: I reverse-engineered the generated mock data into a structured SQL data model.
Steps Taken:
- Analyzed the mock data to identify key entities and their relationships.
- Establishing relationships using foreign keys to ensure referential integrity (e.g., team_id in the players table referencing teams table).
- Ensured the database was in at least the Third Normal Form (3NF) to enhance data integrity and reduce redundancy.

### 3. SQL Queries Development
#### Description: I developed several SQL queries to extract, transform, and analyze the data, providing actionable insights for DSC management.


## Insights Provided by This Project

1. Contract Management
   - Identifies coaches with expired contracts.
2. Salary Analysis
   - Calculates average salaries for male and female coaches.
   - Analyzes average salaries for administrative and medical staff.
3. Performance Metrics
   - Computes the average number of goals scored per match for each field.
   - Calculates the average number of red and yellow cards per game for each team.
4. Player Demographics
   - Determines the percentage of players under the age of 25 for each team.
   - Analyzes the average age of players for each team and categorizes them.
   - Identifies players older than the average age within their respective teams.
5. Event and Logistical Planning
   - Lists tournaments held in specific countries, sorted by date.
   - Provides the number of matches played and administrative staff employed for each team.
6. Staff Workload and Compensation
   - Lists medical staff members' salaries and the number of matches they've worked.



## Team name and members:

- Thai Le, Alvia Pham, Essex Glowaki, Kenneth Johnson, McKenna Sloan


### Problem description:
Dynamo Soccer Club (DSC) is an established club based in Athens, Georgia. Founded in 1995, we have grown to become one of the premier soccer academies in the state. DSC offers training and competitive opportunities for children aged 4 to 18 and has adult leagues as well. Our mission is to provide the highest standard of soccer education with the aim to nurture talent and instill a love for the sport.
DSC boasts three full-sized soccer fields, a training ground with fitness facilities, a medical center, a clubhouse with a pro shop, administrative offices, locker rooms, and a snack bar. We offer training sessions, competitive matches, soccer camps during school holidays, and occasional events and workshops. DSC also provides coaching courses for aspiring soccer coaches. 


## Queries & Insights

### 1. Expired Contracts: Identifies coaches with expired contracts to assist in renewal or replacement decisions

<img width="327" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/f9516ad0-6408-4a7f-8a44-d42628395993">

### 2.Salary Analysis: Calculates the average salary for male and female coaches to ensure fair compensation across genders

<img width="443" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/73795e3f-97bd-4d32-8b70-afb9ea16a645">

### 3.Goals per Match: Provides the average number of goals scored per match for each field to assess team performance and field advantage

<img width="496" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/b26cbaff-63c6-4b77-a9f5-4471a6300feb">

### 4.Tournaments in China: Lists tournaments held in China, sorted by date, to help with scheduling and logistics

<img width="248" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/1e2ed6e7-90cf-4df1-bd63-6c6065aba107">


### 5.Player Age Analysis: Calculates the percentage of players under 25 for each team to manage youth and experience levels, aiding in player development and recruitment strategies

<img width="415" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/3214e086-6f40-494f-b7de-c6c9cff73a92">


### 6.Player Age Analysis: Calculates the percentage of players under 25 for each team to manage youth and experience levels, aiding in player development and recruitment strategies

SELECT medicalStaffName, medicalStaffSanlary, COUNT(idMatches)
FROM MedicalStaff
LEFT JOIN MedicalStaff_has_Matches ON MedicalStaff.idMedicalStaff = MedicalStaff_has_Matches.MedicalStaff_idMedicalStaff
LEFT JOIN Matches ON Matches.idMatches= MedicalStaff_has_Matches.Matches_idMatches
GROUP BY medicalStaffName, medicalStaffSalary
ORDER BY medicalStaffSalary DESC;

<img width="271" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/25469683-dd78-42bc-8013-ec58d8d95713">


### 7.Player Age Categorization: Calculates the average age of players for each team and categorizes them as "Young," "Average," or "Tenure" to assess team age profiles and experience levels for recruitment and development

SELECT Teams.teamName, 
       ROUND(AVG(Players.playerAge), 2) AS AverageAge,
       CASE
           WHEN AVG(Players.playerAge) < 25 THEN 'Young'
           WHEN AVG(Players.playerAge) BETWEEN 25 AND 30 THEN 'Average'
           ELSE 'Tenure'
       END AS AgeCategory
FROM Teams 
JOIN Players ON Teams.idTeams = Players.Teams_idTeams
GROUP BY Teams.teamName;

<img width="319" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/1549f0f1-9596-4f8b-b423-0ee044afe4c4">


### 8.Administrative Staff Analysis: Lists each team’s matches, administrative staff count, and their average salary to evaluate staffing needs and compensation

SELECT teamName, matchesPlayed, COUNT(DISTINCT idAdminStaff) AS "# Admin Staff", CONCAT("$", FORMAT(AVG(REPLACE(SUBSTRING_INDEX(adminStaffSalary, '$', -1), ",", "")), 2)) AS "Average Salary"
FROM Teams
JOIN AdminStaff ON Teams.idTeams = AdminStaff.Teams_idTeams
GROUP BY teamName, matchesPlayed
ORDER BY COUNT(DISTINCT idAdminStaff) DESC;

<img width="473" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/872f226d-5896-4afa-aae9-e6784a971f47">


### 9.Player Discipline: Calculates each team's average number of red and yellow cards per game to assess and manage player discipline.

<img width="530" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/23529b6f-6e08-47e1-982c-3322fdf82550">


### 10.Older Players: Lists team names, player names, and ages for players older than their team's average age to identify those nearing retirement for planning replacements and contract management

SELECT Teams.teamName, playerName, playerAge
FROM Teams 
JOIN Players ON Teams.idTeams = Players.Teams_idTeams
WHERE playerAge > (SELECT AVG(playerAge) FROM Players WHERE Teams.idTeams = Players.Teams_idTeams);

<img width="298" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/ff9b011e-a33f-41da-947d-99635c871526">

## Data Model
<img width="697" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/6e125cf1-c5bd-44e5-8d04-b87965b080d2">

Our team’s data model is based on the different stores Kroger has across the United States. Each store has many relationships with other entities in the table. For example, a store has many transactions, and in those transactions are many items. A store can also make multiple payments to one vendor, and each of those payments would have one invoice. Likewise, a store has many departments, and each of those departments also have relationships with other entities. More specifically, a department can have many inventories, and in each inventory is the quantity of an item (e.g. the Bakery department has cupcakes and cookies, and the quantity of those items are 100 and 50 (respectively)). A department also has many orders, and each order contains many items. Each order is made through one delivery and contains one invoice; however, a vendor can have multiple orders.


## Data Dictionary

<img width="480" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/d06b7587-4c30-4aca-8120-2124fc056b0b">
<img width="477" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/605d9613-7164-4cac-9874-b3d9b2c3ad57">
<img width="477" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/a1053cea-73b8-4633-957e-4f2f785a4a39">
<img width="474" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/518d07aa-ba8e-43f6-9a32-1a1c8b5763d3">
<img width="476" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/d134fe91-bc92-4693-82be-daaa4462142f">
<img width="474" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/4d0026cc-f06a-49f8-8471-ad35e74092c5">
<img width="478" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/e75c9cb2-fc2e-40ce-a973-7d49c3f16af7">
<img width="485" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/476256bd-5b38-4e93-ae0d-2ef96205a012">
<img width="476" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/0d4a36df-7051-45f3-920a-b0d063b27ea4">
<img width="476" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/ab0ca8fa-0eb0-4875-a585-3da5618e030f">
<img width="476" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/b5b9b7fe-5624-4f83-a835-f11bffd92ca4">
<img width="476" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/3add5fd2-c95d-4512-ab47-d9c5527569a4">
<img width="477" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/0dcae9b4-aaaa-4942-b00e-6a15cddb7eac">
<img width="473" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/f449849f-cb2d-485b-8952-ee9d7f66a5e8">
<img width="470" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/4d8b2204-8ad2-4e2a-965d-232d6cd85498">
<img width="474" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/2738e6b9-c956-44c6-94f8-119f34d810f1">



## Matrix

<img width="467" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/8fd4948c-7b9e-4dc7-854c-89468c8175f8">
<img width="469" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/2a3ff205-2721-4b7d-9276-0f5ed34b7e7a">


