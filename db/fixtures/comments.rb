5.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.author = 1
  end

end

15.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.author = 2
  end

end

10.times do

  Comment.seed do |post|
    post.body = Faker::Hipster.sentence
    post.author = 3
  end

end

