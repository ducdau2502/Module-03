create database case_module_03;

use case_module_03;

create table account (
id_account int auto_increment primary key,
username varchar(255) not null,
password varchar(255) not null,
phone_number varchar(255) not null,
email varchar(255) not null,
address varchar(255) not null,
roll_no int default 1 check ( roll_no = 1 or roll_no = 0),
status int default 1 check ( status = 1 or status = 0)
);

create table category (
id_category int auto_increment primary key,
name_category varchar(255) not null,
description varchar(255) not null
);

create table post (
id_post int auto_increment primary key,
title varchar(255) not null,
content longtext not null,
date_create date not null,
id_account int not null,
id_category int not null,
foreign key (id_account) references account(id_account),
foreign key (id_category) references category(id_category)
);

create table comment (
id_comment  int auto_increment primary key,
id_account int not null,
id_post int not null,
foreign key (id_account) references account(id_account),
foreign key (id_post) references post(id_post)
);
