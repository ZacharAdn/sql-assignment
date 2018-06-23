drop procedure if exists  q47;
DELIMITER $$
create procedure q47()
begin
create TEMPORARY TABLE if not exists table1 AS (select city.regionid from city, families where families.CityID=city.CityID  GROUP BY regionid ORDER BY COUNT(*) DESC LIMIT 1);
select regionname from regions ,table1 where table1.regionid=regions.regionid;
end $$
DELIMITER;
call q47();