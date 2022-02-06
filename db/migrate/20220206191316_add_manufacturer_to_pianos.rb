class AddManufacturerToPianos < ActiveRecord::Migration[5.2]
  def change
    add_column :pianos, :manufacturer, :reference
  end
end
