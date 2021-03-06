require 'file_size_validator'
class Pic < ActiveRecord::Base
  belongs_to :user, inverse_of: :pics

  mount_uploader :image, ImageUploader

  validates_presence_of :title

  before_validation :set_title
  before_save :set_exifs
  validates :image,
    presence: true,
    file_size: {
      maximum: 4.megabytes.to_i
    }
protected
  def jpeg_exifs
    return {
      width: EXIFR::JPEG.new(self.image.path).width,
      height: EXIFR::JPEG.new(self.image.path).height,
      model: EXIFR::JPEG.new(self.image.path).model,
      time: EXIFR::JPEG.new(self.image.path).date_time,
      exposure: EXIFR::JPEG.new(self.image.path).exposure_time.to_s,
      f_number: EXIFR::JPEG.new(self.image.path).f_number.to_f
    }
  end

private
  def set_title
    if self.title.blank? && self.image.present?
      self.title = self.image.file.filename
    end
  end

  def set_exifs
    exs = {content_type: self.image.content_type}
    if ["image/jpeg", "image/jpg"].include?(self.image.content_type) && self.image.path && File.exist?(self.image.path)
      exs.merge! self.jpeg_exifs
    end
    self.exifs = exs
  end
end
