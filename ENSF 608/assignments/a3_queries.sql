use competition;

-- Query 1
-- Query for competitor first and last name and the name of the music studio

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

-- Query 2
-- count how many competitors belong to each music studio group
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

-- Query 3
-- count how many teachers belong to each music studio group
SELECT t.StudioName,
    COUNT(t.TeacherID) as NumberOfTeachers
FROM
    TEACHER t
GROUP BY
    t.StudioName;

-- Query 4
-- query for teachers who have more than one competitor
SELECT t.LName AS TeacherLastName
FROM
    TEACHER t
INNER JOIN
    COMPETITOR c on c.TeacherID=t.TeacherID
GROUP BY
    t.TeacherID
HAVING COUNT(t.TeacherID) > 1;

-- Query 5
-- query to competitor first and last names who are performing in Romantic genre along with the title of their chosen composition
SELECT
    c.FName, c.LName, comp.Title
FROM
    COMPETITOR c, PERFORMANCE p, COMPOSITION comp
WHERE
    c.CompetitorID=p.CompetitorID AND
    p.MusicID=comp.MusicID AND
    comp.Genre = "Romantic";

-- Query 6
-- list list all possible compositions and which categories they are currently being performed in
SELECT comp.Title, cat.Genre
FROM COMPOSITION comp
LEFT JOIN
    PERFORMANCE p on p.MusicId=comp.MusicID
LEFT JOIN
    CATEGORY cat on cat.CategoryID=p.CategoryID;

--- Query 7
-- Create a view that only lists the ages of competitors and scrores
CREATE VIEW SCORE_ANALYSIS AS
SELECT c.Age, p.Score
FROM COMPETITOR c, PERFORMANCE p
WHERE c.CompetitorID=p.CompetitorID;

--- Query 8
-- Sort SCORE_ANALYSIS by descending order
SELECT * FROM SCORE_ANALYSIS ORDER BY Score DESC;

-- Query 9
-- query to find the lowest, average, highest
SELECT 
    MAX(Score) AS HighestScore,
    MIN(Score) AS LowestScore,
    AVG(Score) AS AverageScore
FROM 
    SCORE_ANALYSIS;

-- Query 10
-- add new column
ALTER TABLE COMPOSITION
ADD COLUMN Copyright varchar(255) DEFAULT 'SOCAN';

SELECT * FROM COMPOSITION;

-- Query 11
-- find competitors that do not meet the age restriction
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
            c.age > cat.AgeMin AND
            c.age < cat.AgeMax
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

-- Query 12
-- add constraint to COMPETITOR
ALTER TABLE COMPETITOR
ADD CONSTRAINT CHK_AGERANGE CHECK (Age>=5 AND Age <=18);

-- Query 13
-- change Harmony Inc to Harmony Studio
UPDATE STUDIO
SET Name = 'Harmony Studio'
WHERE Name = 'Harmony Inc.';

SELECT * FROM STUDIO;
SELECT * FROM TEACHER;

-- Question 14
-- The error message encountered is due to the foreign key constraint in the PERFORMANCE table, which references the MusicID column in the COMPOSITION table. 

-- Question 15