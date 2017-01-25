class Lesson < ApplicationRecord
  has_attached_file :image, styles: {thumb: "100x100#"}
  validates_attachment :image,
                        content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"] }
end
