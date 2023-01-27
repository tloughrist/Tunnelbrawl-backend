class Game < ApplicationRecord

  belongs_to :host, class_name: 'User'
  has_many :players, class_name: 'User', dependent: :destroy
  has_many :pieces, dependent: :destroy

end
