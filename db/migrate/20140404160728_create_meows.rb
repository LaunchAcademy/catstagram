class CreateMeows < ActiveRecord::Migration
  def change
    create_table :meows do |t|
      t.integer :user_id, null: false
      t.integer :post_id, null: false

      t.timestamps
    end

    # This will make sure that no two rows can have the same combination of
    # post_id and user_id.
    add_index :meows, [:post_id, :user_id], unique: true
  end
end
