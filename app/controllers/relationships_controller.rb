class	RelationshipsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	respond_to :json

	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		redirect_to status: 200
	end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    redirect_to status: 200
  end
end