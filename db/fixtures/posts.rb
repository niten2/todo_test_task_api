10.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.author = 1
  end

end

5.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.author = 2
  end

end

15.times do

  Post.seed do |post|
    post.title = Faker::Company.name
    post.body = Faker::Hipster.sentence
    post.author = 3
  end

end

