SELECT * FROM {{ ref('transform') }}
WHERE passenger_count <= 0