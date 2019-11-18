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
end