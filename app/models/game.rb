class Game < ApplicationRecord
has_many :users, through: :reviews
has_many :reviews
end
