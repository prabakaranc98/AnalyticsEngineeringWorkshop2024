-- transform.sql

WITH source_data AS (

    SELECT 
        _id,
        TRY_PARSE_JSON(review_scores) AS json_data
    FROM {{ ref('reviews') }}

),

expanded_reviews AS (

    SELECT 
        _id,
        json_data:review_scores_accuracy::INTEGER AS review_scores_accuracy,
        json_data:review_scores_cleanliness::INTEGER AS review_scores_cleanliness,
        json_data:review_scores_checkin::INTEGER AS review_scores_checkin,
        json_data:review_scores_communication::INTEGER AS review_scores_communication,
        json_data:review_scores_location::INTEGER AS review_scores_location
    FROM source_data

)
SELECT * FROM expanded_reviews
