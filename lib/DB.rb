require 'mysql2'
userpass = ENV["DB_USER_PASS"]
user, pass = userpass.split(':')

DB = Mysql2::Client.new(:host => "localhost", :username => user, :password => pass, :database => "photo_api_development") if Rails.env.development?
DB = Mysql2::Client.new(:host => "localhost", :username => user, :password => pass, :database => "photo_api_test") if Rails.env.test?
DB = Mysql2::Client.new(:host => "localhost", :username => user, :password => pass, :database => "photo_api_production") if Rails.env.production?

DB.query("DROP TABLE IF EXISTS Dummy")

DB.query("CREATE TABLE Dummy (
  id int NOT NULL UNIQUE,
  name varchar(255),
  number int,
  PRIMARY KEY (id)
  )")
