class Lesson < ApplicationRecord
  belongs_to :category, :inverse_of => :lessons
  accepts_nested_attributes_for :category, :allow_destroy => false

  has_many :videos
  validates :videos, :presence => true

  has_attached_file :image, styles: {thumb: "100x100#"}
  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"] }

  has_attached_file :mp3
  validates_attachment :mp3, :content_type => { :content_type => ["audio/mpeg", 'audio/mp3']}, :file_name => { :matches => [/mp3\Z/] }
end
