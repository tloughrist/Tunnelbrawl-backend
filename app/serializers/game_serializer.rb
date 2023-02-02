class GameSerializer < ActiveModel::Serializer

  attributes :id, :host_id, :no_players, :turn, :round, :phase, :status

end