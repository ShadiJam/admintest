class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.datetime :published_at
      t.string :uid
      t.references :lesson, foreign_key: true

      t.timestamps
    end
    add_index :videos, :uid
  end
end
