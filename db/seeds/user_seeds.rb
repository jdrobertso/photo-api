require 'faker'

DB.transaction do
  100.times do
    password = Faker::Lorem.word
    user = User.new(username: Faker::Name.first_name, email: Faker::Internet.email, password: password, password_confirmation: password)
    pictures = new_pictures(user)
    albums = new_albums(user)
    user.pictures = pictures
    user.albums = albums
    user.save
  end

  def new_pictures(user)
    pictures = []
    20 times do
      pictures << Picture.new(name: Faker::Lorem.word, user: user)
    end
    pictures
  end

  def new_albums(user)
    albums = []
    20 times do
      album = Album.new(name: Faker::Lorem.word, user: user)
      pictures = [new_pictures(user)]
      album.pictures = pictures
      albums << album
      album.save
    end
    albums
  end
end
