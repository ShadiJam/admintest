class AddAttachmentMp3ToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :mp3
    end
  end

  def self.down
    remove_attachment :lessons, :mp3
  end
end
