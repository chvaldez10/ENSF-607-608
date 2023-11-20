use competition;

-- Question 1
-- Query for competitor first and last name and the name of the music studio
SELECT "Question 1";
SELECT
    c.FName,
    c.LName,
    s.Name
FROM
    COMPETITOR c
INNER JOIN
    TEACHER t on c.TeacherID=t.TeacherID
INNER JOIN
    STUDIO s on t.StudioName=s.Name;

-- Question 2
-- count how many competitors belong to each music studio group
SELECT "Question 2";
SELECT s.Name,
    COUNT(c.CompetitorID) as NumberOfCompetitors
FROM
    COMPETITOR c
INNER JOIN
    TEACHER t on c.TeacherID=t.TeacherID
INNER JOIN
    STUDIO s on t.StudioName=s.Name
GROUP BY
    s.Name;

-- Question 3
-- count how many teachers belong to each music studio group
SELECT "Question 3";
SELECT t.StudioName,
    COUNT(t.TeacherID) as NumberOfTeachers
FROM
    TEACHER t
GROUP BY
    t.StudioName;

-- Question 4
-- query for teachers who have more than one competitor
SELECT "Question 4";
SELECT t.LName AS TeacherLastName
FROM
    TEACHER t
INNER JOIN
    COMPETITOR c on c.TeacherID=t.TeacherID
GROUP BY
    t.TeacherID
HAVING COUNT(t.TeacherID) > 1;

-- Question 5
-- query to competitor first and last names who are performing in Romantic genre along with the title of their chosen composition
SELECT "Question 5";
SELECT
    c.FName, c.LName, comp.Title
FROM
    COMPETITOR c, PERFORMANCE p, COMPOSITION comp
WHERE
    c.CompetitorID=p.CompetitorID AND
    p.MusicID=comp.MusicID AND
    comp.Genre = "Romantic";

-- Question 6
-- list list all possible compositions and which categories they are currently being performed in
SELECT "Question 6";
SELECT comp.Title, cat.Genre, cat.CategoryID
FROM COMPOSITION comp
LEFT JOIN
    PERFORMANCE p on p.MusicId=comp.MusicID
LEFT JOIN
    CATEGORY cat on cat.CategoryID=p.CategoryID;

--- Question 7
-- Create a view that only lists the ages of competitors and scrores
SELECT "Question 7";
CREATE VIEW SCORE_ANALYSIS AS
SELECT c.Age, p.Score
FROM COMPETITOR c, PERFORMANCE p
WHERE c.CompetitorID=p.CompetitorID;

--- Question 8
-- Sort SCORE_ANALYSIS by descending order
SELECT "Question 8";
SELECT * FROM SCORE_ANALYSIS ORDER BY Score DESC;

-- Question 9
-- query to find the lowest, average, highest
SELECT "Question 9";
SELECT 
    MAX(Score) AS HighestScore,
    MIN(Score) AS LowestScore,
    AVG(Score) AS AverageScore
FROM 
    SCORE_ANALYSIS;

-- Question 10
-- add new column
SELECT "Question 10";
ALTER TABLE COMPOSITION
ADD COLUMN Copyright varchar(255) DEFAULT 'SOCAN';

SELECT * FROM COMPOSITION;

-- Question 11
-- find competitors that do not meet the age restriction
SELECT "Question 11";
SELECT c.CompetitorID, C.age
FROM
    COMPETITOR c
JOIN PERFORMANCE p ON c.CompetitorID=p.CompetitorID
WHERE
    NOT EXISTS(
        SELECT 1
        FROM 
            CATEGORY cat
        WHERE cat.CategoryID=p.CategoryID AND
            c.age >= cat.AgeMin AND
            c.age <= cat.AgeMax
    );


-- check for age restriction
-- SELECT 
--     C.FName AS FirstName,
--     C.LName AS LastName,
--     C.age as CompetitorAge,
--     CAT.AgeMin AS MinimumAge,
--     CAT.AgeMax AS MaximumAge
-- FROM 
--     COMPETITOR C
-- INNER JOIN 
--     PERFORMANCE P ON C.CompetitorID = P.CompetitorID
-- INNER JOIN 
--     CATEGORY CAT ON P.CategoryID = CAT.CategoryID;

-- Question 12
-- add constraint to COMPETITOR
# 
SELECT "Question 12";
ALTER TABLE COMPETITOR
ADD CONSTRAINT CHK_AGERANGE CHECK (Age>=5 AND Age <=18);

-- Question 13
-- change Harmony Inc to Harmony Studio
-- The MySQL command updates the name of a studio in the STUDIO table from 'Harmony Inc.' to 'Harmony Studio'. This change is automatically reflected in the TEACHER table due to the ON UPDATE CASCADE clause in its foreign key definition, which links StudioName in TEACHER to Name in STUDIO. Other tables are not directly affected as they don't have a foreign key relationship with STUDIO.

SELECT "Question 13";
UPDATE STUDIO
SET Name = 'Harmony Studio'
WHERE Name = 'Harmony Inc.';

SELECT * FROM STUDIO;
SELECT * FROM TEACHER;

-- Question 14
-- Attempting to delete records from the COMPOSITION table where the Composer is 'Beethoven' results in an error because this composition is referenced in the PERFORMANCE table. This is because the PERFORMANCE table has a foreign key constraint linking MusicID to the COMPOSITION table, enforcing referential integrity. The database prevents the deletion to maintain this integrity, leading to an error message indicating a foreign key constraint violation. 

DELETE FROM COMPOSITION WHERE Composer = 'Beethoven'; 

-- Question 15
-- This trigger is designed to prevent updates to the TEACHER table unless certain conditions are met (proof of certification). Whenever an attempt is made to update a row in the TEACHER table, this trigger will automatically execute before the update and will signal an error, displaying the specified message. 

CREATE TRIGGER Certification 
BEFORE UPDATE ON TEACHER FOR EACH ROW 
SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Proof of certification must be provided to the main office.'; 

-- test
-- UPDATE TEACHER
-- SET Phone = '587-555-1234'
-- WHERE TeacherID = '6598';