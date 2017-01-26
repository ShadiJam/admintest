class Blog < ApplicationRecord
  validates :blog_name, presence: true
end
