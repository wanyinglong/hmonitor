drop database if exists hmonitor;
create database hmonitor;
use hmonitor;
create table USERS(id int not null AUTO_INCREMENT, name varchar(128) not null unique, mail varchar(128) not null unique, phone varchar(128) not null unique, password varchar(1024) not null, primary key (id), key(name));
create table USERS_TRIGGER_BINDING(id int not null AUTO_INCREMENT, user_id int not null, trigger_name varchar(256) not null, primary key(id), key(user_id), key(trigger_name));
create table TRIGGER_EVENTS(id int not null AUTO_INCREMENT, trigger_name varchar(256) not null, hostname varchar(256) not null, event varchar(256) not null, value varchar(256) not null, type varchar(128) not null default 'NORMAL', last_occur_time timestamp not null, first_occur_time timestamp not null, severity varchar(256) not null, occur_amount int not null, status varchar(128) not null, primary key (id), key(trigger_name), key(last_occur_time), key(first_occur_time), key(status), key(severity));
create table ALERT_MSG(id int not null AUTO_INCREMENT, mail varchar(128), phone varchar(128), trigger_name varchar(256) not null, hostname varchar(256) not null, send_time timestamp not null, primary key (id), key(send_time), key(trigger_name));
create table AUTOFIX_BINDING(id int not null AUTO_INCREMENT, trigger_name varchar(256) not null, auto_fix_script varchar(256) not null, change_user varchar(256) not null, change_date TIMESTAMP not null, primary key (id), key(trigger_name));
create table AUTOFIX_LOG(id int not null AUTO_INCREMENT, trigger_name varchar(256) not null, hostname varchar(256) not null, script varchar(256) not null, begin_time TIMESTAMP not null, status varchar(256) not null, event_id int not null, comments varchar(4096) not null default "", primary key (id), key(trigger_name), key(hostname), key(begin_time), key(status));

