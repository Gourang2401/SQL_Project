/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from the first query
- Add the specific skills requirerd for these roles 
- Why? It provides a detailed look at which high-paying jobs demand certain skills,
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        (job_title_short = 'Data Analyst') AND
        job_location LIKE '%India'  AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC

/*
Here are the top insights from the "skills" column:

SQL is the most frequently mentioned skill, appearing in 7 postings.
Power BI is a strong contender, listed in 5 postings, highlighting its importance in visualization.
Skills related to database management, such as MongoDB and Oracle, appear 4 times each.
Python, Azure, AWS, and Excel are equally in demand, each appearing in 3 postings.
Tools for big data processing, like Spark and Databricks, also make the list but are less frequent.

[
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "python"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "mongo"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "mysql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "postgresql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sql server"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "azure"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "aws"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "redshift"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "oracle"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "spark"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "hadoop"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "power bi"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "oracle"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "salary_year_avg": "165000.0",
    "company_name": "Bosch Group",
    "skills": "sap"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "sql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "python"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "nosql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "scala"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "shell"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "databricks"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "aws"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "oracle"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "snowflake"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "spark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "pandas"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "pyspark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "airflow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "kafka"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "unix"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "linux"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "power bi"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "jenkins"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "flow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "salary_year_avg": "165000.0",
    "company_name": "Srijan Technologies",
    "skills": "gitlab"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "python"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "scala"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "go"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "no-sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "neo4j"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "azure"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "databricks"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "aws"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "oracle"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "spark"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "hadoop"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "power bi"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "salary_year_avg": "163782.0",
    "company_name": "Eagle Genomics Ltd",
    "skills": "gdpr"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "salary_year_avg": "119250.0",
    "company_name": "Deutsche Bank",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "salary_year_avg": "118140.0",
    "company_name": "ACA Group",
    "skills": "flow"
  },
  {
    "job_id": 554452,
    "job_title": "Data Analyst - Operations - Onboarding and Subscription Management",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skills": "sql"
  },
  {
    "job_id": 554452,
    "job_title": "Data Analyst - Operations - Onboarding and Subscription Management",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skills": "electron"
  },
  {
    "job_id": 554452,
    "job_title": "Data Analyst - Operations - Onboarding and Subscription Management",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skills": "excel"
  },
  {
    "job_id": 554452,
    "job_title": "Data Analyst - Operations - Onboarding and Subscription Management",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skills": "word"
  },
  {
    "job_id": 554452,
    "job_title": "Data Analyst - Operations - Onboarding and Subscription Management",
    "job_location": "Chennai, Tamil Nadu, India",
    "salary_year_avg": "111175.0",
    "company_name": "Arcadia",
    "skills": "powerpoint"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "company_name": "Avaloq",
    "skills": "sql"
  },
  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "company_name": "Avaloq",
    "skills": "power bi"
  },

  {
    "job_id": 943701,
    "job_title": "Data Analyst",
    "job_location": "Pune, Maharashtra, India",
    "salary_year_avg": "111175.0",
    "company_name": "Avaloq",
    "skills": "dax"
  }
] 
*/