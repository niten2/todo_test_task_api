10.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.user_id = 1
  end

end
