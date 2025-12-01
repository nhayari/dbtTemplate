{{ config(
    materialized = 'table',
    alias = 'tripsraw'
) }}

-- Cette table ne sera téléchargée qu'une fois (ou à chaque full-refresh)
-- SELECT *
-- FROM read_parquet('https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-*.parquet')

SELECT * FROM read_parquet([
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-01.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-02.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-03.parquet',
    'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-04.parquet'
    -- ,
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-05.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-06.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-07.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-08.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-09.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-10.parquet',
    -- 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2025-11.parquet'
])