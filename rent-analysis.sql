SELECT 
    city, 
    ROUND(AVG(price_monthly / size_sqm), 2) AS price_per_sqm
FROM rent_analysis
GROUP BY city
ORDER BY price_per_sqm DESC;

SELECT 
    city,
    is_furnished,
    ROUND(AVG(price_monthly), 2) AS avg_rent
FROM rent_analysis
GROUP BY city, is_furnished
ORDER BY city, is_furnished;

WITH CityAvg AS (
    SELECT city, AVG(price_monthly) as city_avg_price
    FROM rent_analysis
    GROUP BY city
)
SELECT r.city, r.district, r.price_monthly, r.building_age
FROM rent_analysis r
JOIN CityAvg ca ON r.city = ca.city
WHERE r.price_monthly < ca.city_avg_price 
  AND r.building_age < 15;