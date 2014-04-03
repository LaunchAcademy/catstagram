class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image, null: false
      t.integer :user_id, null: false
      t.text :description

      t.timestamps
    end
  end
end
