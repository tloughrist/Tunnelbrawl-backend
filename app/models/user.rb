class User < ApplicationRecord

  has_many :owner_games, class_name: 'Game', foreign_key: 'host_id', dependent: :destroy
  has_many :players, foreign_key: 'user_id', dependent: :destroy
  has_many :games, through: :players, dependent: :destroy
  has_many :pieces, through: :players
  has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :receiver_messages, class_name: 'Message', foreign_key: 'receiver_id', dependent: :destroy
  has_many :friender_friendships, class_name: 'Friendship', foreign_key: 'friender_id', dependent: :destroy
  has_many :friendee_friendships, class_name: 'Friendship', foreign_key:  'friendee_id', dependent: :destroy
  has_many :frienders, class_name: 'User', through: :friendee_friendships
  has_many :friendees, class_name: 'User', through: :friender_friendships

  validates :username, uniqueness: true
  validates :username, length: { minimum: 5 }, allow_blank: true
  validates :email, presence: true
  validates :password, length: { minimum: 8 }, allow_blank: true

  def friends()
    friendees = self.friendees
    frienders = self.frienders
    friends = friendees + frienders
  end

end