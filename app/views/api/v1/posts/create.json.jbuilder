json.extract! @post, :id, :title, :body
json.published_at @post.published_at
json.author_nickname @post.author_nickname
