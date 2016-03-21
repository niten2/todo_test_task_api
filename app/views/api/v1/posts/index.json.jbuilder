json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body
  # json.url category_url(category, format: :json)
end
