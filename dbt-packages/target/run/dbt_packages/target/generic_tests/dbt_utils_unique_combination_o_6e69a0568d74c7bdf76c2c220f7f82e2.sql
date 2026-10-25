
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  





with validation_errors as (

    select
        order_id, user_id
    from "dev"."main"."01_dbt_utils"
    group by order_id, user_id
    having count(*) > 1

)

select *
from validation_errors



  
  
      
    ) dbt_internal_test