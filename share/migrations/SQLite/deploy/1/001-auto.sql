-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Mon Dec 31 23:16:39 2012
-- 

;
BEGIN TRANSACTION;
--
-- Table: user
--
CREATE TABLE user (
  user_id INTEGER PRIMARY KEY NOT NULL,
  handle varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  password text NOT NULL
);
CREATE UNIQUE INDEX user_email ON user (email);
CREATE UNIQUE INDEX user_handle ON user (handle);
COMMIT