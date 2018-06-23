drop procedure if exists  q4_9;
DELIMITER $$
create procedure q4_9()
begin
create TEMPORARY TABLE if not exists table1 AS (select city.regionid from city, soldiers where soldiers.CityID=city.CityID  GROUP BY regionid ORDER BY COUNT(*) DESC LIMIT 1);
select regionname from regions ,table1 where table1.regionid=regions.regionid;
end $$
DELIMITER;
call q4_9();