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
    database.execute(
      "INSERT INTO locations (picture, directory)
      VALUES (?, ?)", picture, directory
    )
  end
end