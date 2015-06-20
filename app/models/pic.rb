require 'file_size_validator'
class Pic < ActiveRecord::Base
  belongs_to :user, inverse_of: :pics

  mount_uploader :image, ImageUploader

  validates_presence_of :title

  before_validation  :set_title
  validates :image,
    presence: true,
    file_size: {
      maximum: 5.megabytes.to_i
    }

  def exifs
    exifs = {}
    exifs[:content_type] = self.image.content_type
    Rails.logger.debug "CONTENT: #{["image/jpeg", "image/jpg"].include?(self.image.content_type)}"
    if ["image/jpeg", "image/jpg"].include?(self.image.content_type)
      exifs[:content_type] = self.image.content_type
      exifs[:width] = EXIFR::JPEG.new(self.image.path).width
      exifs[:height] = EXIFR::JPEG.new(self.image.path).height
      exifs[:model] = EXIFR::JPEG.new(self.image.path).model
      exifs[:time] = EXIFR::JPEG.new(self.image.path).date_time
      exifs[:exposure] = EXIFR::JPEG.new(self.image.path).exposure_time.to_s
      exifs[:f_number] = EXIFR::JPEG.new(self.image.path).f_number.to_f
    end
    return exifs
  end

private
  def set_title
    if self.title.blank? && self.image.present?
      self.title = self.image.file.filename
    end
  end
end
