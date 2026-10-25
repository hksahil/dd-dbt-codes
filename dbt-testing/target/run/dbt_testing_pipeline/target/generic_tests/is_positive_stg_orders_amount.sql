
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select
    amount as invalid_value
from "dev"."main"."stg_orders"
where amount <= 0


  
  
      
    ) dbt_internal_test