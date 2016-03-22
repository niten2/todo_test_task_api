class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :comments
  has_many :posts

end
