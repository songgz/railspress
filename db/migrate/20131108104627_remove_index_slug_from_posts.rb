class RemoveIndexSlugFromPosts < ActiveRecord::Migration
  def change
  	remove_index :posts, :slug
  end
end
