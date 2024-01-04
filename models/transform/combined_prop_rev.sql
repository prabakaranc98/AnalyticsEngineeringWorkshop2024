WITH properties_cte AS (
    SELECT
        _ID AS properties_id,
        NAME,
        PROPERTY_TYPE,
        ROOM_TYPE,
        BED_TYPE,
        BEDROOMS,
        MARKET,
        COUNTRY
        -- List other columns you're interested in from the properties table, e.g., column1 AS prop_column1
    FROM {{ ref('properties') }}
),

reviews_cte AS (
    SELECT
        _ID AS reviews_id,
        REVIEW_SCORES_ACCURACY,
        REVIEW_SCORES_CLEANLINESS,
        REVIEW_SCORES_CHECKIN,
        REVIEW_SCORES_COMMUNICATION,
        REVIEW_SCORES_LOCATION
        -- Add more review score columns as needed
    FROM {{ ref('review_transform') }}
)

SELECT *
FROM properties_cte p
JOIN reviews_cte r
ON p.properties_id = r.reviews_id