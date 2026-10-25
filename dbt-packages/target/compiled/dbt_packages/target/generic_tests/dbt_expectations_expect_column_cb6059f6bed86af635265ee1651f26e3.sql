




    with grouped_expression as (
    select
        
        
    
  


    

regexp_matches(status, '^[a-z_]+$', '')


 > 0
 as expression


    from "dev"."main"."02_great_expectations"
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors




