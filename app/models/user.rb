class User < ApplicationRecord
    has_many :games, foreign_key: :creator_id
    has_many :reviews, foreign_key: :reviewer_id,  dependent: :destroy
    has_many :reviewed_games, through: :reviews, source: :game 
    has_secure_password 
end
