require 'faker'

def new_pictures(user)
  20.times do
    picture = fake_picture(user)
    picture.save
    user.add_picture(picture)
  end
end

def fake_picture(user)
  Picture.new(name: Faker::Lorem.word, user: user, image_data: 'x')
end

def new_albums(user)
  20.times do
    album = Album.new(name: Faker::Lorem.word, user: user)
    album.save
    20.times do
      album.add_picture(fake_picture(user))
    end
    album.save
    user.add_album(album)
  end
end

100.times do
  password = Faker::Lorem.word
  user = User.new(username: Faker::Name.unique.first_name, email: Faker::Internet.unique.email, password: password, password_confirmation: password)
  user.save
  new_pictures(user)
  new_albums(user)
  puts "User done, id: #{user.id}"
  user.save
end
