



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- In an immutable table, filtering on max(order_id) or max(order_date) is valid
    where order_date > (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_strategy_append")
