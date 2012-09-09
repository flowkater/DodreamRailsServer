class CommentsController < InheritedResources::Base
	skip_before_filter :verify_authenticity_token
	respond_to :html, :json
	belongs_to :goal_post

	def create
		@comment = current_user.comments.build(params[:comment])
		@comment.goal_post_id = params[:goal_post_id]
		create!{ collection_url }
	end

	# protected
	# 	def begin_of_association_chain
	# 		current_user
	# 	end
end
