class Lesson < ApplicationRecord
  belongs_to :category

  has_attached_file :image, styles: {thumb: "100x100#"}
  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"] }

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", 'audio/mp3']}, :file_name => { :matches => [/mp3\Z/] }
end
