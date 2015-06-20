FactoryGirl.define do
  factory :pic do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root.join('db', 'random_images', "picture_#{(1..70).to_a.sample}.jpeg").to_s), "image/jpeg") }
    description { Faker::Lorem.paragraph }
    association :user
  end

end
