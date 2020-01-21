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
                                       on delete cascade
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

SELECT * FROM ads;

insert into ads(user_id, title, description)VALUE (2, 'cats for sell', 'really skinny kitties');
insert into ads(user_id, title, description)VALUE (2, 'car for sell', 'really fast car');
insert into ads(user_id, title, description)VALUE (2, 'kids for sell', 'really skinny kids');

insert into ad_category (ads_id, categories_id) VALUES(7,4),(8,2),(9,3);
SELECT a.*, c.name FROM ads as a join ad_category as ac on a.id = ac.ads_id join categories as c on ac.categories_id = c.id;
