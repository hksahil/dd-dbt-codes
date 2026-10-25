{% snapshot users_snapshot1 %}

{{
    config(
      target_schema='main',
      unique_key='id',
      strategy='check',
      check_cols=['name'],
    )
}}

select
    id,
    name
from {{ source('raw_duckdb', 'users') }}

{% endsnapshot %}
