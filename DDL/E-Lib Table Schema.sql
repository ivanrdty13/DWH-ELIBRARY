-- public.libraries definition
CREATE TABLE public.libraries (
	library_id int NOT NULL,
	"name" varchar NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT libraries_pk PRIMARY KEY (library_id)
);

-- public.newtable collections
CREATE TABLE public.collections (
book_id SERIAL not null  primary key,
title varchar(500) not null,
author varchar(255) not null,
category varchar(100) not null
quantity integer not null check (quantity >= 0),
library_id integer not null references libraries (library_id)
);


create table public.users(
user_id  SERIAL primary key,
username varchar(500) not null,
email varchar(100) not null,
password varchar(100) not null
);



create table loan(
loan_id SERIAL primary key,
book_id int not null references collections (book_id),
user_id int not null references users (user_id),
library_id int not null references libraries (library_id),
loan_date timestamp not null,
loan_expired timestamp not null
)

--drop table hold
create table hold(
hold_id serial primary key,
queue int not null,
user_id int not null references users (user_id),
book_id int not null references collections (book_id),
library_id int not null references libraries (library_id)
)





