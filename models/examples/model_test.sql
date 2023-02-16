--SELECT * FROM `dbt_srangelp.country_region`
with countries as (
    select 
    country_name as country,
    country_code as code
    FROM {{ source("test", "country_region") }}
)

SELECT * FROM countries;