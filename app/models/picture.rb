class Picture < BasicModel
  def validate
    super
    validates_presence [:name, :image_data, :user_id]
  end
  many_to_one :album
  many_to_one :user
end