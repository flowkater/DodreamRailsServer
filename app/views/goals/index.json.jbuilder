json.goals @goals do |json, goal|
	json.(goal, :id, :name, :statement)
end