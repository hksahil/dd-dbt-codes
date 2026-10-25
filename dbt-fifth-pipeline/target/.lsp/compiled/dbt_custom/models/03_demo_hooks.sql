

-- ========================================================
-- TEACHING TOPIC: Hooks (pre-hook & post-hook)
-- 1. pre_hook: SQL executed BEFORE this model builds
-- 2. post_hook: SQL executed AFTER this model builds
-- 3. Common uses: Audit logging, vacuuming, grant checks, partition management
-- ========================================================

select
    id as order_id,
    amount,
    current_timestamp as processed_at
from orders