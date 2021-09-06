class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :post_bungu_id

      t.timestamps
      t.index [:user_id, :post_bungu_id], unique: true
    end
  end
end
