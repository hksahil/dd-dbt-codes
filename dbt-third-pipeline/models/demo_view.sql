{{ config(materialized='view') }}

-- View: Recomputed on each query; created in DuckDB as a VIEW.
-- Notice how referencing an ephemeral model embeds it as an inline CTE.
select
    u.user_id,
    u.user_name_clean,
    o.order_id,
    o.amount
from {{ ref('demo_ephemeral') }} u
join orders o
    on u.user_id = o.user_id
