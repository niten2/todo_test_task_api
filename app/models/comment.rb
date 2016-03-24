class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :user, foreign_key: :author, class_name: User

  before_create :set_published_at_if_empty

private

  def set_published_at_if_empty
    self.published_at = Time.now if self.published_at.blank?
  end

end
