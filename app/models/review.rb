class Review < ActiveRecord::Base
    belongs_to :game
    belongs_to :reviewer, foreign_key: :reviewer_id, class_name: "User"
end
