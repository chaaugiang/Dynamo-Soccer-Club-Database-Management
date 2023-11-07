# Dynamo Soccer Club (DSC)
MIST 4610 Project

## Team name and members:

- Thai Le, Alvia Pham, Essex Glowaki, Kenneth Johnson, McKenna Sloan


### Problem description:
Dynamo Soccer Club (DSC) is an established club based in Athens, Georgia. Founded in 1995, we have grown to become one of the premier soccer academies in the state. DSC offers training and competitive opportunities for children aged 4 to 18 and has adult leagues as well. Our mission is to provide the highest standard of soccer education with the aim to nurture talent and instill a love for the sport.
DSC boasts three full-sized soccer fields, a training ground with fitness facilities, a medical center, a clubhouse with a pro shop, administrative offices, locker rooms, and a snack bar. We offer training sessions, competitive matches, soccer camps during school holidays, and occasional events and workshops. DSC also provides coaching courses for aspiring soccer coaches. 


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



## Ten Queries

1. TP_Q1.This query identifies coaches with expired contracts, which is relevant from a managerial perspective for evaluating whether it is needed to renew, replace or renegotiate contracts.
<img width="327" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/f9516ad0-6408-4a7f-8a44-d42628395993">

2. This query calculates the average salary for male and female coaches, providing insights for managers to ensure that neither gender is receiving unfair compensation.
<img width="443" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/73795e3f-97bd-4d32-8b70-afb9ea16a645">

3. This query provides information on the average number of goals scored per match for each field. This is valuable to assess team performance and to make decisions on field allocation, especially considering whether or not playing on a certain field gives players an advantage.

<img width="496" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/b26cbaff-63c6-4b77-a9f5-4471a6300feb">

4. This query provides a list of tournaments held in China, sorted by date. This information is relevant for assessing scheduling and logistics of tournaments in a specific country, in this case, China.
<img width="248" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/1e2ed6e7-90cf-4df1-bd63-6c6065aba107">


5. This query calculates the percentage of players under the age of 25 for each team. This is relevant from a managerial perspective for assessing and managing the youth and experience levels within teams, which can be used to aid in player development strategies and recruitment decisions. It is especially important in evaluating which teams have players with the most years left playing, and therefore which teams will not be changing their player rotation soon.

<img width="415" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/3214e086-6f40-494f-b7de-c6c9cff73a92">


6. This query provides a list of the medical staff members, their salaries, and the number of matches they've worked (including those who haven't worked any matches). This is relevant from a managerial perspective for evaluating staff performance and workload, and making informed decisions regarding medical staff compensation and assignments.

<img width="271" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/25469683-dd78-42bc-8013-ec58d8d95713">


7. This query calculates the average age of players for each team and categorizes them as "Young," "Average," or "Tenure," which is relevant from a managerial perspective to assess the overall age profile and experience level of each team's players, aiding in player recruitment and development. 

<img width="319" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/1549f0f1-9596-4f8b-b423-0ee044afe4c4">


8. This query lists each team’s name, the number of matches they’ve played, the number of adminstrative staff members they employ, and the average salary for the administrative staff. This is relevant from a manager’s perspective because it allows them to evaluate whether multiple administrative staff members are helpful/necessary, and whether they should be compensated differently depending on the amount of work they do.

<img width="473" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/872f226d-5896-4afa-aae9-e6784a971f47">


9. This query calculates and provides each team's average number of red and yellow cards per game, offering valuable insights from a managerial perspective to assess and address player discipline, which is important for aiding in team management and game strategies.

<img width="530" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/23529b6f-6e08-47e1-982c-3322fdf82550">


10. This query provides a list of team names, player names, and player ages for players who are older than the average player age within their respective teams. This is relevant from a managerial perspective because it allows managers to identify players who might be retiring soon, so they can plan for replacements and contract management.
<img width="298" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/ff9b011e-a33f-41da-947d-99635c871526">


## Matrix

<img width="467" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/8fd4948c-7b9e-4dc7-854c-89468c8175f8">
<img width="469" alt="image" src="https://github.com/thai-tran-le/mist4610/assets/148096037/2a3ff205-2721-4b7d-9276-0f5ed34b7e7a">


