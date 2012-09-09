Warden::Strategies.add(:uid) do
  def valid?
    params['uid']
  end
  
  def authenticate!
    user = User.find_by_uid(params['uid'])
    if user
      success! user
    else
      fail "Invalid uid"
    end
  end
end