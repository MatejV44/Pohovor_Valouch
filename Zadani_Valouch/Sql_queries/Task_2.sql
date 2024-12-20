SELECT 
    c.name AS category_name,
    COUNT(fc.film_id) AS number_of_films -- V�po�et film� v dann� kategorii
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id -- Spojuje tabulku category a film_category
GROUP BY 
    c.category_id, c.name	-- Skupinuje podle n�zvu kategorie
ORDER BY 
    number_of_films DESC;	-- �ad� podle po�tu film� sestupn�