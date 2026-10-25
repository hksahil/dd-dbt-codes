

select
    o.order_id,
    upper(trim(u.name)) as customer_name_cleaned,
    o.amount as raw_amount_cents,
    -- Macro converts cents to dollars:
    round(o.amount / 100.0, 2) as amount_dollars
from "dev"."main"."orders" o
left join "dev"."main"."users" u on o.user_id = u.id