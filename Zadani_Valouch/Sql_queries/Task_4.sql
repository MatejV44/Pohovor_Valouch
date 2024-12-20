SELECT 
    st.store_id,                             
    s.staff_id,                             
    s.first_name + ' ' + s.last_name AS employee_name,  -- Jm�no zam�stnace
    YEAR(r.rental_date) AS rental_year,				 -- Rok z�p�j�ky
    COUNT(r.rental_id) AS number_of_rentals          -- Po�et z�p�j�ek
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id   -- Spojen� tabulek rental a inventory
JOIN 
    store st ON i.store_id = st.store_id             -- Spojen� tabulek inventory a store
JOIN 
    staff s ON r.staff_id = s.staff_id               -- Spojen� tabulek rental a staff
GROUP BY											 -- Seskupen� podle ID prodejny, ID zam�stnance, jm�na zam�stnance, p��jmem� zam�stance a roku zap�j�en�
    st.store_id,                                  
    s.staff_id,                                    
    s.first_name,                                  
    s.last_name,                                 
    YEAR(r.rental_date)                          
ORDER BY 
    st.store_id,                                     -- �azen� podle prodejny, ID zam�stnance a podle roku zap�j�en�
    s.staff_id,                                   
    rental_year;                                  