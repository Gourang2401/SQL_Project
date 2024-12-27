/*
Answer: What are the most optimal skills to learn (aka it's in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst riles
- Concentrates on india located positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location LIKE '%India'
    GROUP BY
        skills_dim.skill_id
),average_salary AS (
    SELECT 
        skills_dim.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_location LIKE '%India' 
    GROUP BY
        skills_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    demand_count DESC,
    avg_salary DESC
LIMIT 25;

/*
[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "46",
    "avg_salary": "92984"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "39",
    "avg_salary": "88519"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "36",
    "avg_salary": "95933"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "20",
    "avg_salary": "95103"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "18",
    "avg_salary": "86609"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "17",
    "avg_salary": "109832"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "15",
    "avg_salary": "98570"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "12",
    "avg_salary": "95333"
  },
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "11",
    "avg_salary": "118332"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "11",
    "avg_salary": "104260"
  }
]
*/