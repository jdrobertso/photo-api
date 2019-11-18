require 'mysql2'

DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_development") if Rails.env.development?
DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_test") if Rails.env.test?
DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_production") if Rails.env.production?

DB.query("DROP TABLE IF EXISTS AlbumPictures")
DB.query("DROP TABLE IF EXISTS UserAlbums")
DB.query("DROP TABLE IF EXISTS UserPictures")
DB.query("DROP TABLE IF EXISTS Locations")
DB.query("DROP TABLE IF EXISTS Pictures")
DB.query("DROP TABLE IF EXISTS Albums")
DB.query("DROP TABLE IF EXISTS Users")

DB.query("CREATE TABLE Albums (
  id int NOT NULL,
  name varchar(255),
  PRIMARY KEY (id)
  )")
DB.query("CREATE TABLE Users (
  id int NOT NULL,
  name varchar(255),
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (id)
  )")
DB.query("CREATE TABLE Pictures (
  id int NOT NULL,
  LocationID int NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (id)
  )")
DB.query("CREATE TABLE Locations (
  id int NOT NULL,
  PictureID int,
  directory varchar(255) NOT NULL,
  INDEX picture_ind (PictureID),
  PRIMARY KEY (id),
  FOREIGN KEY (PictureID) REFERENCES Pictures(id)
  )")
DB.query("CREATE TABLE UserPictures (
  UserID int NOT NULL,
  PictureID int NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(id),
  FOREIGN KEY (PictureID) REFERENCES Pictures(id)
  )")
DB.query("CREATE TABLE UserAlbums (
  UserID int NOT NULL,
  AlbumID int NOT NULL,
  FOREIGN KEY (UserID) REFERENCES Users(id),
  FOREIGN KEY (AlbumID) REFERENCES Albums(id)
  )")
DB.query("CREATE TABLE AlbumPictures(
  AlbumID int NOT NULL,
  PictureID int NOT NULL,
  FOREIGN KEY (AlbumID) REFERENCES Albums(id),
  FOREIGN KEY (PictureID) REFERENCES Pictures(id)
  )")
