class RemoveVideoUrlFromLesson < ActiveRecord::Migration[5.0]
  def change
    remove_column :lessons, :video_url, :string
  end
end
