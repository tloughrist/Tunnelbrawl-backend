require 'sidekiq'

class CleanupJob
  include Sidekiq::Job

  def perform(game_id)
    game = Game.find(game_id)
    puts game[:status]
    game.destroy if game[:status] == 'pending'
  end
end
