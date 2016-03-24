class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :comments
  has_many :posts

  def self.send_report(start_date, end_date, email)
    EmailReportsJob.perform_now(start_date, end_date, email)
    true
  end

  def self.sort_by_rating
    User.all.sort_by(&:rating_for_sort)
  end

  def rating_for_sort
    posts.count + (comments.count.to_f/10)
  end

end
