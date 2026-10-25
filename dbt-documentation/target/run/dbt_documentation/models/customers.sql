
  
    
    
    create  table
      "dev"."main"."customers__dbt_tmp"
  
    as (
      

select
    id as customer_id,
    name as customer_name
from users
    );
  
    
  