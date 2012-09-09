json.comments @comments do |json, comment|
	json.content comment.content
	json.user_uid comment.user.uid
end