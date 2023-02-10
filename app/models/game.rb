class Game < ApplicationRecord

  belongs_to :host, class_name: 'User'
  has_one :board, dependent: :destroy
  has_many :players, dependent: :destroy

  validates :no_players, numericality: { less_than: 5 }, allow_blank: true

  def make_board()
    game = self
    board = Board.create(game_id: game.id)
    board.empty
  end

  def package()
    {game: {**self.attributes, host: self.host.username, players: self.players}, board: self.board}
  end
end