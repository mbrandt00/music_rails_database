class CreatePianos < ActiveRecord::Migration[5.2]
  def change
    create_table :pianos do |t|
      t.string :model
      t.string :style
      t.integer :price
      t.string :color
      t.boolean :acoustic

      t.timestamps
    end
  end
end
