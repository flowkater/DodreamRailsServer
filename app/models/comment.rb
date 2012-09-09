class Comment < ActiveRecord::Base
	belongs_to :user
  belongs_to :goal_post
end
