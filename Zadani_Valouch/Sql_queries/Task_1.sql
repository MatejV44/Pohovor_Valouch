SELECT -- Výbìr požadovaných sloupcù z tabulek 
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
	address AS a ON c.address_id = a.address_id -- Spojování tabulek customer a adress
JOIN
	city AS ci ON a.city_id = ci.city_id -- Spojování tabulek adress a city
JOIN
	country AS co ON ci.country_id = co.country_id -- Spojování tabulek city a country
JOIN 
	rental ON c.customer_id = rental.customer_id WHERE rental_date >= '2006-01-01' -- Spojování tabulek customer a rental, dále výbìr od roku 2006

-- Nebyl jsem si jistý, jestli po mnì skuteènì chcete prázdný výbìr za rok 2023, tudíž jsem použil výbìr pro pøedposlední rok z dostupných dat.