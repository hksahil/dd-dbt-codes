-- ========================================================
-- TYPE 3: Custom Generic Test (Macro)
-- Reusable across any model and column in your project!
-- Rule: Return rows that FAIL the assertion.
-- If 0 rows return -> TEST PASSES.
-- ========================================================

{% test is_positive(model, column_name) %}

select
    {{ column_name }} as invalid_value
from {{ model }}
where {{ column_name }} <= 0

{% endtest %}
