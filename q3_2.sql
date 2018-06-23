select city.CityName, families.FamilyName
from city, families 
where families.CityID=city.CityID
and ID NOT IN (SELECT families.ID FROM families,soldiers,city,LanguageSoldiers,LanguageFamilies 
where soldiers.CityID=city.CityID
and families.CityID=soldiers.CityID and LanguageFamilies.lng=LanguageSoldiers.lng and LanguageSoldiers.id =soldiers.id and LanguageFamilies.ID=families.ID);
