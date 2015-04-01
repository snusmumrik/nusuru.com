json.array!(@posts) do |post|
  json.extract! post, :id, :user_id, :title, :location, :date, :model, :chassis_number, :registration_number, :features, :situation
  json.url post_url(post, format: :json)
end
