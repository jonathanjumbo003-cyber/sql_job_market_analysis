/* Question 3:  what are the in_demand skills in my field.
- I will look at the skills that appears in most job postings. only excluding those that have no job locations.
- I will also not mind if the salary column is empty, after all most job postings will not include salaries.
- I will limit my answers to the top 10 in_demand skills.
why? to understand the skills that are required in most jobs. */

SELECT
  skills.skills AS skill_name,
  COUNT(job_postings.job_id) AS demand_count
FROM luke_practice.job_postings_fact AS job_postings
LEFT JOIN luke_practice.skills_job_dim AS skill_to_job
  ON job_postings.job_id = skill_to_job.job_id
LEFT JOIN luke_practice.skills_dim AS skills
  ON skill_to_job.skill_id = skills.skill_id
WHERE
  job_postings.job_location IS NOT NULL
GROUP BY
  skill_name
ORDER BY
  demand_count DESC
LIMIT 10;

Add Query 3: Top In-Demand Data Analyst Skills.
