json.posts current_user.goal_posts do |json, post|
	json.(post, :id, :summary, :tgoal, :user_id)
	json.pictures post.pictures do |json, picture|
		json.image picture.image_url(:thumb)
	end
end