class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :opus
      t.integer :number, null:true
      t.string :type_of_piece
      t.string :nickname, null:true
      t.integer :composition_date
      t.boolean :multiple_instruments
      t.string :main_instrument
      t.string :key_signature
      t.timestamps
    end
  end
end
