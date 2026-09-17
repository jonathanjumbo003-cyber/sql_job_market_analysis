/* Question 2: skills for this top_paying remote Data Analyst jobs.
- We want to use our first querry to get the skills for this top paying remote jobs.
why? To understand the skills that causes the pay */

WITH top_paying_jobs AS (
SELECT
  job_postings.job_id AS job_id,
  job_postings.job_title,
  companies.name AS company_name,
  job_postings.salary_year_avg AS avg_salary,
  job_postings.job_posted_date AS posted_date
FROM luke_practice.job_postings_fact AS job_postings
LEFT JOIN luke_practice.company_dim AS companies
  ON job_postings.company_id = companies.company_id
WHERE
  (job_postings.job_location = 'Anywhere' AND job_postings.job_title_short = 'Data Analyst') AND
  job_postings.salary_year_avg IS NOT NULL
ORDER BY
  job_postings.salary_year_avg DESC
  LIMIT 10
)

SELECT
  top_paying_jobs.company_name,
  skills.skills AS skill_name,
  top_paying_jobs.avg_salary,
  top_paying_jobs.posted_date
FROM top_paying_jobs
INNER JOIN luke_practice.skills_job_dim AS skill_to_job
  ON top_paying_jobs.job_id = skill_to_job.job_id
INNER JOIN luke_practice.skills_dim AS skills
  ON skill_to_job.skill_id = skills.skill_id
ORDER BY
  top_paying_jobs.avg_salary DESC

Add Query 2: Top 10 Paying Remote Data Analyst Skills
top_paying_jobs.avg_salary DESC
