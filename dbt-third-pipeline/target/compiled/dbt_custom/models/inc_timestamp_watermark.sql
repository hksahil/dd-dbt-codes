



select
    order_id,
    user_id,
    amount,
    status,
    order_date,
    -- Tracks when dbt processed/updated this version in the warehouse:
    current_timestamp as dbt_loaded_at
from "dev"."main"."orders"


    -- WATERMARK FILTER:
    -- Only scan source records whose date is on or after the max date in this table.
    -- In production with high data volumes, add a lookback window (e.g. - 3 days):
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from "dev"."main"."inc_timestamp_watermark")
