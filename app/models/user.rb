class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :comments
  has_many :posts

  def self.send_report(start_date = "", end_date = "", email = "")
    begin
      Date.parse(start_date) || Date.parse(end_date)
      EmailReportsJob.perform_later(start_date, end_date, email)
    rescue ArgumentError
      return false
    end
  end

  def self.sort_by_rating(start_date = nil, end_date = nil)
    User.all.sort_by {|a| a.rating(start_date, end_date) }
  end

  def rating(start_date= nil, end_date = nil)

    if start_date.nil? || end_date.nil?
      posts.count + (comments.count.to_f/10)
    else
      count_posts    = self.posts_between_date(start_date, end_date).count
      count_comments = self.comments_between_date(start_date, end_date).count

      return count_posts + (count_comments.to_f/10)
    end
  end

  def posts_between_date(start_date, end_date)
    self.posts.where(published_at: start_date..end_date)
  end

  def comments_between_date(start_date, end_date)
    self.comments.where(published_at: start_date..end_date)
  end

end
