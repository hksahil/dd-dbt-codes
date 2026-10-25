



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- Filter candidate batch using timestamp watermark
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_strategy_delete_insert")
