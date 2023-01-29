class Message < ApplicationRecord

  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :response, class_name: 'Message'

  validates :content, length: { maximum: 500, minimum: 1 }

end