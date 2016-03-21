class Post < ActiveRecord::Base

  belongs_to :user

  validates :title, :body, presence: true

  def published_at
    created_at
  end

  def author_nickname
    user.nickname ? user.nickname : "Not found"
  end

end
