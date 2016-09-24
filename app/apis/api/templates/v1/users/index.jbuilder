json.status 200
json.data @users do |user|
  json.(user, :id, :username, :email, :tel, :partment)
  json.created_at user.created_at.to_s(:db)
  json.updated_at user.updated_at.to_s(:db)
end
