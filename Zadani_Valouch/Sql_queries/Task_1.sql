SELECT -- V�b�r po�adovan�ch sloupc� z tabulek 
	c.first_name, 
	c.last_name, 
	a.address, 
	a.district, 
	a.postal_code,
	ci.city,
	co.country
FROM 
	customer AS c 
JOIN
	address AS a ON c.address_id = a.address_id -- Spojov�n� tabulek customer a adress
JOIN
	city AS ci ON a.city_id = ci.city_id -- Spojov�n� tabulek adress a city
JOIN
	country AS co ON ci.country_id = co.country_id -- Spojov�n� tabulek city a country
JOIN 
	rental ON c.customer_id = rental.customer_id WHERE rental_date >= '2006-01-01' -- Spojov�n� tabulek customer a rental, d�le v�b�r od roku 2006

-- Nebyl jsem si jist�, jestli po mn� skute�n� chcete pr�zdn� v�b�r za rok 2023, tud� jsem pou�il v�b�r pro p�edposledn� rok z dostupn�ch dat.