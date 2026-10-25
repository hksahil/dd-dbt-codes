






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and amount >= 0 and amount <= 100000
)
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







