class Dummy < Sequel::Model
  plugin :validation_helpers
  def validate
    super
    validates_presence [:name, :number]
  end
end