create database keepnote_1_new
use keepnote_1_new

create table User1
(
user1_id int primary key ,
user1_name varchar(50),
user_addeddate Date,
user_password varchar(30),
user_mobile varchar(50)
)
insert into User1 values(112233,'Maya','2019-01-02','Maya1214','9177516923'),(112244,'Nair','2019-01-11','Welcome','8186905967')
select * from User1
create table note(
note_id int primary key,
note_title varchar(50),
note_content varchar(50),
note_status varchar(50),
note_creationdate Date,
user1_id int
references User1(user1_id)
)
insert into note values(1,'Today Tasks','1.Check emails and reply to them 2.Start the pro','Inprogress','2019-01-21',112233),
(2,'Training to plan','1.Application related 2.Technical related','YetToStart','2019-01-31',112244),
(3,'Things to have today','1.Fruits 2.More Water','Inprogress','2019-01-25',112244 )

create table category
(
category_id int primary key,
category_name varchar(50),
category_descr varchar(50),
category_creation_date Date,
category_creator int
)
insert into category values(1,'Official','Office related notes','2019-01-21',112233),
                           (2,'Diet','Helath related issues','2019-01-24',112244)

create table reminder(
reminder_id int primary key,
reminder_name varchar(20),
reminder_descr varchar(30),
reminder_type varchar(40),
reminder_creationDate Date,
reminder_creator varchar(30)
)
insert into reminder values(1,'KT reminder','Session on1 technical querie','Office Reminders','2019-02-12','112233'),
                          (2,'Personal reminder','Pick children','Personal Reminders','2019-02-14','112244')


create table notecategory (
notecategory_id int primary key,
note_id int references note(note_id),
category_id int references category(category_id)
)
insert into notecategory values(1,1,1),(2,2,2),(3,3,2)

create table notereminder(
notereminder_id int primary key,
note_id int references note(note_id),
reminder_id int references reminder(reminder_id)
)
insert into notereminder values(1,3,2),(2,2,1)

select * from note
select * from category
select * from reminder
select * from notecategory
select * from notereminder
---1Fetch the row from User table with Id=112233 and Password=’Maya1214’

select * from User1 where user1_id=112233 and user_password='Maya1214'

---2Fetch all the rows from Note table with note_creation_date=’01/31/2019’.

select * from note where note_creationdate='2019-01-31'

---3Fetch all the Categories created after ‘01/22/2019’

select * from category where category_creation_date>'2019-01-22'


---4Fetch all category details which belongs to note with note id=1
select * from category inner join note on category.category_id=note.note_id where note_id=1

---5Fetch all the Notes from the Note table with userId=112244.
select * from note where user1_id=112244

---6Fetch all the Notes from the Note table for category_id=1.
select * from note inner join category on note.note_id=category_id where category_id=1

---7Fetch all the reminder details for note id=2.
select * from reminder inner join note on reminder.reminder_id=note.note_id where note_id=2

---8Write a query to change the note_status to ‘Completed’ with note Id=3.
update note set note_status='Completed' where note_id=3
select * from note

---9Write a query to set a reminder of type ‘Personal Reminders’ for Note with note id=1. [Find reminder id based upon reminder_type]
update  reminder  set reminder_type='Personal Reminders' from reminder  inner join note on reminder_id=note_id  where note_id=1
select * from reminder


---10Write a query to remove all reminders from Note with note_id=2.
delete from notereminder where note_id=2
select * from notereminder

--delete  reminder from reminder inner join note on reminder.reminder_id=note.note_id where note_id=2

