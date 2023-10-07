-- PROJECT I MADE IN BIGQUERY

**Project Title**: "Paris Filming Analysis"

**Project Description**: Analyze Paris filming data to identify popular locations, filming types, and durations. Insights benefit filmmakers, city planners, and tourism.

**Methodology and Difficulties**: Data cleaning, aggregation, and date calculations. Limitations due to dataset coverage.

**Conclusion**: Valuable findings for decision-making, but dataset limitations exist.

**Stepback**: Future work includes expanding data, considering budgets, and involving local stakeholders.


-- Types of Filming
SELECT DISTINCT Type_de_tournage
FROM `first-data-analytic-project.sql_project.paris_tournage`
ORDER BY Type_de_tournage;

-- Most Popular Places (Top 10)
SELECT Code_postal, COUNT(Code_postal) AS count_of
FROM `first-data-analytic-project.sql_project.paris_tournage`
GROUP BY code_postal
ORDER BY count_of DESC
LIMIT 10;

-- Duration of Filming with Titles
SELECT Identifiant_du_lieu, Titre, Date_de_d__but, Date_de_fin,
       DATE_DIFF(Date_de_fin, Date_de_d__but, DAY) AS number_of_days
FROM `first-data-analytic-project.sql_project.paris_tournage`
WHERE Date_de_fin >= Date_de_d__but
ORDER BY number_of_days DESC;

-- Percentage of Types of Filming for a Specific Year (e.g., 2019)
WITH Type_Percentages AS (
   SELECT Type_de_tournage, COUNT(*) AS num
   FROM `first-data-analytic-project.sql_project.paris_tournage`
   WHERE Ann__e_du_tournage = 2019
   GROUP BY Type_de_tournage
)
SELECT Type_de_tournage, num,
       ROUND(num / SUM(num) OVER () * 100, 2) AS percent_movies
FROM Type_Percentages;

-- Titles with Counts (Top 10)
SELECT DISTINCT Titre, COUNT(Titre) AS num
FROM `first-data-analytic-project.sql_project.paris_tournage`
GROUP BY Titre
ORDER BY num DESC
LIMIT 10;

-- Distinct Years in the Dataset
SELECT DISTINCT Ann__e_du_tournage
FROM `first-data-analytic-project.sql_project.paris_tournage`;
