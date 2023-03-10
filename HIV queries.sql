--create hivdeaths table
CREATE TABLE HIVdeaths 
(Entity varchar(50),
 Code varchar(50), 
 Year int,Noofdeaths varchar(50));
 
--create hivnewcases table
CREATE TABLE HIVnewcases
 (Entity varchar (50),
 Code varchar (50),
 Year Int, 
 Incidence Int,
 Prevalence Int)
 
 INSERT INTO HIVnewcases VALUES
 ('Afghanistan','AFG', 1990,88,41.8),
 ('Afghanistan', 'AFG',1991, 104,49.5)
 
 SELECT *
 FROM hivdeaths
 
 SELECT *
 FROM hivnewcases
 
 DELETE FROM hivnewcases
 WHERE YEAR=1990
 
 ALTER TABLE hivnewcases
 DROP COLUMN prevalence 
 
 ALTER TABLE hivnewcases
 ADD prevalence VARCHAR(50)
 
 --all deaths and new cases
 SELECT hd.entity,hd.code,hd.year,noofdeaths,incidence,prevalence
 FROM hivdeaths hd
 JOIN hivnewcases hcs
 ON hd.entity=hcs.entity
 AND hd.year=hcs.year
 
 SELECT hd.entity,hd.code,hd.year,noofdeaths,incidence,prevalence
 FROM hivdeaths hd
 RIGHT JOIN hivnewcases hcs
 ON hd.entity=hcs.entity
 AND hd.year=hcs.year
 
 SELECT hd.entity,hd.code,hd.year,noofdeaths,incidence,prevalence
 FROM hivdeaths hd
 LEFT OUTER JOIN hivnewcases hcs
 ON hd.entity=hcs.entity
 AND hd.year=hcs.year
 
 SELECT hd.entity,hd.code,hd.year,noofdeaths,incidence,prevalence
 FROM hivdeaths hd
 INNER JOIN hivnewcases hcs
 ON hd.entity=hcs.entity
 AND hd.year=hcs.year 
 
 
 --select hiv data for 1990
SELECT entity, code, noofdeaths,incidence, prevalence
 FROM (SELECT hd.entity,hd.code,hd.year,noofdeaths,incidence,prevalence
 FROM hivdeaths hd
 INNER JOIN hivnewcases hcs
 ON hd.entity=hcs.entity
 AND hd.year=hcs.year) AS hivfull
 WHERE year=1990

