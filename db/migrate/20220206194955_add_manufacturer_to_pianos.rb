class AddManufacturerToPianos < ActiveRecord::Migration[5.2]
  def change
    add_reference :pianos, :manufacturer, foreign_key: true
  end
end
