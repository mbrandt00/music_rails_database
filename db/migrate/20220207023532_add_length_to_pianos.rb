class AddLengthToPianos < ActiveRecord::Migration[5.2]
  def change
    add_column :pianos, :length, :integer
  end
end
