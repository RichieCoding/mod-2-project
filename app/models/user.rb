class User < ApplicationRecord
  has_secure_password

  has_one_attached :picture

  has_many :followed_users,  foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  validates_uniqueness_of :username


  

end
