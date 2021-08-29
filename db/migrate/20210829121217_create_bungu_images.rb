class CreateBunguImages < ActiveRecord::Migration[5.2]
  def change
    create_table :bungu_images do |t|

      t.timestamps
    end
  end
end
