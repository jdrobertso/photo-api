class Album < BasicModel
  def validate
    super
    validates_presence [:name, :user_id]
  end
  one_to_many :pictures
  many_to_one :user
end