class CreateBunguImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bungu_images do |t|
      
      t.integer :post_bungu_id, null: false
      t.string  :image_id

      t.timestamps
    end
  end
end
