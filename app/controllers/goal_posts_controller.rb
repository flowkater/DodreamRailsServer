class GoalPostsController < InheritedResources::Base
	skip_before_filter :verify_authenticity_token
	respond_to :html, :json
	belongs_to :goal
	before_filter :authenticate_user!

	def create
		@goal_post = current_user.goal_posts.build(params[:goal_post])
		@goal_post.goal_id = params[:goal_id]
		create!{collection_url}
	end

	def new
		@goal_post = GoalPost.new
		@goal_post.pictures.build
		new!
	end

	def posts
		@users = current_user.followed_users | current_user.dreamers
		@posts = []
		@users.each do |user|
			@posts = @posts + user.goal_posts
		end
		@posts.sort!{|x,y| y.updated_at <=> x.updated_at}
	end

	def friendsgoals
		@users = friends(params[:uids])
	end

	protected

	def friends(uids)
		@users = []
		uids.each do |uid|
			@user = User.find_by_uid(uid)
			if @user
				@users << @user
			end
		end
		return @users
	end	
end
