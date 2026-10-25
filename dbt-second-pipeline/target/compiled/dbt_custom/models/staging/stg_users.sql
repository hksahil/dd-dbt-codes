-- Staging model: basic cleaning, renaming, and string transformations
select
    id as user_id,
    name as user_name,
    lower(trim(name)) as user_name_normalized,
    upper(name) as user_name_uppercase
from users