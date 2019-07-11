class User < ApplicationRecord
  has_secure_password

  has_one_attached :picture

  has_many :followed_users,  foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :conversations, foreign_key: :sender_id

  validates_uniqueness_of :username

  

  def match

    @best_match = nil
    @best_match_score = 0
    User.all.reject {|u| u == self}.each do |user| 
      # luck_number = rand(20)
      score = 0
      if user.age == self.age
        score += 10
      end
      if user.location == self.location
        score += 30
      end
      if user.bio == self.bio
        score += 100
      end
      if user.name == "Gia" && self.name == "Sean"
        score += 500
      end
      if @best_match_score < score
        @best_match_score = score
        @best_match = user
      end
    end
    if @best_match == nil
      @best_match = User.find_by(name: "Rick Sanchez")
      return @best_match
    else
      return @best_match
    end
  end

 
  

  


end
