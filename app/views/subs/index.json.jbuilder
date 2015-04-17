json.array!(@subs) do |sub|
  json.extract! sub, :id, :title, :description, :moderator_id
  json.url sub_url(sub, format: :json)
end
