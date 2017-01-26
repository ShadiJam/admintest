class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :blog_name
      t.text :blog_content

      t.timestamps
    end
  end
end
