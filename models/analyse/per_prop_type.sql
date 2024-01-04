{{ config(materialized='view') }}

WITH CountryPropertyCounts AS (
    SELECT
        p.country,
        p.property_type,
        COUNT(*) AS total_properties
    FROM {{ ref('properties') }} p
    GROUP BY p.country, p.property_type
),
CountryCounts AS (
    SELECT
        p.country,
        COUNT(*) AS total_country_properties
    FROM {{ ref('properties') }} p
    GROUP BY p.country
)

SELECT
    cpc.country,
    cpc.property_type,
    cpc.total_properties,
    cc.total_country_properties,
    (cpc.total_properties * 100.0 / cc.total_country_properties) AS property_type_percentage
FROM CountryPropertyCounts cpc
JOIN CountryCounts cc ON cpc.country = cc.country
