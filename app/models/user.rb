class User < ActiveRecord::Base
  has_many :games, foreign_key: :creator_id
  has_many :reviews, foreign_key: :reviewer_id,  dependent: :destroy
  has_many :reviewed_games, through: :reviews, source: :game 
  validates :email, uniqueness: true, presence: true
  has_secure_password 

  def full_name
      self.first_name + " " + self.last_name
    end
    
    def self.create_from_omniauth(auth)
      User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
          u.email = auth['info']['email']
          u.first_name = auth['info']['first_name']
          u.last_name = auth['info']['last_name']
          u.password = SecureRandom.hex(16)
      end
  end
end
    



