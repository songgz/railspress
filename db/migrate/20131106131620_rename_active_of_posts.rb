class RenameActiveOfPosts < ActiveRecord::Migration
  def up
    rename_column :posts, :active, :published
  end

  def down
    rename_column :posts, :published, :active
  end
end
