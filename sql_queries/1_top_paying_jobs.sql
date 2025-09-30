SELECT 
job_id,
job_title,
job_location,
job_schedule_type,
name as Company_Name,
salary_year_avg,
job_posted_date
FROM
job_postings_fact
LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
WHERE
job_title_short = 'Data Analyst' AND 
job_location = 'India' AND 
salary_year_avg is not NULL
ORDER BY salary_year_avg DESC
LIMIT 10