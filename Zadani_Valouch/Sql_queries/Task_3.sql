SELECT -- Výbìr požadovaných sloupcù z tabulek 
    r.rental_id,
    f.title,
    r.rental_date,
    r.return_date,
    f.rental_rate, 
    CASE 
        WHEN r.return_date > DATEADD(DAY, 14, r.rental_date) THEN -- Pokud je datum vrácení po 14 dnech od výpùjèky, poèítáme pokutu
            DATEDIFF(DAY, DATEADD(DAY, 14, r.rental_date), r.return_date) * 0.01 * f.rental_rate
        ELSE
            0
    END AS penalty
FROM 
    rental r
JOIN 
    film f ON r.inventory_id = f.film_id -- Spojování tabulek inventory a film
