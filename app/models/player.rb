class Player < ApplicationRecord

  belongs_to :game
  belongs_to :user
  has_many :pieces, dependent: :destroy

end