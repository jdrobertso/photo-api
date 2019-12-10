require 'sequel'
user_pass = ENV["DB_USER_PASS"]
DB = Sequel.connect("mysql2://#{user_pass}@localhost:3306/photo_api_development")
dummy = DB[:dummies]

100.times do
  dummy.insert(:name => (0...8).map { (65 + rand(26)).chr }.join, :number => rand * 100)
end

puts "Dummy count: #{dummy.count}"

puts "The average number is: #{dummy.avg(:number)}"