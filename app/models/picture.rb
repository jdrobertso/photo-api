class User < BasicModel
  def validate
    super
    validates_presence [:name, :image_data, :user_id]
  end
  many_to_one :albums
  many_to_one :users
end