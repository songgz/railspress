class AddPickupToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :pickup, :boolean
  end
end
