use mysql;
drop database if exists humans_friends;
create database humans_friends;
use humans_friends;

drop table if exists animals;
create table animals(
	id int primary key,
	type varchar(50)
);

insert into animals values 
	(1, 'home_animals'),
	(2, 'pack_animals');

drop table if exists home_animals;	
create table home_animals(
	id int primary key,
	animalsID int,
	type_home_animals varchar(50),
	commands varchar(50),
	foreign key (animalsID) references animals(id)
);

insert into home_animals values 
	(1, 1, 'dogs','sit, lie, vioce, to me'),
	(2, 1, 'cats','kitty'),
	(3, 1, 'hamsters', 'run');


drop table if exists pack_animals;
create table pack_animals(
	id int primary key,
	animalsID int,
	type_pack_animals varchar(50),
	commands varchar(50),
	foreign key (animalsID) references animals(id)
);

insert into pack_animals values 
	(1, 2, 'horses', 'run, hop, trotting, step, stop'),
	(2, 2, 'camels','forward, stop, on right, on left, lie, get up'),
	(3, 2, 'donkeys','forward, stop, on right, on left');


drop table if exists dogs;
create table dogs(
	id int primary key,
	home_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (home_animalsID) references home_animals(id)
);


insert into dogs values
	(1, 1, 'Dusty', '2021-09-12'),
	(2, 1, 'Josh', '2016-06-04'),
	(3, 1, 'Zeus', '2020-07-16'),
	(4, 1, 'Rex', '2017-05-10');


drop table if exists cats;
create table cats(
	id int primary key,
	home_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (home_animalsID) references home_animals(id)
);

insert into cats values
	(1, 2, 'Josy', '2019-06-01'),
	(2, 2, 'Sammy', '2018-02-15'),
	(3, 2, 'Dotty', '2021-07-5');

drop table if exists hamsters;
create table hamsters(
	id int primary key,
	home_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (home_animalsID) references home_animals(id)
);


insert into hamsters values
	(1, 3, 'Muse', '2021-02-06'),
	(2, 3, 'Gordy', '2021-06-15'),
	(3, 3, 'Sunny',  '2020-05-09');

drop table if exists horses;
create table horses(
	id int primary key,
	pack_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (pack_animalsID) references pack_animals(id)
);

insert into horses values
	(1, 1, 'Barney', '2019-05-01'),
	(2, 1, 'Abner', '2016-04-15'),
	(3, 1, 'Davey', '2017-07-5'),
	(4, 1, 'Mat', '2013-06-12');


drop table if exists camels;
create table camels(
	id int primary key,
	pack_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (pack_animalsID) references pack_animals(id)
);

insert into camels values
	(1, 2, 'Spike', '2010-04-02'),
	(2, 2, 'Hunk', '2016-05-19'),
	(3, 2, 'Chad', '2014-02-05'),
	(4, 2, 'Pier', '2019-04-12');



drop table if exists donkeys;
create table donkeys(
	id int primary key,
	pack_animalsID int,
	name varchar(50),
	birthday date,
	foreign key (pack_animalsID) references pack_animals(id)
);


insert into donkeys values
	(1, 3, 'Randolph', '2017-04-18'),
	(2, 3, 'Nick', '2018-03-30'),
	(3, 3, 'Monty', '2017-11-21'),
	(4, 3, 'Neill', '2020-12-03');



drop table camels;
delete from pack_animals
where type_pack_animals = 'camels';

drop table if exists new_table;
create table new_table(id int primary key auto_increment)
	select pack_animalsID, name, birthday  from horses h 
	union
	select pack_animalsID, name, birthday from donkeys d;

drop table if exists young_animals;
create table young_animals(id int primary key auto_increment)
	select name,  
	(select (timestampdiff(year, birthday, curdate()))) as age from dogs
	where (timestampdiff(year, birthday, curdate())) between  1 and 3
	union
	select name,
	(select (timestampdiff(year, birthday, curdate()))) as age from cats 
	where (timestampdiff(year, birthday, curdate())) between  1 and 3 
	union
	select name,
	(select (timestampdiff(year, birthday, curdate()))) as age from hamsters 
	where (timestampdiff(year, birthday, curdate())) between  1 and 3
	union
	select  name,
	(select (timestampdiff(year, birthday, curdate()))) as age from new_table 
	where (timestampdiff(year, birthday, curdate())) between  1 and 3
	;

drop table if exists joined_table;
create table joined_table(id int primary key auto_increment)
	select home_animalsID, name, birthday from dogs
	union
	select home_animalsID, name, birthday from cats
	union
	select home_animalsID, name, birthday from hamsters 
	union
	select pack_animalsID, name, birthday from new_table;





