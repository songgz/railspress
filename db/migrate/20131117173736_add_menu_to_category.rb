class AddMenuToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :menu, :boolean
  end
end
