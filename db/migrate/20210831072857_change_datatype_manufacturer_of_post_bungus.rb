class ChangeDatatypeManufacturerOfPostBungus < ActiveRecord::Migration[5.2]
  def change
    change_column :post_bungus, :manufacturer, :integer
  end
end
