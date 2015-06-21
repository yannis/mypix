# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:

  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    if Rails.env.test?
      super
    else
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end

  version :thumb_xs do
    process :resize_to_fill => [30, 30]
  end
  version :thumb_s do
    process :resize_to_fill => [60, 60]
  end
  version :thumb do
    process :resize_to_fill => [200, 200]
  end
  version :thumb_l do
    process :resize_to_fill => [300, 300]
  end
  version :x_small do
    process :resize_to_limit => [100, 100]
  end
  version :small do
    process :resize_to_limit => [200, 200]
  end
  version :medium do
    process :resize_to_limit => [400, 400]
  end
  version :large do
    process :resize_to_limit => [600, 600]
  end
  version :x_large do
    process :resize_to_limit => [1000, 1000]
  end

end
