class GameSerializer < ActiveModel::Serializer

  attributes :id, :host_id, :no_players, :current_turn, :current_round, :status 

end