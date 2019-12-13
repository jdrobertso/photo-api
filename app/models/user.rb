class User < BasicModel
  plugin :secure_password
  def validate
    super
    validates_presence [:username, :email]
  end
  one_to_many :albums
  one_to_many :pictures
end