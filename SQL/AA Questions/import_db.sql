drop table if exists users;
drop table if exists questions;
drop table if exists question_follows;
drop table if exists replies;
drop table if exists question_likes;

pragma foreign_keys = on;

create table users (
  id integer primary key,
  fname text not null,
  lname text not null
);

create table questions (
  id integer primary key,
  title text not null,
  body text,
  poster_id integer not null,

  foreign key (poster_id) references users(id) 
);

create table question_follows (
  follower_id integer not null,
  question_followed_id integer not null,

  foreign key (follower_id) references users(id),
  foreign key (question_followed_id) references questions(id)
);

create table replies (
  id integer primary key,
  question_answered_id integer not null,
  parent_reply_id integer,
  writer_id integer not null,
  body text not null,

  foreign key (question_answered_id) references questions(id),
  foreign key (parent_reply_id) references replies(id),
  foreign key (writer_id) references users(id)
);

create table question_likes (
  id integer primary key,
  liker_id integer not null,
  question_liked_id integer not null,

  foreign key (liker_id) references users(id),
  foreign key (question_liked_id) references questions(id)
);

insert into users(fname, lname)
values 
('Ehad', 'Ehad'),
('Shtaim', 'Shtaim'),
('Shalosh', 'Shalosh'),
('Arba', 'Arba'),
('Hamesh', 'Hamesh');

insert into questions(title, body, poster_id)
values
('1?', '11111!!!', 1),
('another 1?', 'another 11111!!!', 1),
('2?', '22222!!!', 2),
('3?', '33333!!!', 3),
('4?', '44444!!!', 4),
('another 4?', 'another 44444!!!', 4),
('yet another 1?', 'yet another 11111!!!', 1),
('another 3?', 'another 33333!!!', 3);

insert into question_follows(follower_id, question_followed_id)
values
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(4, 6),
(1, 7),
(3, 8);

insert into replies(question_answered_id, parent_reply_id, writer_id, body)
values
(1, NULL, 2, "2 here, definitely 1!"),
(1, 1, 2, "2 here, replying to myself!"),
(1, 2, 3, "3 here, replying to 2!"),
(5, NULL, 4, "4 here, definitely 4!");

insert into question_likes(liker_id, question_liked_id)
values
(1, 1),
(5, 1),
(2, 2);


