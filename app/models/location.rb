class Location
  attr_accessor :picture, :directory
  @@all = []

  def initialize(picture, directory)
    @picture = picture
    @directory = directory
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(picture, directory)
    query = DB.prepare(
      "INSERT INTO Locations VALUES (?, ?)"
      )
    query.execute(picture, directory)
  end

  def self.id(name)
    query = DB.prepeare(
      "SELECT id FROM Locations WHERE name = ?"
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