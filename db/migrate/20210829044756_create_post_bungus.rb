class CreatePostBungus < ActiveRecord::Migration[5.2]
  def change
    create_table :post_bungus do |t|

      t.integer :user_id
      t.integer :genre_id
      t.string  :bungu_name
      t.string  :manufacturer
      t.string  :catchphrase
      t.float   :rate
      t.text    :thought
      t.integer :price
      t.string  :place

      t.timestamps
    end
  end
end
