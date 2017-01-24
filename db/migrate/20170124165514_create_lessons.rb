class CreateLessons < ActiveRecord::Migration[5.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :video_url
      t.string :description
      t.boolean :published

      t.timestamps
    end
  end
end
