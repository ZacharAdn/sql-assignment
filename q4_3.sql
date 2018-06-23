drop procedure if exists  q43;
DELIMITER $$
create procedure q43()
begin

select Count(DISTINCT(id)) as q43 from
(SELECT soldiers.id  
FROM city JOIN LanguageSoldiers JOIN LanguageFamilies JOIN families JOIN soldiers
WHERE LanguageSoldiers.lng = LanguageFamilies.lng AND soldiers.id = LanguageSoldiers.id AND city.cityid = families.cityid AND families.cityid = soldiers.cityid AND families.id = LanguageFamilies.id) as a;
END $$ 
DELIMITER ;

call q43 ();