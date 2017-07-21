# Schema Information

## users
column name      | data type | details
-----------------|-----------|-----------------------
id               | integer   | not null, primary key
email            | string    | not null, indexed, unique
password_digest  | string    | not null
module_marker_id | integer   | not null, indexed
lesson_marker_id | integer   | not null, indexed
session_token    | string    | not null, indexed, unique

## units
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
name        | string    | not null
next_module | id        | not null
prev_module | id        | not null

## lessons
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
module_id   | integer   | not null, foreign key (references module)
name        | string    | not null

## Questions
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
lesson_id   | integer   | not null, foreign key (references lesson)

## Answers
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
title       | string    | not null
question_id | integer   | not null, foreign key (references questions)
value       | boolean   | not null
