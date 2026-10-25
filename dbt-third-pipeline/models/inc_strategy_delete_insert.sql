{{ config(
    materialized='incremental',
    incremental_strategy='delete+insert',
    unique_key='order_id'
) }}

{#
  ==============================================================================
  INCREMENTAL STRATEGY: DELETE + INSERT
  
  HOW IT WORKS:
  - Deletes any existing rows in the target table matching `unique_key`.
  - Then inserts the incoming fresh rows.
  - Useful on warehouses where SQL MERGE is slow or partitioned tables.
  ==============================================================================
#}

select
    order_id,
    user_id,
    amount,
    status,
    order_date
from orders

{% if is_incremental() %}
    -- Filter candidate batch using timestamp watermark
    where order_date >= (select coalesce(max(order_date), '1970-01-01') from {{ this }})
{% endif %}
