class PieceSerializer < ActiveModel::Serializer

  attributes :id, :game_id, :player_id, :type, :first_move, :location

end