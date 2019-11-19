class Dummy < BasicModel
  def validate
    super
    validates_presence [:name, :number]
  end
end