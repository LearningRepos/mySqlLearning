create database Instagram_Clone;

use instagram_clone;

create table Users(
    id int not null auto_increment primary key ,
    username varchar(255) unique not null ,
    created_at timestamp default now()
)

create table Photos(
    id int not null  auto_increment primary key ,
    image_url varchar(255) not null,
    user_id int not null ,
    created_at timestamp default now(),
    foreign key (user_id) references users(id)
)

create table Comments(
    id int not null auto_increment primary key ,
    comment_text varchar(255) not null ,
    user_id int not null ,
    photo_id int not null ,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id)
)

create table Likes(
    user_id int not null ,
    photo_id int not null ,
    created_at timestamp default now(),
    foreign key (user_id) references users(id),
    foreign key (photo_id) references photos(id),
    primary key (user_id,photo_id)
)

create table follows(
    follower_id int not null,
    followee_id int not null ,
    created_at timestamp default now(),
    foreign key (follower_id) references users(id),
    foreign key (followee_id) references users(id),
    primary key (follower_id,followee_id)
);

create table tags(
    id int auto_increment primary key ,
    tag_name varchar(255) unique ,
    created_at timestamp default now()
);

create table photo_tag(
    photo_id int not null,
    tag_id int not null,
    foreign key (photo_id) references photos(id),
    foreign key (tag_id) references tags(id),
    primary key (photo_id,tag_id)
)