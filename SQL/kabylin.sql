create database KABYLIN character set 'utf8mb4';

use KABYLIN;

create table USERS (
	id int auto_increment primary key,
    login varchar(20) not null unique key,
    `password` varchar(20) not null
    );
    
create table `PROFILES` (
	id int auto_increment primary key,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    email varchar(20) not null,
    age int(2)
    );
    
    create table GAMES (
	id int auto_increment primary key,
    first_player_id varchar(20) not null,
    second_player_id varchar(20) not null
    );
    
    create table GAME_RESULTS (
	id int auto_increment primary key,
    result_value varchar(4) not null
    );
    
    create table ACHIEVEMENTS (
	id int auto_increment primary key,
    achiev_name varchar(20) not null
    );
    
    create table PLAYER_ACHIEVS (
	id int auto_increment primary key,
    player_id varchar(20) not null,
    result_id varchar(4) not null,
    game_id int
    );
    
    create table PLAYER_ACHIEVS (
	id int auto_increment primary key,
    player_id varchar(20) not null,
    achiev_id int
    );
    
    alter table PLAYER_ACHIEVS
    rename to PLAYER_RESULTS;
 
insert into USERS (login, `password`) values 
('Cat', 'qwerty1'),
('Dog', 'qwerty2'),
('Mouse', 'qwerty3'),
('Rat', 'qwerty4'),
('Goose', 'qwerty5'),
('Cow', 'qwerty6'),
('GIrafe', 'qwerty7'),
('Hyppo', 'qwerty8'),
('Tiger', 'qwerty9'),
('Lion', 'qwerty'),
('Bat', 'qwerty0'),
('Fly', 'qwerty11'),
('Snake', 'qwerty12'),
('Bear', 'qwerty13'),
('Tusk', 'qwerty14')
;

insert into `profiles` (first_name, last_name, email, age) values 
('Pavel', 'Kabylin', 'slam4ik@yandex.ru', 33),
('Paul', 'Smith', 'paulsmith@gmail.com', 25),
('Dolce', 'Gabbana', 'dolce@gmail.com', 70),
('Jared', 'Leto', 'jaredleto@gmail.com', 45),
('Daniel', 'Negreanu', 'dnegs@gmail.com', 47),
('Leonel', 'Messi', 'leomessi@gmail.com', 32),
('David', 'Backham', 'manuntd@gmail.com', 40),
('Tiger', 'Woods', 'golfgod@gmail.com', 43),
('Sasha', 'Grey', 'sasha@gmail.com', 27),
('Ronnie', 'Osullivan', 'snookergod@gmail.com', 44)
;

insert into game_results (result_value) values 
('WIN'),
('LOSE'),
('DRAW')
;

insert into achievements (achiev_name) values 
('Newbie'),
('Master'),
('PRO'),
('Semi-pro'),
('Advanced'),
('GOD')
;

delete 
	from users
		where id = 14
	;

delete 
	from users
		where id = 15
	;
          
delete 
	from users
		where id = 13
	;          
          
delete 
	from users
		where id = 12
	;          

delete 
	from users
		where id = 11
	;
    
update `profiles`
	set id = case
						when id = 11 then 1
						when id = 12 then 2
                        when id = 13 then 3
                        when id = 14 then 4
                        when id = 15 then 5
                        when id = 16 then 6
                        when id = 17 then 7
                        when id = 18 then 8
                        when id = 19 then 9
                        when id = 20 then 10
                        else id
					end;     
                    
update `profiles`
	set first_name = 'Bob'
	where id = 5;
    
alter table users
add column profiles_id int after id;

update users
	set profiles_id = case
						when id = 1 then 1
						when id = 2 then 2
                        when id = 3 then 3
                        when id = 4 then 4
                        when id = 5 then 5
                        when id = 6 then 6
                        when id = 7 then 7
                        when id = 8 then 8
                        when id = 9 then 9
                        when id = 10 then 10
                        when id = 11 then 11
                        when id = 12 then 12
                        when id = 13 then 13
                        else profiles_id
					end;     
                    
insert into games values
(null, 1, 2),
(null, 2, 3),
(null, 3, 4),
(null, 5, 6),
(null, 6, 7),
(null, 8, 9),
(null, 10, 1),
(null, 1, 3),
(null, 2, 5),
(null, 3, 6); 

update games
	set first_player_id = case
						when id = 2 then 2
						when id = 5 then 6
                        when id = 8 then 5
                        else first_player_id
                        end;

insert into player_achievs values
(null, 1, 6),
(null, 2, 1),
(null, 3, 2),
(null, 4, 3),
(null, 5, 4),
(null, 6, 5),
(null, 7, 6),
(null, 8, 5),
(null, 9, 5),
(null, 10, 6),             
(null, 1, 3),
(null, 2, 3),
(null, 3, 4),
(null, 4, 6),
(null, 5, 1),
(null, 6, 1),
(null, 7, 1),
(null, 8, 3),
(null, 9, 2),
(null, 10, 4);

insert into player_results values
(null, 1, 1, 1),
(null, 2, 2, 1),
(null, 3, 3, 3),
(null, 4, 3, 3),
(null, 5, 1, 4),
(null, 6, 2, 4),
(null, 7, 1, 5),
(null, 8, 2, 6),
(null, 9, 1, 6),
(null, 10, 2, 7),
(null, 11, 1, 2),           
(null, 12, 2, 5),
(null, 13, 2, 8);

alter table GAMES
modify first_player_id int
;

alter table GAMES
modify second_player_id int
;

alter table USERS
add constraint FK_USERS
foreign key (profiles_id)
references `PROFILES` (id);

alter table games
add constraint FK_GAMES_PROFILES
foreign key (first_player_id)
references `PROFILES` (id);

alter table games
add constraint FK_GAMES_PROFILES_2
foreign key (second_player_id)
references `PROFILES` (id);

alter table player_achievs
modify player_id int
;

alter table player_achievs
modify achiev_id int
;

alter table player_achievs
add constraint FK_ACHIEVS_PROFILES
foreign key (player_id)
references `PROFILES` (id);

alter table player_achievs
add constraint FK_ACHIEVS_ACHIEVS
foreign key (achiev_id)
references ACHIEVEMENTS (id);

alter table player_results
add constraint FK_RESULTS_PROFILES
foreign key (player_id)
references `profiles` (id);

alter table player_results
modify player_id int
;

alter table player_results
modify result_id int
;

update player_results
	set id = case
						when id = 14 then 1
						when id = 15 then 2
                        when id = 16 then 3
                        when id = 17 then 4
                        when id = 18 then 5
                        when id = 19 then 6
                        when id = 20 then 7
                        when id = 21 then 8
                        when id = 22 then 9
                        when id = 23 then 10
						else id
					end;    

delete 
	from player_results
		where id = 24
	;          
          
delete 
	from player_results
		where id = 25
	;          

delete 
	from player_results
		where id = 26
;

alter table player_results
add constraint FK_RESULTS_GAMERESULTS
foreign key (result_id)
references game_results (id);

alter table player_results
add constraint FK_RESULTS_GAMES
foreign key (game_id)
references games (id);

use kabylin;

select   login,
		 first_name,
		 last_name
        from `PROFILES` as t1
        join users as t2 on t1.id = t2.profiles_id;
        
select  t1.id as player_id,
		first_name,
        email,
        achiev_name
        from `PROFILES` as t1
        join PLAYER_ACHIEVS as t2 on t1.id = t2.player_id
        join ACHIEVEMENTS as t3 on t2.achiev_id = t3.id
        where player_id < 6;

select  t1.id as player_id,
		first_name,
        last_name,
        email,
        age,
        t3.result_value as game_result
        from `PROFILES` as t1
        join PLAYER_RESULTS as t2 on t1.id = t2.player_id
        join GAME_RESULTS as t3 on t2.result_id = t3.id
        where result_id = 1;
        
select  login,
		`password`,
        t3.id as game_id
        from USERS as t1
        join `PROFILES` as t2 on t1.profiles_id  = t2.id
        join GAMES as t3 on t2.id = t3.first_player_id;
        
select  first_name,
		count(*) as count_of_games
		from `PROFILES` as t1
        join GAMES as t2 on t1.id = t2.id        
        group by t2.second_player_id
        order by count_of_games desc
		;
        
select  first_name,
		email
        from `PROFILES` as t1
		join GAMES as t2 on t1.id = t2.id
        group by t2.first_player_id;
        
select  t1.first_name,
		t1.email
		from `PROFILES` as t1
join (select first_player_id			      
				from GAMES) as t2 on t1.id = t2.first_player_id;


                            



        
		
        
        

