INSERT INTO cats_stat
SELECT ROUND(AVG(tail_length), 3)                                   AS tail_length_mean,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tail_length)     AS tail_length_median,
       ARRAY [MODE() WITHIN GROUP (ORDER BY tail_length)]           AS tail_length_mode,
       ROUND(AVG(whiskers_length), 3)                               AS whiskers_length_mean,
       PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY whiskers_length) AS whiskers_length_median,
       ARRAY [MODE() WITHIN GROUP (ORDER BY whiskers_length)]       AS whiskers_length_mode
FROM cats;