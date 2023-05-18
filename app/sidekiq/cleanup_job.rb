class CleanupJob
  include Sidekiq::Job

  def perform(game)
    game.destroy if game.status == 'pending'
  end
end
