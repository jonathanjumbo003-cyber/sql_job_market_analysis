/* Qustion 4: the top paying skills based on salaries for my role.
- I will be looking at my role as a Data Analyst.
- I will not consider salaries that are null.
- And i will not be looking at jobs that require no skill.
why do this? well i want to compare this with question 3 and see if there is a relationship. */

SELECT
  skills.skills As skill_name,
  ROUND(AVG(job_postings.salary_year_avg), 2) AS avg_salary
FROM
  luke_practice.job_postings_fact AS job_postings
INNER JOIN `luke_practice.skills_job_dim` AS skill_to_job
  ON job_postings.job_id = skill_to_job.job_id
INNER JOIN `luke_practice.skills_dim` AS skills
  ON skill_to_job.skill_id = skills.skill_id
WHERE
  job_postings.job_title_short = 'Data Analyst' AND
  salary_year_avg IS NOT NULL
GROUP BY
  skills.skills
ORDER BY
  avg_salary DESC
LIMIT 20;

Add Query 4: Top Skills Based On Salary For Data Analyst.
