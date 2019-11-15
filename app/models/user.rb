class User
  attr_accessor :name, :email, :pictures, :albums, :password
  @@all = []

  def initialize(name, email, password, pictures, albums)
    @name = name
    @email = email
    @password = password
    @pictures = pictures
    @albums = albums
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, email, password, pictures, albums)
    database.execute(
      "INSERT INTO users (name, email, password, pictures, albums)
      VALUES (?, ?, ?, ?, ?)", name, email, password, pictures, albums
    )
  end
end