10.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Lorem.words(5)
    post.user_id = 1
  end

end
