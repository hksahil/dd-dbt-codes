
  
    
    
    create  table
      "dev"."main"."stg_customers__dbt_tmp"
  
    as (
      

select
    id as customer_id,
    name as customer_name,
    'active' as status
from users
    );
  
    
  