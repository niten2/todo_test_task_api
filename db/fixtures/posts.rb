10.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Company.name
  end

end
