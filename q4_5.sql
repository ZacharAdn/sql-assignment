drop procedure if exists  q4_5;
DELIMITER $$

 create procedure q4_5()
 
 begin
create TEMPORARY TABLE if not exists table1 AS(
	select distinct fam.id,fam.familyname,cit.cityname,sol.personalid,sol.firstname, fam.phone1 as phone1, fam.phone2 as phone2, sol.phone as solider_phone
    from soldiers as sol join families as fam join city as cit join LanguageFamilies as famLan join LanguageSoldiers as solLan
    on sol.cityid=fam.cityid and solLan.lng=famLan.lng and fam.id=famLan.id and cit.cityid=sol.cityid and sol.personalid=solLan.personalid);

create TEMPORARY TABLE if not exists table2 AS ( 
	select distinct sol2.firstname as soliderName, sol2.personalid,cit2.cityname, solLan2.lng,cit2.regid as regid, sol2.phone as solider_phone
	from soldiers as sol2 ,city as cit2, LanguageSoldiers as solLan2
	where sol2.personalid=solLan2.personalid and sol2.cityid=cit2.cityid and sol2.personalid not in(select personalid from table1));

create TEMPORARY TABLE if not exists table3 AS ( 
	select  distinct fam3.familyname as fittedfamilies ,cit3.cityname,cit3.RegID, famLan.lng,
     fam3.phone1 as phone1, fam3.phone2 as phone2
	from families as fam3 ,city as cit3,LanguageFamilies as famLan
	where famLan.id=fam3.id and fam3.cityid=cit3.cityid and fam3.id not in(select id from table1));
	
create TEMPORARY TABLE if not exists table4 AS(
	select distinct soliderName,fittedfamilies,t2.cityname as soliderCity ,t3.cityname as familiesCity,
	t3.phone1, t3.phone2, t2.solider_phone , t2.personalid
	from  table2 as t2 join table3 as t3
	where t2.regid=t3.regid and t2.lng=t3.lng);

select * from soldiers where personalid not in (select personalid from table1 union all select personalid from table4);

END $$
DELIMITER ;
call q4_5 ();