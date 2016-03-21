class Comment < ActiveRecord::Base

  belongs_to :user

  validate :body, presence: true

end
