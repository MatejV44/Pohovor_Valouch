CREATE PROCEDURE AddNewFilm -- Vytvo�en� proced�ry k p�id�n� filmu
    @Title VARCHAR(255),
    @Description VARCHAR(255),
    @ReleaseYear INT,
    @LanguageId INT,
    @RentalDuration INT,
    @RentalRate DECIMAL(5,2)
AS
BEGIN
    -- Kontrola existence filmu
    IF EXISTS (
        SELECT 1 
        FROM film 
        WHERE title = @Title AND release_year = @ReleaseYear
    )
    BEGIN
        PRINT 'Film already exists';
        RETURN;
    END
    
    -- P�id�n� nov�ho filmu do tabulky film
    INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate)
    VALUES (@Title, @Description, @ReleaseYear, @LanguageId, @RentalDuration, @RentalRate);
END;