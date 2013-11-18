class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :url
      t.string :alt

      t.timestamps
    end
  end
end
