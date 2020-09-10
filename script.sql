drop database if exists movies;

create database movies;
alter database movies character set utf8mb4 collate utf8mb4_unicode_ci;

use movies;

create table actor (
    id int auto_increment primary key not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

create table director(
    id int auto_increment primary key not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

#for the purpose of this homework, every movie can have only 1 director
create table movie(
    id int auto_increment primary key not null,
    name varchar(255),
    release_date date not null,
    won_oscar tinyint not null,
    director_id int not null,
    total_ratings_sum int default 0,
    total_ratings_count int default 0,
    FOREIGN KEY (director_id) REFERENCES director(id)
        on delete cascade
);

create table movie_actor(
    id int auto_increment primary key not null,
    actor_id int,
    movie_id int,
    role varchar(255),
    FOREIGN KEY (actor_id) REFERENCES actor(id)
    on delete cascade,
    FOREIGN KEY (movie_id) REFERENCES movie(id)
        on delete cascade

);

create table reviewer(
    id int auto_increment primary key not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null
);

create table movie_rating(
    id int auto_increment primary key not null,
    reviewer_id int,
    movie_id int,
    rating float,
    FOREIGN KEY (reviewer_id) REFERENCES reviewer(id)
        on delete cascade,
    FOREIGN KEY (movie_id) REFERENCES movie(id)
        on delete cascade
);

create trigger update_rating_on_insert
    after insert on movie_rating
    for each row
    update movie
    SET total_ratings_count = total_ratings_count + 1,
        total_ratings_sum = total_ratings_sum + NEW.rating
    WHERE id = NEW.movie_id;

create trigger update_rating_on_delete
    before delete on movie_rating
    for each row
    update movie
    SET total_ratings_count = total_ratings_count - 1,
        total_ratings_sum = total_ratings_sum - OLD.rating
    WHERE id = OLD.movie_id;

create trigger update_rating_on_update
    after update on movie_rating
    for each row
    update movie
    SET total_ratings_sum = total_ratings_sum - OLD.rating,
        total_ratings_sum = total_ratings_sum + NEW.rating
    WHERE id = NEW.movie_id;

insert into actor (first_name, last_name)
values ('Samuel L.', 'Jackson'),
       ('Bruce', 'Willis'),
       ('Christian', 'Bale'),
       ('Kevin', 'Spacey'),
       ('Tim', 'Roth'),
       ('Guy', 'Pearce'),
       ('Carrie Ann', 'Moss'),
       ('Keanu', 'Reeves'),
       ('Joe', 'Pantoliano'),
       ('Jennifer', 'Jason Leigh'),
       ('Hugo', 'Weaving'),
       ('John', 'Travolta'),
       ('Uma', 'Thurman'),
       ('Nicolas', 'Cage'),
       ('Sean', 'Connery'),
       ('Ed', 'Harris'),
       ('Heath', 'Ledger'),
       ('Morgan', 'Freeman'),
       ('Leonardo', 'DiCaprio'),
       ('Stephen', 'Baldwin'),
       ('Gabriel', 'Byrne'),
       ('Benicio', 'Del Toro'),
       ('Harvey', 'Keitel'),
       ('Michael', 'Madsen'),
       ('Tom', 'Cruise'),
       ('Jon', 'Voight'),
       ('Jean', 'Reno'),
       ('Natalie', 'Portman'),
       ('Gary', 'Oldman'),
       ('Milla', 'Jovovich'),
       ('Mark', 'Ruffalo'),
       ('Ben', 'Kingsley'),
       ('Ving', 'Rhames'),
       ('Josh', 'Hartnett')
       ;


insert into director (first_name, last_name)
values  ('Brad', 'Anderson'),
        ('Quentin', 'Tarantino'),
        ('Michael', 'Bay'),
        ('Christopher', 'Nolan'),
        ('Bryan', 'Singer'),
        ('Brian', 'De Palma'),
        ('Martin', 'Scorsese'),
        ('Luc', 'Besson'),
        ('Lana', 'Wachowski'),
        ('Paul', 'McGuigan')
        ;

insert into movie (name, release_date, won_oscar, director_id)
values ('Pulp fiction', STR_TO_DATE('21/10/1994', '%d/%m/%Y'),1,2),
       ('The rock', STR_TO_DATE('21/06/1996', '%d/%m/%Y'),0,3),
       ('The dark knight', STR_TO_DATE('24/07/2008', '%d/%m/%Y'),1,4),
       ('The usual suspects', STR_TO_DATE('25/08/1995', '%d/%m/%Y'),1,5),
       ('Reservoir dogs', STR_TO_DATE('15/01/1993', '%d/%m/%Y'),0,2),
       ('Mission impossible', STR_TO_DATE('05/07/1996', '%d/%m/%Y'),0,6),
       ('Shutter island', STR_TO_DATE('12/03/2010', '%d/%m/%Y'),0,7),
       ('Memento', STR_TO_DATE('20/10/2000', '%d/%m/%Y'),0,4),
       ('The machinist', STR_TO_DATE('18/03/2005', '%d/%m/%Y'),0,1),
       ('The fifth element', STR_TO_DATE('06/06/2007', '%d/%m/%Y'),0,8),
       ('Leon', STR_TO_DATE('03/02/1995', '%d/%m/%Y'),0,8),
       ('The matrix', STR_TO_DATE('11/06/1999', '%d/%m/%Y'),1,9),
       ('Lucky number slevin', STR_TO_DATE('24/02/2006', '%d/%m/%Y'),0,10)
       ;

insert into reviewer (first_name, last_name)
values ('Ivan', 'Ivanović'),
       ('Marko', 'Marković'),
       ('Luka', 'Lukić'),
       ('Ivana', 'Ivić'),
       ('Matej', 'Matić'),
       ('Mirko', 'Mirkić')
       ;

insert into movie_actor (movie_id, actor_id, role)
values (1,1,'Jules Winnfield'),
       (1,2,'Butch Coolidge'),
       (1,5,'Pumpkin'),
       (1,12,'Vincent Vega'),
       (1,13,'Mia Wallace'),
       (1,33,'Marsellus Wallace'),
       (2,16,'General Francis X. Hummel'),
       (2,14,'Stanley Goodspeed'),
       (2,15,'John Patrick Mason'),
       (3,3,'Bruce Wayne'),
       (3,17,'Joker'),
       (3,18,'Lucius Fox'),
       (3,29,'Gordon'),
       (4,4,'Verbal Kint / Keyser Soze'),
       (4,21,'Keaton'),
       (4,20,'McManus'),
       (4,22,'Fenster'),
       (5,23,'Mr. White / Larry'),
       (5,5,'Mr. Orange / Freddy'),
       (5,24,'Mr. Blonde / Vic Vega'),
       (6,25,'Ethan Hunt'),
       (6,26,'Jim Phelps'),
       (6,27,'Krieger'),
       (6,33,'Luther'),
       (7,19,'Teddy Daniels'),
       (7,31,'Chuck Aule'),
       (7,32,'Dr. Cawley'),
       (8,6,'Leonard'),
       (8,7,'Natalie'),
       (8,9,'Teddy'),
       (9,3,'Trevor Reznik'),
        (9,10,'Stevie'),
        (10,2,'Korben Dallas'),
        (10,30,'Leeloo'),
        (10,29,'Zorg'),
        (11,27,'Leon'),
        (11,29,'Stansfield'),
        (11,28,'Mathilda'),
        (12,8,'Neo'),
        (12,7,'Trinity'),
        (12,9,'Cypher'),
        (13,2,'Goodkat'),
        (13,18,'The boss'),
        (13,32,'The rabbi'),
        (13,34,'Slevin')
        ;

insert into movie_rating (movie_id, reviewer_id, rating)
values (1,1,10),
       (2,1,9),
       (3,1,7),
       (4,1,10),
       (5,1,7),
       (6,1,8),
       (8,1,9),
       (10,1,8),
       (13,1,8),
       (7,1,9),

       (1,2,8),
       (3,2,6),
       (4,2,10),
       (6,2,7),
       (8,2,9),
       (10,2,8),
       (11,2,9),
       (13,2,7),
       (12,2,6),
       (5,2,9),

       (1,3,7),
       (4,3,10),
       (5,3,8),
       (6,3,6),
       (8,3,9),
       (11,3,6),
       (12,3,9),
       (13,3,8),

       (1,4,6),
       (3,4,8),
       (5,4,7),
       (7,4,10),
       (10,4,8),

       (4,5,9),
       (5,5,7),
       (6,5,9),
       (10,5,8),
       (9,5,9),
       (12,5,10),
       (13,5,6),

       (1,6,7),
       (2,6,6),
       (4,6,9),
       (5,6,10),
       (8,6,7),
       (10,6,7),
       (12,6,6),
       (13,6,9),
       (3,6,8)
       ;


# SELECT

# list names and release dates of all movies made before 2000
select m.name, m.release_date
from movie as m
where m.release_date < STR_TO_DATE('01/01/2000', '%d/%m/%Y');

#list all movies and years they were released in (starting with the most recent movie)
select m.name, YEAR(m.release_date)
from movie m
order by m.release_date desc;

# get all movies directed by Quentin Tarantino
select m.name
from movie m
inner join director d on m.director_id = d.id
where d.last_name = 'Tarantino' and d.first_name = 'Quentin';

#get lowest rating of reviewer Mirko Mirkić
select min(mr.rating)
from reviewer r
inner join movie_rating mr on r.id = mr.reviewer_id
where r.first_name = 'Mirko' and r.last_name = 'Mirkić';

#get highest rating for movie Reservoir dogs
select max(mr.rating)
from movie m
inner join movie_rating mr on m.id = mr.movie_id
where m.name = 'Reservoir dogs';

# list first name, last name and role for all actors from the movie "The usual suspects"
select a.first_name, a.last_name, ma.role
from actor as a
inner join movie_actor ma on a.id = ma.actor_id
inner join movie m on ma.movie_id = m.id
where m.name = 'The usual suspects';

# list first and last name of all actors that starred in a movie which won an oscar (also include name of the movie)
select a.first_name, a.last_name, m.name
from actor as a
inner join movie_actor ma on a.id = ma.actor_id
inner join movie m on ma.movie_id = m.id
where m.won_oscar = 1;

# list top 3 rated movies (name and average rating), starting with the highest rated
select m.name, m.total_ratings_sum / m.total_ratings_count as average_rating
from movie as m
order by average_rating desc
limit 3;

#list all movies (name and number of reviews) with 5 or more reviews
select m.name, count(mr.id) as number_of_reviews
from movie as m
inner join movie_rating mr on m.id = mr.movie_id
group by m.name
having number_of_reviews > 4;

#list first and last name of the reviewers with less than 9 reviews (also include number of reviews)
select r.first_name, r.last_name, count(mr.id) as number_of_reviews
from reviewer r
inner join movie_rating mr on r.id = mr.reviewer_id
group by r.id
having number_of_reviews < 9;

# UPDATE
UPDATE movie_rating
SET rating = rating + 1
WHERE id = 2;

UPDATE movie_rating
SET rating = rating - 1
WHERE id = 4;

UPDATE movie_actor
SET role = concat('SPOILER ALERT ',role)
WHERE id = 14;

UPDATE director
SET first_name = 'Larry'
WHERE id = 9;

UPDATE reviewer
SET first_name = 'Matko'
WHERE id = 4;

#DELETE
delete
from director
WHERE id = 10;

delete
from movie
where name = 'Leon';

delete
from movie
where total_ratings_sum / total_ratings_count < 8;

delete
from movie_rating
where rating = 10;

delete
from movie_actor
where role like 'Mr.%';
































