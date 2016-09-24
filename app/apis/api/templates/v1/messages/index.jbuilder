json.status 200
json.data @messages do |message|
  json.(message, :id, :message)
  json.created_at message.created_at.strftime("%Y-%m-%d")
  json.user do
    json.(message.user, :username)
  end
end
