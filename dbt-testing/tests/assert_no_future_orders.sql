-- ========================================================
-- TYPE 2: Singular Test (Business Logic / Temporal Assertion)
-- Asserts that no order is timestamped in the future.
-- ========================================================

select
*
from {{ ref('stg_orders') }}
where order_date > current_date
