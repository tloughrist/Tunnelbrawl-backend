class CreatePieces < ActiveRecord::Migration[7.0]
  def change
    create_table :pieces do |t|
      t.references :game, foreign_key: { to_table: :games }
      t.references :player, foreign_key: { to_table: :players }
      t.string :rank
      t.boolean :first_move
      t.integer :location

      t.timestamps
    end
  end
end
