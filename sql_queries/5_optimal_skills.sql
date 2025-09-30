WITH skill_demand AS
(
    select skills_dim.skill_id,
    skills_dim.skills,
    count(job_postings_fact.job_id) as demand
    FROM job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE salary_year_avg is not NULL AND
    job_title_short = 'Data Analyst' 
    -- job_location = 'India'
    GROUP BY skills_dim.skill_id
    
),average_salary AS (
    SELECT skills_job_dim.skill_id,
    Round(avg(salary_year_avg)) as Average_Salary
    FROM job_postings_fact
    JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE salary_year_avg is not NULL AND 
    job_title_short='Data Analyst' 
    -- job_location = 'India'
    GROUP BY skills_job_dim.skill_id
    
)

SELECT skill_demand.skill_id,
skill_demand.skills,
demand,
Average_Salary
FROM skill_demand
JOIN average_salary on skill_demand.skill_id=average_salary.skill_id
WHERE demand>10
ORDER BY 
Average_Salary DESC,
demand DESC
LIMIT 25