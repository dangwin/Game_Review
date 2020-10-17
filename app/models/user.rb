class User < ApplicationRecord
    has_many :games, through: :reviews
    has_many :reviews
end
