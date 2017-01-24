class DeviseCreateAdmins < ActiveRecord::Migration
  def self.up
    create_table(:admins) do |t|
      t.database_authenticatable :null => false
      t.rememberable
      t.boolean :god_mode, :default => false
      t.boolean :view_only, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
