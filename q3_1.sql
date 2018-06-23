select soldiers.id,city.CityName,soldiers.FirstName,soldiers.LastName
from soldiers,city
where city.CityID=soldiers.CityID
and id NOT IN (SELECT soldiers.id FROM families,soldiers,city,LanguageSoldiers,LanguageFamilies where 
city.CityID=families.CityID
and families.CityID=soldiers.CityID and LanguageFamilies.lng=LanguageSoldiers.lng and LanguageSoldiers.id =soldiers.id and LanguageFamilies.ID=families.ID);