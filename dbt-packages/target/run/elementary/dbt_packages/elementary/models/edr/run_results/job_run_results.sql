
  
  create view "dev"."main"."job_run_results__dbt_tmp" as (
    





with jobs as (
  select
    job_name,
    job_id,
    job_run_id,
    
min(cast(run_started_at as timestamp))
 as job_run_started_at,
    
max(cast(run_completed_at as timestamp))
 as job_run_completed_at,
    
    
        (date_diff('second', 
min(cast(run_started_at as timestamp))
::timestamp, 
max(cast(run_completed_at as timestamp))
::timestamp ))
    
 as job_run_execution_time
  from "dev"."main"."dbt_invocations"
  where job_id is not null
  group by job_name, job_id, job_run_id
)

select
  job_name as name,
  job_id as id,
  job_run_id as run_id,
  job_run_started_at as run_started_at,
  job_run_completed_at as run_completed_at,
  job_run_execution_time as run_execution_time
from jobs
  );
