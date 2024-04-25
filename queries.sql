USE ns_F2339217Group1;

#TP_Q1.This query identifies coaches with expired contracts, which is relevant from a managerial perspective for evaluating whether
it is needed to renew, replace or renegotiate contracts.

SELECT coachesName, coachesContractEnd
FROM Coaches
WHERE coachesContractEnd < (SELECT CURRENT_DATE());

#TP_Q2. This query calculates the average salary for male and female coaches, 
providing insights for managers to ensure that neither gender is receiving unfair compensation.

SELECT coachesGender, CONCAT("$", FORMAT(AVG(REPLACE(SUBSTRING_INDEX(coachesSalary, '$', -1), ",", "")), 2)) AS "Average Salary"
FROM Coaches
GROUP BY coachesGender;


#TP_Q3. This query provides information on the average number of goals scored per match for each field. 
This is valuable to assess team performance and to make decisions on field allocation, especially considering whether or 
not playing on a certain field gives players an advantage.

SELECT fieldsName, FORMAT(SUM(goalsScored)/SUM(idMatches), 2) AS "Goals per Match"
FROM Matches
JOIN Fields ON Matches.Fields_idFields = Fields.idFields
GROUP BY fieldsName
ORDER BY SUM(goalsScored)/SUM(idMatches) DESC;


#TP_Q4. This query provides a list of tournaments held in China, sorted by date. This information is relevant for assessing, scheduling, and logistics of tournaments in a specific country, in this case, China.

SELECT tournamentsDate, tournamentsLocation
FROM Tournaments
WHERE tournamentsLocation REGEXP 'China'
ORDER BY tournamentsDate;



#TP_Q5. This query calculates the percentage of players under the age of 25 for each team. This is relevant from a
managerial perspective for assessing and managing the youth and experience levels within teams, which can be used to 
aid in player development strategies and recruitment decisions. It is especially important in evaluating which teams have players with 
the most years left playing, and therefore which teams will not be changing their player rotation soon.

SELECT Teams.teamName, 
ROUND((SUM(CASE WHEN Players.playerAge < 25 THEN 1 ELSE 0 END) / COUNT(Players.idPlayers)) * 100)AS Under25Percentage
FROM Teams 
INNER JOIN Players ON Teams.idTeams = Players.Teams_idTeams
GROUP BY Teams.teamName;


#TP_Q6. This query provides a list of the medical staff members, their salaries, 
and the number of matches they've worked (including those who haven't worked any matches). This is relevant from a managerial perspective for evaluating 
staff performance and workload, and making informed decisions regarding medical staff compensation and assignments.

SELECT medicalStaffName, medicalStaffSanlary, COUNT(idMatches)
FROM MedicalStaff
LEFT JOIN MedicalStaff_has_Matches ON MedicalStaff.idMedicalStaff = MedicalStaff_has_Matches.MedicalStaff_idMedicalStaff
LEFT JOIN Matches ON Matches.idMatches= MedicalStaff_has_Matches.Matches_idMatches
GROUP BY medicalStaffName, medicalStaffSalary
ORDER BY medicalStaffSalary DESC;



#TP_Q7. This query calculates the average age of players for each team and categorizes them as "Young," "Average," or "Tenure," which is relevant from a managerial perspective to assess the overall age profile and experience level of each team's players, aiding in player recruitment and development.

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




#TP_Q8. This query lists each team’s name, the number of matches they’ve played, the number of adminstrative staff members they employ, and the average salary for the administrative staff. This is relevant from a manager’s perspective because it allows them to evaluate whether multiple administrative staff members are helpful/necessary, and whether they should be compensated differently depending on the amount of work they do.

SELECT teamName, matchesPlayed, COUNT(DISTINCT idAdminStaff) AS "# Admin Staff", CONCAT("$", FORMAT(AVG(REPLACE(SUBSTRING_INDEX(adminStaffSalary, '$', -1), ",", "")), 2)) AS "Average Salary"
FROM Teams
JOIN AdminStaff ON Teams.idTeams = AdminStaff.Teams_idTeams
GROUP BY teamName, matchesPlayed
ORDER BY COUNT(DISTINCT idAdminStaff) DESC;




#TP_Q9. This query calculates and provides each team's average number of red and yellow cards per game, offering valuable insights from a managerial perspective to assess and address player discipline, which is important for aiding in team management and game strategies.

SELECT teamName, ROUND(AVG(redCards),2) AS "Avg Redcards per Game", ROUND(AVG(yellowCards),2) AS "Avg Yellowcards per Game"
FROM Matches
JOIN Tournaments ON Tournaments.idTournaments = Matches.Tournaments_idTournaments
JOIN Tournaments_has_Sponsors ON Tournaments_has_Sponsors.Tournaments_idTournaments = Tournaments.idTournaments
JOIN Sponsors ON Tournaments_has_Sponsors.Sponsors_idSponsors = Sponsors.idSponsors
JOIN Sponsors_has_Teams ON Sponsors_has_Teams.Sponsors_idSponsors = Sponsors.idSponsors
JOIN Teams ON Teams.idTeams = Sponsors_has_Teams.Teams_idTeams
GROUP BY teamName
ORDER BY ROUND(AVG(redCards),2) DESC, ROUND(AVG(yellowCards),2) DESC;



#TP_Q10. This query provides a list of team names, player names, and player ages for players who are older than the average player age within their respective teams. This is relevant from a managerial perspective because it allows managers to identify players who might be retiring soon, so they can plan for replacements and contract management.

SELECT Teams.teamName, playerName, playerAge
FROM Teams 
JOIN Players ON Teams.idTeams = Players.Teams_idTeams
WHERE playerAge > (SELECT AVG(playerAge) FROM Players WHERE Teams.idTeams = Players.Teams_idTeams);
