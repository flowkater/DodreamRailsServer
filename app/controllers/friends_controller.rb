class FriendsController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def index
		@users = friends(uids)	
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
	end
end
