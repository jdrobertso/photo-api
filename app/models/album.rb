class Album
  attr_accessor :name, :user, :pictures
  @@all = []

  def initialize(name, user, pictures)
    @name = name
    @pictures = pictures
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, user, pictures)
    database.execute(
      "INSERT INTO albums (name, user, pictures)
      VALUES (?, ?, ?)", name, user, pictures
    )
  end
end