/* 
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest paying Data Analyst roles that are available in India.
- Focuses on job postings with specified salaries (remove nulls).
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employement opportunities 
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date::DATE,
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
LIMIT 10;

/*
[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "177283.0",
    "job_posted_date": "2023-06-28",
    "company_name": "ServiceNow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-10",
    "company_name": "Srijan Technologies"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-05-06",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "165000.0",
    "job_posted_date": "2023-01-12",
    "company_name": "Bosch Group"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-07-06",
    "company_name": "Eagle Genomics Ltd"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "job_location": "Hyderabad, Telangana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "163782.0",
    "job_posted_date": "2023-02-07",
    "company_name": "Eagle Genomics Ltd"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21",
    "company_name": "Deutsche Bank"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "job_location": "India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21",
    "company_name": "ACA Group"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "job_location": "Bengaluru, Karnataka, India",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-09-04",
    "company_name": "Razorpay"
  },
  {
    "job_id": 696686,
    "job_title": "Data Analyst",
    "job_location": "Gurugram, Haryana, India",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "111175.0",
    "job_posted_date": "2023-04-27",
    "company_name": "ChargePoint"
  }
]
*/
