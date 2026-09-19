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
## What I learned

## Conclusion
