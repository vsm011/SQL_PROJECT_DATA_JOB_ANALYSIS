WITH top_paying_jobs AS(
    SELECT 
    job_id,
    job_title,
    name as Company_Name,
    salary_year_avg
    FROM
    job_postings_fact
    LEFT JOIN company_dim ON company_dim.company_id = job_postings_fact.company_id
    WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'India' AND 
    salary_year_avg is not NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*,
skills
FROM top_paying_jobs
JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id