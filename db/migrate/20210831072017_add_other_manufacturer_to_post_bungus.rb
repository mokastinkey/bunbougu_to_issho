class AddOtherManufacturerToPostBungus < ActiveRecord::Migration[5.2]
  def change
    add_column :post_bungus, :other_manufacturer, :string
  end
end
