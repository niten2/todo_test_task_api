json.extract! @post, :id, :title, :body
json.published_at @post.published_at.strftime("%d %B, %H:%M:%S ")
json.author_nickname @post.author_nickname
