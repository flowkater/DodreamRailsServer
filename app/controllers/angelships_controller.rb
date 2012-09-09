class AngelshipsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	before_filter :authenticate_user!
	respond_to :json

	def create
		@user = User.find(params[:angelship][:dreamer_id])
		current_user.angel!(@user)
		@goals = @user.goals
		redirect_to status: 200
	end

	def destroy
		@user = Angelship.find(params[:id]).dreamer
		current_user.unangel!(@user)
		redirect_to status: 200
	end
end