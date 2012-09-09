json.(@goal_post, :id, :summary, :tgoal, :user_id)
if @goal_post.like
	json.like @goal_post.like 
else
	json.like "0"
end	
if @goal_post.support
	json.support @goal_post.support
else
	json.support "0"
end
json.pictures @goal_post.pictures do |json, picture|
	json.image picture.image_url
end
json.comments @goal_post.comments do |json, comment|
	json.content comment.content
	json.name comment.user.name
end
