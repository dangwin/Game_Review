class Game < ApplicationRecord
has_many :reviews
has_many :reviewers, through: :reviews, source: :reviewer
belongs_to :creator, foreign_key: :creator_id, class_name: "User"
end
