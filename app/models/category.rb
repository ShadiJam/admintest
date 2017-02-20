class Category < ApplicationRecord
  has_many :lessons

  def name
    "#{category_name}"
  end
end
