drop procedure if exists  q4_3;
DELIMITER $$
create procedure q4_3()
begin

select Count(DISTINCT(id)) as q4_3 from
(SELECT soldiers.id  
FROM city JOIN LanguageSoldiers JOIN LanguageFamilies JOIN families JOIN soldiers
WHERE LanguageSoldiers.lng = LanguageFamilies.lng AND soldiers.id = LanguageSoldiers.id AND city.cityid = families.cityid AND families.cityid = soldiers.cityid AND families.id = LanguageFamilies.id) as a;
END $$ 
DELIMITER ;

call q4_3 ();