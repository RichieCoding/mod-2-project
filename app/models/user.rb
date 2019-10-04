class User < ApplicationRecord
  has_secure_password

  has_one_attached :picture

  has_many :followed_users,  foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users

  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  has_many :sent_convos, class_name: "Conversation", foreign_key: :sender_id, dependent: :destroy
  has_many :received_convos, class_name: "Conversation", foreign_key: :recipient_id, dependent: :destroy

  validates_uniqueness_of :username

  def self.search(search)
    if search
      user = User.find_by(name: search)
      if user 
        self.where(name: user.name)
      else
        User.all
      end
    else
      User.all
    end
  end


def conversations 
  self.sent_convos + self.received_convos
end 

def filtered_conversations
  self.conversations.select do |convo|
    convo.messages.any?
  end 
end 

  

  def match

    @best_match = nil
    @best_match_score = 0
    User.all.reject {|u| u == self}.each do |user| 
      # luck_number = rand(20)
      score = 0
      if user.name[0] == self.name[0]
        score += 10
      end
      if user.age == self.age
        score += 10
      end
      if user.location == self.location
        score += 30
      end
      if user.bio == self.bio
        score += 100
      end
      if user.bio.split(" ").include?("love") == self.bio.split(" ").include?("love") 
        score += 30
      end
      if user.horoscope == "Aries" && self.horoscope == "Leo" || self.horoscope == "Sagiittarus" 
        score += 30
      end
      if user.horoscope == "Aries" && self.horoscope == "Leo" || self.horoscope == "Sagiittarus" 
        score += 30
      end
      if user.horoscope == "Taurus" && self.horoscope == "Capricorn" || self.horoscope == "Virgo" 
        score += 30
      end
      if user.horoscope == "Gemini" && self.horoscope == "Aquarius" || self.horoscope == "Libra" 
        score += 30
      end
      if user.horoscope == "Cancer" && self.horoscope == "Scorpio" || self.horoscope == "Pisces" 
        score += 30
      end
      if user.horoscope == "Leo" && self.horoscope == "Sagittarius" || self.horoscope == "Aries" 
        score += 30
      end
      if user.horoscope == "Virgo" && self.horoscope == "Capricorn" || self.horoscope == "Taurus" 
        score += 30
      end
      if user.horoscope == "Libra" && self.horoscope == "Gemini" || self.horoscope == "Aquarius" 
        score += 30
      end
      if user.horoscope == "Scorpio" && self.horoscope == "Pisces" || self.horoscope == "Cancer" 
        score += 30
      end
      if user.horoscope == "Sagittarius" && self.horoscope == "Leo" || self.horoscope == "Aries" 
        score += 30
      end
      if user.horoscope == "Capricorn" && self.horoscope == "Taurus" || self.horoscope == "Virgo" 
        score += 30
      end
      if user.horoscope == "Aquarius" && self.horoscope == "Gemini" || self.horoscope == "Libra" 
        score += 30
      end
      if user.horoscope == "Pisces" && self.horoscope == "Scorpio" || self.horoscope == "Cancer" 
        score += 30
      end
      if user.name == "Richie" && self.name = "Emily" 
        score += 10000
      end
      if user.name = "Emily" && self.name = "Richie"
        score += 9999999
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
