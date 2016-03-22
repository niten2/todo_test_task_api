json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :published_at
  json.author_nickname post.author_nickname
end
