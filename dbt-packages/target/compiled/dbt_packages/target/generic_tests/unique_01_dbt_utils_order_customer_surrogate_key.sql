
    
    

select
    order_customer_surrogate_key as unique_field,
    count(*) as n_records

from "dev"."main"."01_dbt_utils"
where order_customer_surrogate_key is not null
group by order_customer_surrogate_key
having count(*) > 1


