class GoalsController < InheritedResources::Base
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	respond_to :html, :json

	def create
		@goal = current_user.goals.create!(params[:goal])
		create!{collection_url}
	end

	def me
		@user = current_user
	end
end
