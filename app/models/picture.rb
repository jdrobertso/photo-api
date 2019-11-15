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
    database.execute(
      "INSERT INTO pictures (name, location, user, album)
      VALUES (?, ?, ?, ?)", name, location, user, album
    )
  end
end