class User < ApplicationRecord
  has_secure_password

  has_one_attached :picture

  has_many :followed_users,  foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :sent_convos, class_name: "Conversation", foreign_key: :sender_id
  has_many :received_convos, class_name: "Conversation", foreign_key: :recipient_id

  validates_uniqueness_of :username

def conversations 
  self.sent_convos + self.received_convos
end 

def filtered_conversations
  self.conversations.select do |convo|
    convo.messages.any?
  end 
end 
  

end
