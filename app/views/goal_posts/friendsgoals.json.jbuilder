json.users @users do |json, user|
	json.(user, :id, :uid)
	json.goals user.goals do |json, goal|
		# if goal.current
			json.name goal.name
			json.startdate goal.startdate
			json.enddate goal.enddate
			json.statement goal.statement
		# end
	end
end