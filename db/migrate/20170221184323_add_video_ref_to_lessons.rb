class AddVideoRefToLessons < ActiveRecord::Migration[5.0]
  def change
    add_reference :lessons, :video, foreign_key: true
  end
end
