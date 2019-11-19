require 'mysql2'

DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_development") if Rails.env.development?
DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_test") if Rails.env.test?
DB = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "my_password", :database => "photo_api_production") if Rails.env.production?

DB.query("DROP TABLE IF EXISTS Dummy")

DB.query("CREATE TABLE Dummy (
  id int NOT NULL,
  name varchar(255),
  number int,
  PRIMARY KEY (id)
  )")
