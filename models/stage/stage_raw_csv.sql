with raw_properties_data AS (
    SELECT * FROM {{ ref('properties') }}
)
select * from raw_properties_data
