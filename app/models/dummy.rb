class Dummy
  attr_accessor :name, :number
  @@all = []
  @@errors = []

  def initialize(id, name, number)
    @name = name
    @id = id
    @number = number
  end

  def self.all
    results = DB.query(
      "SELECT * FROM Albums"
    )
    results.each do |row|
      @@all << row
    end
    @@all
  end

  def self.save(id, name, number)
    query = DB.prepare(
      "INSERT INTO Albums VALUES (?, ?, ?)"
      )
    query.execute(id, name, number)
  end

  def self.find(id)
    query = DB.prepare(
      "SELECT * FROM Albums WHERE id=?"
    )
    results = query.execute(id)
    if results.count == 1
      return results.first
    elsif results.count > 1
      @@errors << raise "Too many results found."
    else
      @@errors << raise "No result found."
    end
  end

  def self.update(params)
    if params.name != name
      update_record("name", params.name)
    end
    if params.number != number
      update_record("number", params.number)
    end
  end

  def self.destroy
    query = DB.prepare(
      "DELETE FROM Dummy WHERE id=?"
    )
    query.execute(id)
  end

  private

  def update_record(record, value)
    query = DB.prepare(
      "UPDATE Dummy SET ?=?"
    )
    query.execute(record, value)
  end
end