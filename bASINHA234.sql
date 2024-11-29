USE novdatabase;

alter table cidades RENAME TO Codigo_postal;

SELECT * FROM Codigo_postal;

ALTER TABLE Codigo_postal RENAME COLUMN Area to AreaKm2;

select AVG(AreaKm2) as MediaArea FROM Codigo_postal;

SELECT Nome, Codigo_Postal 
FROM Codigo_postal 
WHERE AreaKm2 > 80;

SELECT Distrito, Nome, População, AreaKm2
FROM codigo_postal
WHERE Codigo_Postal = 7830;