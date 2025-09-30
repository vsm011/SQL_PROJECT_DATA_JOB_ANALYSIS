SELECT skills,
Round(avg(salary_year_avg)) as Average_Salary
FROM job_postings_fact
JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE salary_year_avg is not NULL AND 
job_title_short='Data Analyst' AND
job_location = 'India'
GROUP BY skills
ORDER BY Average_Salary DESC
LIMIT 20