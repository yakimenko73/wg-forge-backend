INSERT INTO cat_colors_info
SELECT color, COUNT(*)
FROM cats
GROUP BY color
ORDER BY count;