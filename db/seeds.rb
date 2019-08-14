# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Photo.all do |p|
  p.image.purge
end

Comment.destroy_all
Photo.destroy_all
User.destroy_all

Dir.chdir('sample_photos')

20.times do |i|
  # variables for creating User
  username = Faker::FunnyName.name
  email = Faker::Internet.email
  password = Faker::Internet.password(min_length: 8)
  # variables for creating photos
  photo_name = Faker::GreekPhilosophers.name
  photo_description = Faker::GreekPhilosophers.quote

  user = User.new(user_name: username, email: email, password: password)
  user.save

  f = {:io => File.open("image#{i}.jpg"), :filename => "image#{i}", :content_type => 'image/jpg'}
  photo = user.photos.new(name: photo_name, description: photo_description)
  if photo.image.attach(f)
    p "Photo attached successfully!"
  end
  photo.save
end

Photo.all.each do |photo|
  rand(1..10).times do
    user = User.all.sample
    random_content_body = Faker::Hipster.paragraph_by_chars
    photo.comments.new(content_body: random_content_body, user_id: user.id)
    photo.save
  end
end

User.new(user_name: "test", email: "t@t.com", password: "password").save
