

select
    order_id,
    user_id as customer_id,
    amount,
    status as order_status,
    order_date
from orders