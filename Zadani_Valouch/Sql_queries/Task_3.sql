SELECT -- V�b�r po�adovan�ch sloupc� z tabulek 
    r.rental_id,
    f.title,
    r.rental_date,
    r.return_date,
    f.rental_rate, 
    CASE 
        WHEN r.return_date > DATEADD(DAY, 14, r.rental_date) THEN -- Pokud je datum vr�cen� po 14 dnech od v�p�j�ky, po��t�me pokutu
            DATEDIFF(DAY, DATEADD(DAY, 14, r.rental_date), r.return_date) * 0.01 * f.rental_rate
        ELSE
            0
    END AS penalty
FROM 
    rental r
JOIN 
    film f ON r.inventory_id = f.film_id -- Spojov�n� tabulek inventory a film
