class Post < ActiveRecord::Base

  belongs_to :user, foreign_key: :author, class_name: User

  validates :title, :body, presence: true

  before_create :set_published_at_if_empty

  def author_nickname
    user ? user.nickname : nil
  end

private

  def set_published_at_if_empty
    self.published_at = Time.now.utc if self.published_at.blank?
  end

end
