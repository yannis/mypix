require 'faker'
User.destroy_all
User.connection.execute('ALTER SEQUENCE users_id_seq RESTART WITH 1')
Pic.connection.execute('ALTER SEQUENCE pics_id_seq RESTART WITH 1')

3.times do |i|
  user = User.new name: Faker::Name.name, email: Faker::Internet.email, password: "mypixpassword"
  if user.save!
    p "User #{user.name} created (id: #{user.id})"

    5.times do |i|
      begin
        pic = Pic.create! description: Faker::Lorem.paragraph, user: user, image: Rack::Test::UploadedFile.new(File.join(Rails.root.join('db', 'random_images', "picture_#{(1..70).to_a.sample}.jpeg").to_s))
        p "Pic #{pic.id} created (user #{pic.user.name}, id: #{pic.id})"
      rescue Exception => e
        p e
      end
    end
  else
    p "unable to save user '#{user.name}'"
  end
end

if User.first.update_attributes! email: "test@mypix.com", name: "Test User"
  p "Test user created"
end

