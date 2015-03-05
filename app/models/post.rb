class Post < ActiveRecord::Base
  has_attached_file :hero_image, styles: {
    thumb: ['32x32#', 'png'],
    medium: ['800x400', 'png'],
    large: ['1200x600', 'png']
  }
  validates_attachment_content_type :hero_image, :content_type => /\Aimage\/.*\Z/
end
