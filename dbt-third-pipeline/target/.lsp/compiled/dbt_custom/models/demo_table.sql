-- Table: Physically created and saved on disk in DuckDB as a BASE TABLE.
-- Pre-aggregates data so queries are fast and don't recompute joins every time.
select
    user_id,
    user_name_clean,
    count(order_id) as total_orders,
    sum(amount) as total_spent
from "dev"."main"."demo_view"
group by
    user_id,
    user_name_clean