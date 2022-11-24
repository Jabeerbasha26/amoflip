create database amoflip;
use amoflip;
create table address(user_id int primary key,name varchar(25) not null,email varchar(30) not null, city varchar(20) not null, address varchar(220) not null, zipcode int not null, state varchar(20) not null);
create table sign_up(username varchar(25) not null, email varchar(30) not null, phone_number int unique, s_password varchar(12) not null, gender varchar(6), user_id int, foreign key(user_id) references address(user_id));
create table admin1(admin_id int primary key,admin_name varchar(20) not null, email varchar(30) not null, a_password varchar(12) not null, foreign key(admin_id) references sign_up(user_id));
create table coupon1(coupon_id int primary key, coupon_name varchar(20) not null, coupon_code bigint not null, discount_price int not null, expiry_date date not null,product_id int, foreign key(product_id) references products1(product_id),foreign key (coupon_id) references event1(event_id)) ;
create table payment(payment_id int primary key, name_card varchar(20) not null, card_number bigint not null,exp_month int not null, exp_year int not null,cvv int not null, foreign key(payment_id) references coupon1(coupon_id), user_id int, foreign key(user_id) references sign_up(user_id));
create table products1(product_id int primary key, product_name varchar(20) not null, product_type varchar(30) not null, product_price int not null, product_description varchar(30) not null,constraint pk_fl  primary key(product_id,product_price));
create table h_help(h_name varchar(30) not null, h_email varchar(30) not null, phone_number int not null, h_description varchar(50), user_id int, foreign key(user_id) references address(user_id));
create table paymentmodal(fullname varchar(30) not null, email varchar(30) not null, address varchar(50) not null, city varchar(15) not null, state varchar(20) not null, zipcode int not null, coupon_id int, foreign key(coupon_id) references coupon1(coupon_id));
create table cart(product_id int unique,product_name varchar(20) not null,quantity int not null,foreign key(product_id) references products1(product_id));
create table event1(event_id int primary key,event_name varchar(30) not null,start_date date not null,end_date date not null);   



jjjj