create database if not exists assignment2;
	use assignment2;

	create table if not exists Soldiers ( id int primary key, FirstName varchar(10),LastName varchar(10), CityID tinyint,Phone int);
	create table if not exists Families ( ID int primary key, FamilyName varchar(10), Phone1 int, Phone2 int, CityID tinyint);
	create table if not exists Regions (regionid tinyint primary key, RegionName varchar(20));
	create table if not exists City (CityID tinyint primary key, CityName varchar (20), regionid tinyint);

	create table if not exists LanguageFamilies (ID  int , lng varchar (10));
	create table if not exists LanguageSoldiers (id  int , lng varchar (10)); 
    
    	delimiter $$

	create trigger Hebrew_ON
	after insert on families 
	for each row
	begin 
		insert into LanguageFamilies (ID,lng) values (new.ID , 'Hebrew');
	end; $$

	delimiter ;
	insert into families (id,familyname,phone1,phone2,cityid) values (204,"Stark",550,551,4);


	insert into soldiers (id, firstname,lastname,cityid,phone) values (101,"zahar","adiniaev",2,501);
	insert into soldiers (id, firstname,lastname,cityid,phone) values (100,"tomer","hekmati",1,500);
	insert into soldiers (id, firstname,lastname,cityid,phone) values (102,"tal","yahav",3,502);
	insert into soldiers (id, firstname,lastname,cityid,phone) values (103,"guy","adler",4,503);

	insert into families (id,familyname,phone1,phone2,cityid) values (200,"Livni",510,511,1);
	insert into families (id,familyname,phone1,phone2,cityid) values (201,"Mufaz",520,521,2);
	insert into families (id,familyname,phone1,phone2,cityid) values (202,"Bibi",530,531,3);
	insert into families (id,familyname,phone1,phone2,cityid) values (203,"Alfi",540,541,4);

	insert into regions (regionid,regionname) values (01,"Kalimdor");
	insert into regions (regionid,regionname) values (02,"Quel'thalas");
	insert into regions (regionid,regionname) values (03,"Blackrock");
	insert into regions (regionid,regionname) values (04,"Teldrassil");
	insert into regions (regionid,regionname) values (05,"Lordaeron");

	insert into city (cityid,cityname,regionid) values (1,"Winterfall",01);
	insert into city (cityid,cityname,regionid) values (2,"King's landing",02);
	insert into city (cityid,cityname,regionid) values (3,"Dorne",03);
	insert into city (cityid,cityname,regionid) values (4,"Braavos",04);

	insert into LanguageFamilies (id , lng) values (200,"English");
	insert into LanguageFamilies (id , lng) values (201,"Arabic");
	insert into LanguageFamilies (id , lng) values (202,"Russian");
	insert into LanguageFamilies (id , lng) values (203,"French");

	insert into LanguageSoldiers (id , lng) values (100,"English");
	insert into LanguageSoldiers (id, lng) values (101,"French");
	insert into LanguageSoldiers (id, lng) values (102,"English");
	insert into LanguageSoldiers (id, lng) values (103,"Arabic");


select * from LanguageFamilies;