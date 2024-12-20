SELECT 
    st.store_id,                             
    s.staff_id,                             
    s.first_name + ' ' + s.last_name AS employee_name,  -- Jméno zamìstnace
    YEAR(r.rental_date) AS rental_year,				 -- Rok zápùjèky
    COUNT(r.rental_id) AS number_of_rentals          -- Poèet zápùjèek
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id   -- Spojení tabulek rental a inventory
JOIN 
    store st ON i.store_id = st.store_id             -- Spojení tabulek inventory a store
JOIN 
    staff s ON r.staff_id = s.staff_id               -- Spojení tabulek rental a staff
GROUP BY											 -- Seskupení podle ID prodejny, ID zamìstnance, jména zamìstnance, pøíjmemí zamìstance a roku zapùjèení
    st.store_id,                                  
    s.staff_id,                                    
    s.first_name,                                  
    s.last_name,                                 
    YEAR(r.rental_date)                          
ORDER BY 
    st.store_id,                                     -- Øazení podle prodejny, ID zamìstnance a podle roku zapùjèení
    s.staff_id,                                   
    rental_year;                                  