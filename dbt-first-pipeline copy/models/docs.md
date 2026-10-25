# ========================================================
# REUSABILITY LESSON 2: docs.md (Reusable Doc Blocks)
# ========================================================
# Define business definitions once here.
# Any model in schema.yml can reuse them using {{ doc('...') }}.
# ========================================================

{% docs customer_id %}
The unique primary identifier assigned to a customer upon registration.
Used across staging, marts, and customer order analytics.
{% enddocs %}

{% docs order_amount %}
The gross transaction amount in USD before taxes and promotional discounts.
Must always be a positive value.
{% enddocs %}

{% docs order_status %}
Current lifecycle state of the customer order.
Allowed values: 'completed', 'processing', 'cancelled', 'refunded'.
{% enddocs %}
