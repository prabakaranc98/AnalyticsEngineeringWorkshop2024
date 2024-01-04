{{ config(materialized='view') }}

SELECT
    p.country,
    p.market,
    AVG(cpr.review_scores_cleanliness) AS avg_cleanliness_score,
    AVG(cpr.review_scores_checkin) AS avg_checkin_score,
    AVG(cpr.review_scores_communication) AS avg_communication_score
FROM {{ ref('combined_prop_rev') }} cpr
JOIN {{ ref('properties') }} p ON cpr.properties_id = p._ID
GROUP BY p.country, p.market
