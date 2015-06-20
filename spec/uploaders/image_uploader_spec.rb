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

  context 'the thumb version' do
    it {expect(@uploader.thumb).to have_dimensions(200, 200)}
  end

  context 'the thumb_xs version' do
    it {expect(@uploader.thumb_xs).to be_no_larger_than(30, 30)}
  end

  context 'the thumb_l version' do
    it {expect(@uploader.thumb_l).to be_no_larger_than(300, 300)}
  end

  # it "should make the image readable only to the owner and not executable" do
  #   @uploader.should have_permissions(0600)
  # end
end
