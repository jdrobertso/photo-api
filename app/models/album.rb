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
    query = DB.prepare(
      "INSERT INTO Albums VALUES (?, ?, ?)"
      )
    query.execute(name, user, pictures)
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

  def self.update(params)

  end
end