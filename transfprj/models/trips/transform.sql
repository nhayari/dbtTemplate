WITH source_data AS (
    SELECT * EXCLUDE (VendorID, RatecodeID) 
    FROM {{ source('trips', 'tripsraw') }}
),

filtered_data AS (
    SELECT *
    FROM source_data
    WHERE 
        passenger_count > 0
        AND trip_distance > 0
        AND total_amount > 0
        AND tpep_pickup_datetime < tpep_dropoff_datetime
        AND store_and_fwd_flag = 'N'
        AND tip_amount >= 0
        AND payment_type IN (1, 2)
),

transformeddata AS (
    SELECT
        CAST(passenger_count AS BIGINT) AS passenger_count,

        CASE 
            WHEN payment_type = 1 THEN 'Credit card'
            WHEN payment_type = 2 THEN 'cash'
        END AS payment_method,

        DATE_DIFF('minute', tpep_pickup_datetime, tpep_dropoff_datetime) AS trip_duration_minutes,

        * EXCLUDE (passenger_count, payment_type)
    FROM filtered_data
)

SELECT * FROM transformeddata
WHERE trip_duration_minutes > 0