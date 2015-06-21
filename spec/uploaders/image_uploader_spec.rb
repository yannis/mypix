require 'rails_helper'
require 'carrierwave/test/matchers'

RSpec.describe ImageUploader, type: :model do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    @uploader = ImageUploader.new(@user, :avatar)
    @uploader.store!(File.open(Rails.root.join('db', 'random_images', "picture_#{(1..70).to_a.sample}.jpeg").to_s))
  end

  after do
    ImageUploader.enable_processing = false
    @uploader.remove!
  end

  it {expect(@uploader.thumb).to have_dimensions(200, 200)}

  it {expect(@uploader.thumb_xs).to be_no_larger_than(30, 30)}

  it {expect(@uploader.thumb_l).to be_no_larger_than(300, 300)}

  it {expect(@uploader.x_small).to have_dimensions(100, 60)}
end
