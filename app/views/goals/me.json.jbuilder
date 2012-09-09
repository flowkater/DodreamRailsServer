json.(@user, :id, :name, :uid)

json.goals @user.goals do |json, goal|
	json.name goal.name
	json.statement goal.statement
	json.startdate goal.startdate
	json.enddate goal.enddate
end

