# sql_job_market_analysis
My first hands-on introduction to SQL and data cleaning came through Luke Barousse's course. This repository explores key insights from global job market data.

## Introduction

Intrigued by data and its practical applications, I dived into the world of data analytics using Luke Barousse's job market dataset. My goal was to explore the market potential for my role and map out a strategic learning path tailored to real industry needs.

I focused my investigation on **5 key questions**:

* 💰 **Top-Paying Roles:** Scoping out the highest-earning remote Data Analyst positions.
* 🔑 **Skills for the Big Bucks:** Identifying the exact skill sets tied to top-tier salaries.
* 📈 **Most Demanded Skills:** Counting overall job postings to see which skills companies want most.
* 🏷️ **Top-Paying Skills:** Pinpointing the tools that yield the highest average pay.
* 🎯 **Optimal Skills:** Uncovering the sweet spot—skills that are **both** in high demand and yield high salaries.

For **SQL Queries** check them out in the sql folder

## Background

All good things start with a question, and that exactly explains my perspective. 

I wasn't always intrigued by data, but during a class back in university, my professor gave a lecture on data, its real-world uses, and its endless potential. For some reason, that lesson stuck with me. Over the years, my curiosity kept growing until—*voilà*—I started cleaning raw datasets using Google Sheets, and today I write queries and clean data in SQL.

Enough about me, back to the data!

Driven by Luke Barousse's SQL course on the job market, the core aims of this analysis were to:

1. 💰 **Top-Paying Jobs:** Find the highest-paying roles in the Data Analyst field to scope out market potential.
2. 🔑 **Skills for Top Roles:** Discover the specific technical skills required for these high-earning positions.
3. 📈 **Most In-Demand Skills:** Identify the skills most frequently requested across all job listings.
4. 🏷️ **Top-Paying Skills:** Pinpoint which tools command the highest average salary.
5. 🎯 **Optimal Skills:** Uncover "optimal skills"—tools that are both in high demand and pay well, overcoming niche biases in pure salary data.

## Tools I Used

To clean the data and execute this analysis, I relied on:

* **SQL:** Essential for querying the dataset, saving time, and gaining a deeper understanding of the underlying data structure.
* **BigQuery Sandbox & Connected Sheets (Google Sheets):** Who says you need expensive software packages to analyze data? Technical know-how and understanding what you want to extract matter far more as an analyst—and for this project, these free cloud tools were more than sufficient.
* **GitHub:** Used to organize my SQL queries, track my project history, and showcase my findings.

## The Analysis

Every query in this section explores the overall potential of the Data Analyst job market, the high-earning skills required to reach that potential, and the baseline tools most employers are looking for today.

### 1. Top Paying Data Analyst Jobs

To identify the highest-earning opportunities, I filtered the dataset specifically for remote **Data Analyst** roles while excluding listings with missing compensation data (`WHERE salary_year_avg IS NOT NULL`). I selected the relevant job titles and salary figures, sorted the results from highest to lowest pay, and limited the output to the top 10 positions.

```sql
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
  LIMIT 10
  ```

* **SQL Query File:** [`sql/01_top_paying_jobs.sql`](sql/01_top_paying_jobs.sql)

#### Top 10 Highest-Paying Remote Roles

| Job Title | Company | Annual Salary | Location |
| :--- | :--- | :---: | :---: |
| **Data Analyst** | Mantys | $650,000 | Anywhere (Remote) |
| **Director of Analytics** | Meta | $336,500 | Anywhere (Remote) |
| **Associate Director - Data Insights** | AT&T | $255,830 | Anywhere (Remote) |
| **Data Analyst, Marketing** | Pinterest | $232,423 | Anywhere (Remote) |
| **Data Analyst (Hybrid/Remote)** | UCLA Health | $217,000 | Anywhere (Remote) |
| **Principal Data Analyst** | SmartAsset | $205,000 | Anywhere (Remote) |
| **Director, Data Analyst** | Inclusively | $189,309 | Anywhere (Remote) |
| **Principal Data Analyst, AV Performance** | Motional | $189,000 | Anywhere (Remote) |
| **Principal Data Analyst** | SmartAsset | $186,000 | Anywhere (Remote) |
| **ERM Data Analyst** | Get It Recruit | $184,000 | Anywhere (Remote) |

#### Key Insights:
* **The $650k Outlier:** Mantys tops the chart with an extraordinary $650,000 salary for a "Data Analyst" title, demonstrating that certain high-equity startup roles significantly skew upper salary ranges.
* **Leadership Commands Top Dollar:** High-earning positions heavily cluster around **Director** and **Principal** level roles (ranging from $186,000 to $336,500 at major firms like Meta, AT&T, and SmartAsset).
* **100% Remote Potential:** All top 10 postings offer full-time remote options ("Anywhere"), confirming that top-tier compensation isn't restricted by physical geographic location.


![Top Paying Roles](asstes/top_10_data_analyst_jobs.png)
*The graph below visualizes the top 10 highest-paying remote Data Analyst job postings identified through my SQL query. The visualization was generated with ChatGPT using the results returned by the query.*


These are the top-paying remote Data Analyst job postings based on our data. However, as explained earlier, this **should not** be taken as a general representation of how much a **remote Data Analyst earns**.

The analysis simply shows that some of the highest-paying postings are associated with senior and leadership-level roles, suggesting that compensation tends to increase as the level of responsibility and decision-making within a company increases.

The **Mantys** posting is a clear outlier in this dataset, with a salary of **$650,000**, far above the other postings. However, because it is an **outlier**, it should be interpreted carefully rather than used as evidence of a typical Data Analyst salary.

### 2. Top Paying Job Skills

To understand what tools top-paying roles demand, I joined the highest-earning job listings with the skills repository to see which technologies are most frequently required by top employers.

* **SQL Query File:** [`sql/02_top_paying_job_skills.sql`](sql/02_top_paying_job_skills.sql)

#### Most Requested Skills in Top-Paying Roles

| Skill | Mentions in Top Roles | Key Employers Requesting |
| :--- | :---: | :--- |
| **SQL** | **8** | AT&T, Pinterest, SmartAsset, Inclusively, Motional, UCLA Health |
| **Python** | **7** | AT&T, Pinterest, SmartAsset, Inclusively, Motional, Get It Recruit |
| **Tableau** | **6** | AT&T, Pinterest, SmartAsset, Inclusively, UCLA Health |
| **R** | **4** | AT&T, Pinterest, Motional, Get It Recruit |
| **Pandas** | **3** | AT&T, SmartAsset |
| **Excel** | **3** | AT&T, SmartAsset |
| **Snowflake** | **3** | SmartAsset, Inclusively |
| **AWS** | **2** | AT&T, Inclusively |
| **Azure** | **2** | AT&T, Inclusively |
| **Power BI** | **2** | AT&T, Inclusively |

![Top Paying Job Skills](assets/2_top_paying_job_skills.png)

#### Key Insights:
* **The Core Stack (SQL + Python):** SQL (80% presence) and Python (70% presence) form the backbone of top-earning Data Analyst job specs.
* **Visualization Preference:** Tableau leads the high-earning bracket with 6 mentions, outperforming Power BI (2 mentions) in these specific top-tier postings.
* **Cloud & Advanced Analytics Stack:** High-paying roles frequently request cloud databases (**Snowflake**, **AWS**, **Azure**) and Python libraries (**Pandas**, **NumPy**), showing that high compensation is tied to handling modern cloud infrastructure.
## What I learned

## Conclusion
