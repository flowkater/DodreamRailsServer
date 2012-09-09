class Goal < ActiveRecord::Base
	belongs_to :user
	has_many :goal_posts
	has_many :comments, through: :goal_posts
end
