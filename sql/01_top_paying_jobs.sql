/* question: top paying jobs for my field (as a data analysyt)
- I want to hightlight the 10 top paying jobs for remote working analyst.
- I want to remove those with unspecified salaries.
Why do this? i want to use this highly targeted sample to get insights into the market potential of my field */

SELECT
  job_postings.job_id,
  job_postings.job_title,
  companies.name AS company_name,
  job_postings.job_location,
  job_postings.job_schedule_type,
  job_postings.salary_year_avg,
  job_postings.job_posted_date
FROM luke_practice.job_postings_fact AS job_postings
LEFT JOIN luke_practice.company_dim AS companies
  ON job_postings.company_id = companies.company_id
WHERE
  (job_postings.job_location = 'Anywhere' AND job_postings.job_title_short = 'Data Analyst') AND
  job_postings.salary_year_avg IS NOT NULL
ORDER BY
  job_postings.salary_year_avg DESC
  LIMIT 10;

Add Query 1: Top 10 Paying Remote Data Analyst Jobs
