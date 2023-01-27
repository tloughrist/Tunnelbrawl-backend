class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :host, foreign_key: { to_table: :users }
      t.integer :no_players
      t.string :current_turn
      t.integer :current_round
      t.string :status

      t.timestamps
    end
  end
end
