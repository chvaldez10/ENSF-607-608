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