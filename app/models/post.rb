class Post < ActiveRecord::Base

  belongs_to :user

  validate :title, :body, presence: true

  def published_at
    created_at
  end

  def author_nickname
    user.nickname ? user.nickname : "Not found"
  end

end
