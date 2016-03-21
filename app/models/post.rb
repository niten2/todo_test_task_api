class Post < ActiveRecord::Base

  belongs_to :user

  validates :title, :body, presence: true

  before_create :set_published_at
  # def published_at
  #   created_at
  # end

  def author_nickname
    user.nickname ? user.nickname : "Not found"
  end

private

  def  set_published_at
    ActiveRecord::Base.transaction do
      self.published_at = Time.now
    end
  end


end
