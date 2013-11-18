class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :category_id
      t.boolean :active
      t.string :slug

      t.timestamps
    end
  end
end
