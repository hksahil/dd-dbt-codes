
    
    

with all_values as (

    select
        status as value_field,
        count(*) as n_records

    from "dev"."main"."stg_customers"
    group by status

)

select *
from all_values
where value_field not in (
    'active','inactive','pending'
)


