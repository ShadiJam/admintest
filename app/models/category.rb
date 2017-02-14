class Category < ApplicationRecord
  has_many :lessons, :inverse_of => :category
end
