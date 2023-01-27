class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.references :host, foreign_key: { to_table: :users }
      t.integer :no_players
      t.string :turn
      t.integer :round
      t.string :status

      t.timestamps
    end
  end
end
