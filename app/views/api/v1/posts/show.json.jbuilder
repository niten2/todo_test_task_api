# json.extract! @post, :id, :title, :body, :published_at
json.extract! @post, :id, :title, :body
json.published_at @post.published_at.strftime("%d %B, %H:%M:%S ")
