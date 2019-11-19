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
    query = DB.prepare(
      "INSERT INTO Users VALUES (?, ?, ?, ?, ?)"
      )
    query.execute(name, email, password, pictures, albums)
  end

  def self.id(name)
    query = DB.prepeare(
      "SELECT id FROM Users WHERE name = ?"
    )
    result = query.execute(name)
    if result.count == 1
      return result.first
    elsif result.count > 1
      raise "Too many results found."
    else
      raise "No results found."
    end
  end
end