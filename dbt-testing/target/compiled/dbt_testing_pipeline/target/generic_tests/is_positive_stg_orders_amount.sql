

select
    amount as invalid_value
from "dev"."main"."stg_orders"
where amount <= 0

