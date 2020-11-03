class User < ActiveRecord::Base
  has_many :games, foreign_key: :creator_id
  has_many :reviews, foreign_key: :reviewer_id,  dependent: :destroy
  has_many :reviewed_games, through: :reviews, source: :game 
  validates :email, uniqueness: true, presence: true
  has_secure_password 

  def full_name
      self.first_name + " " + self.last_name
    end
    



end