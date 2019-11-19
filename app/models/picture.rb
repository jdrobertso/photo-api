class Picture
  attr_accessor :name, :location, :user, :album
  @@all = []

  def initialize(name, location, user, album)
    @name = name
    @location = location
    @user = user
    @album = album
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, location, user, album)
    query = DB.prepare(
      "INSERT INTO Pictures VALUES (?, ?, ?, ?)"
      )
    query.execute(name, location, user, album)
  end

  def self.id(name)
    query = DB.prepeare(
      "SELECT id FROM Albums WHERE name = ?"
    )
    result = query.execute(name)
    if result.count == 1
      return result.first
    elsif result.count > 1
      raise "Too many results found."
    else
      raise "No result found."
    end
  end
end