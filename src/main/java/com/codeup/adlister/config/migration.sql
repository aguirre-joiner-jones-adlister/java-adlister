create database adlister_db;
USE adlister_db;

DROP TABLE IF EXISTS ad_category;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(240) NOT NULL,
    email VARCHAR(240) NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar VARCHAR(2045) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(240) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);

create table if not exists ad_category (
    ads_id int unsigned not null ,
    categories_id int unsigned not null,
    foreign key (ads_id) references ads (id)
                                       on delete cascade ,
    foreign key (categories_id) references categories (id)
                                       on delete cascade,
                                      constraint ac UNIQUE(ads_id, categories_id)
);

create table if not exists categories (
    id int unsigned auto_increment,
    name varchar(30) not null,
    primary key (id)

);

insert into categories (name) values
('clothes'),
('auto'),
('children'),
('pets'),
('miscellaneous'),
('home');
select * from categories;

show databases ;
use adlister_db;
show tables;

SELECT * FROM users;
SELECT * FROM ads;

insert into users(id,username,email,password,avatar)VALUE (1,'chris','chris@email.com', 'chris','');
insert into ads(user_id, title, description)VALUE (1, 'cats for sell', 'really skinny kitties');
insert into ads(user_id, title, description)VALUE (1, 'car for sell', 'really fast car');
insert into ads(user_id, title, description)VALUE (1, 'kids for sell', 'really skinny kids');
insert into ads(user_id, title, description)VALUE (1, 'house for sell', 'nice house comes with pets');
insert into ads(user_id, title, description)VALUE (1, 'good foozball', 'really good foozball');
insert into ads(user_id, title, description)VALUE (1, 'food', 'really good food');

insert into ad_category (ads_id, categories_id) VALUES(1,4),(1,1),(2,2),(6,3),(4,6),(2,4),(3,5),(1,5);
SELECT a.*, c.name FROM ads as a join ad_category as ac on a.id = ac.ads_id join categories as c on ac.categories_id = c.id;


select c.name from ads as a join ad_category ac on a.id = ac.ads_id
join categories c on ac.categories_id = c.id
where a.id = 1;