json.array!(@replies) do |reply|
  json.extract! reply, :id, :user_id, :post_id, :text
  json.url reply_url(reply, format: :json)
end
