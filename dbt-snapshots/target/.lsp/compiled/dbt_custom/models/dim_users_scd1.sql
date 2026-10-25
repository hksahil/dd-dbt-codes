

-- SCD Type 1 (Slowly Changing Dimension Type 1)
-- Strategy: Overwrite old values with new values.
-- Result: No historical record is preserved; always reflects the latest state.

select
    id as user_id,
    name as user_name
from "dev"."main"."users"