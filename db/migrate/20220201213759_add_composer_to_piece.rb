class AddComposerToPiece < ActiveRecord::Migration[5.2]
  def change
    add_reference :pieces, :composer, foreign_key: true
  end
end
