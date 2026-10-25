



select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders


    -- Watermark filter: only fetch records modified on or after our table's latest date
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."demo_incremental")
