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
    @@all
  end

  def self.save(id, name, number)
    query = DB.prepare(
      "INSERT INTO Dummy VALUES (?, ?, ?)"
      )
    query.execute(id, name, number)
    add_to_all(id)
    true
  end

  def self.find(id)
    query = DB.prepare(
      "SELECT * FROM Dummy WHERE id=?"
    )
    results = query.execute(id)
    return results.first if results.count == 1
    false
  end

  def self.update(params)
    if params.name != name
      update_record("name", params.name)
    end
    if params.number != number
      update_record("number", params.number)
    end
    true
  end

  def self.destroy
    query = DB.prepare(
      "DELETE FROM Dummy WHERE id=?"
    )
    query.execute(id)
    delete_from_all(id)
    true
  end

  private

  def update_record(record, value)
    query = DB.prepare(
      "UPDATE Dummy SET ?=? WHERE id=?"
    )
    query.execute(record, value, id)
    delete_from_all(id)
    add_to_all(id)
  end

  def self.delete_from_all(id)
    @@all.delete_if { |record| record.id == id }
  end

  def self.add_to_all(id)
    result = Dummy.find(id)
    @@all << result
  end
end