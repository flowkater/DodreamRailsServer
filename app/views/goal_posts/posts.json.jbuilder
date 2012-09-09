json.posts @posts do |json, post|
	json.goal_id post.goal.id
	json.name post.user.name
	json.id post.id
	json.summary post.summary
	json.tgoal post.tgoal
	json.updated_at post.updated_at
	if post.like
		json.like post.like 
	else
		json.like "0"
	end
	if post.support
		json.support post.support
	else 
		json.support "0"
	end
	json.images post.pictures do |json, picture|
		json.image picture.image_url(:thumb)
	end
end