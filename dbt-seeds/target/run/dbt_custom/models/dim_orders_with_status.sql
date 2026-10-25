
  
    
    
    create  table
      "dev"."main"."dim_orders_with_status__dbt_tmp"
  
    as (
      

select
*
from orders o
left join "dev"."main"."country_codes" c
    on c.country_code = 'US'
    );
  
    
  