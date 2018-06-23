drop procedure if exists  findMatching2;
DELIMITER $$

 create procedure matching2(in num int)
begin
select soldiers.firstname,soldiers.LastName,soldiers.Phone,city.CityName,Families.familyname,Families.phone1,LanguageSoldiers.lng,LanguageFamilies.lng
from soldiers,city,Families,LanguageSoldiers,LanguageFamilies
where LanguageSoldiers.lng=LanguageFamilies.lng
and families.CityID=soldiers.CityID
and LanguageFamilies.ID=families.ID
and LanguageSoldiers.id=soldiers.id
and city.CityID=families.CityID
and num =soldiers.id;
END $$
DELIMITER ;matching2