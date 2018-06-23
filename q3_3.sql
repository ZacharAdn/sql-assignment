create TEMPORARY TABLE if not exists table1 AS(
	select distinct fam.id,fam.familyname,cit.cityname,sol.id,sol.firstname, fam.phone1 as phone1, fam.phone2 as phone2, sol.phone as phoneSol
	from soldiers as sol join families as fam join city as cit join LanguageFamilies as famLan join LanguageSoldiers as solLan
	on cit.cityid=sol.cityid and fam.id=famLan.id and sol.id=solLan.id and solLan.lng=famLan.lng and sol.cityid=fam.cityid);
    
create TEMPORARY TABLE if not exists table2 AS ( 
	select distinct sol2.firstname as solName, sol2.id ,cit2.cityname, solLan2.lng, cit2.regionid as regid, sol2.phone as phoneSol
	from soldiers as sol2 ,city as cit2, LanguageSoldiers as solLan2
	where sol2.id and sol2.id=solLan2.id and sol2.cityid=cit2.cityid not in(select id from table1));

create TEMPORARY TABLE if not exists table3 AS ( 
	select  distinct fam3.familyname as fittedfamilies ,cit3.cityname,cit3.RegID, famLan3.lng,
     fam3.phone1 as phone1, fam3.phone2 as phone2
	from families as fam3 ,city as cit3,LanguageFamilies as famLan3
	where famLan3.id=fam3.id and fam3.cityid=cit3.cityid and fam3.id not in(select id from table1));


select distinct solName,fittedfamilies,tab2.cityname as soliderCity ,tab3.cityname as familiesCity,
tab3.phone1, tab3.phone2, tab2.phoneSol
from table2 as tab2 join table3 as tab3
where tab2.lng=tab3.lng
and tab2.regid=tab3.regid;


   
