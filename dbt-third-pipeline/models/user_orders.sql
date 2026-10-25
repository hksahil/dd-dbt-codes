{{ config(materialized='table') }}

select
    u.name,
    o.order_id,
    o.amount
from users u
join orders o on u.id = o.user_id